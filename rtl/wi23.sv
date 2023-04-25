module wi23 
import wi23_defs::*;
(
  input        clk, // 50MHz
  input        rst_n,
  output       halt,
  // Switches and LEDs
  input  [9:0] SW,
  output [9:0] LEDR,
  // PS/2
  input        PS2_CLK,
  input        PS2_DAT,
  // UART
  input        RX,
  output       TX,
  // VGA
  // VGA clock is an input to this module because it is generated in the PLL.
  input        VGA_CLK, // 25MHz
  output       VGA_BLANK_N,
  output [7:0] VGA_B,
  output [7:0] VGA_G,
  output       VGA_HS,
  output [7:0] VGA_R,
  output       VGA_SYNC_N,
  output       VGA_VS
);

/////////////////////
// memory signals //
///////////////////

logic [PC_WIDTH-1:0]    iaddr;
logic [PC_WIDTH-1:0]    inst;
logic [DATA_WIDTH-1:0]  inst_mem_to_proc;
logic [IMEM_DEPTH-1:0]  daddr_im;
logic [DATA_WIDTH-1:0]  daddr;
logic [DATA_WIDTH-1:0]  data_mem_to_proc_map;
logic [DATA_WIDTH-1:0]  data_mem_to_proc_dmem;
logic [DATA_WIDTH-1:0]  data_mem_to_proc_dmem_muxed;
logic [DATA_WIDTH-1:0]  data_proc_to_mem_muxed; 
logic [DATA_WIDTH-1:0]  data_proc_to_mem;
logic [DATA_WIDTH-1:0]  data_proc_to_mem_be;
logic [1:0]             data_proc_to_mem_gran;
logic                   ldcr;
logic [3:0]             we_map;
logic [3:0]             re_map;
logic [3:0]             we_dmem;

///////////////////////////////
// Processor instantiation //
////////////////////////////

proc PROC (
   // Clock and reset
   .clk                       (clk), 
   .rst_n                     (rst_n),
   // Error and halt status
   .err_o                     (), 
   .halt_o                    (halt), 
   // Instruction memory signals
   .iaddr_o                   (iaddr), 
   .inst_i                    (inst), 
   .ldcr_o                    (ldcr),
   // Data memory signals
   .daddr_o                   (daddr), 
   .we_o                      (we_map), 
   .re_o                      (re_map),
   .data_proc_to_mem_o        (data_proc_to_mem), 
   .data_mem_to_proc_i        (data_mem_to_proc_map),
   .data_proc_to_mem_gram_o   (data_proc_to_mem_gran)
);

/////////////////////////
// Instruction memory ///
/////////////////////////

// Word-aligned IMEM. Make daddr word-aligned.
assign daddr_im = daddr >> 2;

imem IMEM (
  .clk      (clk),
  // We truncate address here but this is OK. It will just fetch 0s (HALT) if out of range
  .addr_i   (iaddr[IMEM_DEPTH-1:0]),
  .daddr_i  (daddr_im[IMEM_DEPTH-1:0]),
  .inst_o   (inst[PC_WIDTH-1:0]),
  .data_o   (inst_mem_to_proc[DATA_WIDTH-1:0])
);

//////////////////
// Data memory //
//////////////// 

// Shift data write to DMEM for sub-word accesses.
// ----  Address --->
// High Byte | Byte | Byte | Low Byte
logic [4:0] shift_ldb;
logic [REGFILE_WIDTH-1:0] data_proc_to_mem_ldb;
assign shift_ldb = {~daddr[1:0], 3'b000}; // 00 - 24, 01 - 16, 10 - 8, 11 - 0
assign data_proc_to_mem_ldb = data_proc_to_mem << shift_ldb;

logic [4:0] shift_ldh;
logic [REGFILE_WIDTH-1:0] data_proc_to_mem_ldh;
assign shift_ldh = daddr[1:0] == 2'b00 ? 'd16 :
                   daddr[1:0] == 2'b01 ? 'd08 : 'd00 ; // We don't support [1:0] == 2'b11 case
assign data_proc_to_mem_ldh = data_proc_to_mem << shift_ldh;

assign data_proc_to_mem_muxed = data_proc_to_mem_gran == 2'b01 ? data_proc_to_mem_ldb : // Byte Access  
                                data_proc_to_mem_gran == 2'b10 ? data_proc_to_mem_ldh : // Half-Word Access  
                                                                 data_proc_to_mem     ; // Word Access 

dmem DMEM (
  .clk      (clk),
  .we_i     (we_dmem),
  // Also OK to truncate address, we have already checked that it's in range (otherwise we would not be enabled).
  .addr_i   (daddr[DMEM_DEPTH-1:0]),
  .wdata_i  (data_proc_to_mem_muxed),
  .rdata_o  (data_mem_to_proc_dmem)
);

// Shift data read from DMEM for sub-word accesses.
// ----  Address --->
// High Byte | Byte | Byte | Low Byte
logic [4:0] rshift_ldb;
logic [REGFILE_WIDTH-1:0] data_mem_to_proc_ldb;
assign rshift_ldb = {~daddr[1:0], 3'b000}; // 00 - 24, 01 - 16, 10 - 8, 11 - 0
assign data_mem_to_proc_ldb = data_mem_to_proc_dmem >> rshift_ldb;

logic [4:0] rshift_ldh;
logic [REGFILE_WIDTH-1:0] data_mem_to_proc_ldh;
assign rshift_ldh = daddr[1:0] == 2'b00 ? 'd16 :
                    daddr[1:0] == 2'b01 ? 'd08 : 'd00 ; // We don't support [1:0] == 2'b11 case
assign data_mem_to_proc_ldh = data_mem_to_proc_dmem >> rshift_ldh;

always_comb begin
  data_mem_to_proc_dmem_muxed = 32'h0;
   casez (data_proc_to_mem_gran)
      2'b00 : data_mem_to_proc_dmem_muxed = data_mem_to_proc_dmem; // Word Access
      2'b01 : data_mem_to_proc_dmem_muxed = 32'h000000FF & data_mem_to_proc_ldb; // Byte Access
      2'b10 : data_mem_to_proc_dmem_muxed = 32'h0000FFFF & data_mem_to_proc_ldh; // Half-Word Access
      default : begin end // Unsupported Access
   endcase
end

///////////////////////////////////////
// Instantiate VGA Timing Generator //
/////////////////////////////////////
wire [9:0] xpix;					// current X coordinate of VGA
wire [8:0] ypix;					// current Y coordinate of VGA
VGA_timing iVGATM(
	.clk25MHz     (VGA_CLK), 
  .rst_n        (rst_n), 
  .VGA_BLANK_N  (VGA_BLANK_N),
  .VGA_HS       (VGA_HS),
  .VGA_SYNC_N   (VGA_SYNC_N), 
  .VGA_VS       (VGA_VS), 
  .xpix         (xpix), 
  .ypix         (ypix)
);
        
//////////////////////
// Instantiate VGA //
////////////////////
  
logic vga_graph_we; 
logic vga_char_we;  
logic vga_mode_sel;

logic [16:0] daddr_vidmem;
logic [11:0] daddr_vga_char;
logic ff_dms;

wire [15:0] daddr_vga_text_raw;
assign daddr_vga_text_raw = (daddr[15:0] - ADDR_TEXT_MMAP[15:0]);

assign vga_graph_we   = daddr >= ADDR_GRAPH_MMAP & |we_map;
assign vga_char_we    = daddr >= ADDR_TEXT_MMAP & !vga_graph_we & |we_map;

assign daddr_vidmem   = daddr - ADDR_GRAPH_MMAP;
assign daddr_vga_char = daddr - ADDR_TEXT_MMAP;

VGA_display iVGA(
 .clk             (clk),
 .rst_n           (rst_n),
 .xloc            (xpix), 
 .yloc            (ypix),
 // vga text memory is half-word addressable
 .vga_char_i      (data_proc_to_mem[15:0]), 
 .vga_char_addr_i (daddr_vga_text_raw[12:1]), .vga_char_we_i(vga_char_we),
 // ...but the graph is byte addressable
 // something to be aware of when you are programming!
 .graph_px_i      (data_proc_to_mem[3:0]), 
 .graph_addr_i    (daddr_vidmem), 
 .graph_we_i      (vga_graph_we),
 // SW[0] debug for switching between modes
 .draw_mode_sel_i (vga_mode_sel | SW[0]),
 .VGA_R           (VGA_R), 
 .VGA_G           (VGA_G), 
 .VGA_B           (VGA_B)
);
  
////////////////////////
// Instantiate PS2 KB //
////////////////////////
wire [7:0] PS2_key;
wire [DATA_WIDTH-1:0] PS2_status;
wire PS2_rdy;

PS2_kb iPS2_KB(
  .clk          (clk),                   
  .rst_n        (rst_n),
  .PS2_CLK_i    (PS2_CLK),          // The PS/2 KB has a clock of its own
  .PS2_DAT_i    (PS2_DAT),          // Serial line in from the KB
  .PS2_CHAR_o   (PS2_key),          // Last key pressed
  .PS2_rdy_o    (PS2_rdy),          // signal that a key code is available 
  .PS2_status_o (PS2_status)        // special KB state for programmers w/o outputting ASCII (enter? tab? etc)
);

///////////////////////
// Memory map logic ///
///////////////////////
wire in_mmap_range_n;
wire [DATA_WIDTH-1:0] mmap_periph_data;
assign in_mmap_range_n  = (~|daddr[31:DMEM_DEPTH] | (~|daddr[31:(IMEM_DEPTH+2)] & ldcr)); // DMEM_DEPTH = 14, IMEM_DEPTH = 13 + 2 (Since IMEM is word-addressable)
assign we_dmem              = in_mmap_range_n ? we_map : 4'b0;
assign data_mem_to_proc_map = in_mmap_range_n ? (ldcr ? inst_mem_to_proc : data_mem_to_proc_dmem_muxed) // DMEM or IMEM range 
                                              : mmap_periph_data ; // cases where we assign data mem to proc map MMAP'd values

// data going from MMAP to processor
assign mmap_periph_data = (daddr == ADDR_PS2_CHAR_MMAP)   ? {24'h0, PS2_key} :
                          (daddr == ADDR_PS2_STATUS_MMAP) ? PS2_status : 
					                (daddr == ADDR_TIMER_MMAP)      ? 32'b0 : 32'b0 ;
								  
// data going from processor to MMAP
// (only one signal)
always_ff @(posedge clk, negedge rst_n)
  if (!rst_n)
    vga_mode_sel <= 0;
  else if (daddr == ADDR_VGA_CONFIG_MMAP)
    vga_mode_sel <= data_proc_to_mem[0];

// debug for PS/2
assign LEDR = {2'b11, PS2_key};

endmodule
