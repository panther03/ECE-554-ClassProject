module wi23 
import wi23_defs::*;
(
  input        clk, // 50MHz
  input        rst_n,
  output       halt,
  // Switches and LEDs
  input  [9:0] SW,
  output [9:0] LEDR,
  // UART
  input        RX,
  output       TX,
  // VGA
  // VGA clock is an input to this module because it is generated in the PLL.
  input        VGA_CLK, // 25MHz
  output    	VGA_BLANK_N,
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
logic [DATA_WIDTH-1:0]  daddr;
logic [DATA_WIDTH-1:0]  data_mem_to_proc_map;
logic [DATA_WIDTH-1:0]  data_mem_to_proc_dmem;
logic [DATA_WIDTH-1:0]  data_proc_to_mem;
logic [DATA_WIDTH-1:0]  data_proc_to_mem_be;
logic                   ldcr;

logic [3:0] we_map;
logic [3:0] re_map;
logic [3:0] we_dmem;

///////////////////
// LEDs signals //
/////////////////

logic LEDR_en;
reg [9:0] LEDR_r;

////////////////////
// SPART signals //
//////////////////

logic spart_iocs_n;
logic spart_iorw_n;
spart_ioaddr_t spart_ioaddr;
logic [7:0] spart_databus_in;

wire [7:0] spart_databus = (spart_iocs_n || !spart_iorw_n) ? spart_databus_in : 8'hZ;

///////////////////////////////
// Processor instantiation //
////////////////////////////

proc PROC (
   // Clock and reset
   .clk(clk), .rst_n(rst_n),
   // Error and halt status
   .err_o(), .halt_o(halt), 
   // Instruction memory signals
   .iaddr_o(iaddr), .inst_i(inst), .ldcr_o(ldcr),
   // Data memory signals
   .daddr_o(daddr), .we_o(we_map), .re_o(re_map),
   .data_proc_to_mem_o(data_proc_to_mem), 
   .data_mem_to_proc_i(data_mem_to_proc_map)
);

/////////////////////////
// Instruction memory ///
/////////////////////////

// Word-aligned IMEM. Make daddr word-aligned.
logic [IMEM_DEPTH-1:0] daddr_im;
assign daddr_im = daddr >> 2;

imem IMEM (
  .clk(clk),
  // We truncate address here but this is OK. It will just fetch 0s (HALT) if out of range
  .addr_i   (iaddr[IMEM_DEPTH-1:0]),
  .daddr_i  (daddr_im[IMEM_DEPTH-1:0]),
  .inst_o   (inst[PC_WIDTH-1:0]),
  .data_o   (inst_mem_to_proc[DATA_WIDTH-1:0])
);

//////////////////
// Data memory //
//////////////// 

// Big-Endian DMEM
logic [DATA_WIDTH-1:0] aligned_data_proc_to_mem;
logic [4:0] shft_amt;
// Align the data whichs needs to be stored.
// High Byte  - Stored in [11]
// Mid Byte   - Stored in [10]
// Mid Byte   - Stored in [01]
// Low Byte   - Stored in [00]
assign shft_amt = {daddr[1:0], 3'b0};
assign aligned_data_proc_to_mem = data_proc_to_mem >> shft_amt;

dmem DMEM (
  .clk(clk),
  .we_i(we_dmem),
  // Also OK to truncate address, we have already checked that it's in range (otherwise we would not be enabled).
  .addr_i(daddr[DMEM_DEPTH-1:0]),
  .wdata_i(aligned_data_proc_to_mem),
  .rdata_o(data_mem_to_proc_dmem)
);

////////////////////////
// Instantiate SPART //
//////////////////////
spart SPART (
    .clk(clk),                 // 50MHz clk
    .rst_n(rst_n),             // asynch active low reset
    .iocs_n(spart_iocs_n),     // active low chip select (decode address range) 
    .iorw_n(spart_iorw_n),     // high for read, low for write 
    .tx_q_full(),              // indicates transmit queue is full       
    .rx_q_empty(),             // indicates receive queue is empty         
    .ioaddr(spart_ioaddr),     // Read/write 1 of 4 internal 8-bit registers 
    .databus(spart_databus),   // bi-directional data bus   
    .TX(TX),                   // UART TX line
    .RX(RX)                    // UART RX line
);


///////////////////////////////////////
// Instantiate VGA Timing Generator //
/////////////////////////////////////
wire [9:0] xpix;					// current X coordinate of VGA
wire [8:0] ypix;					// current Y coordinate of VGA
VGA_timing iVGATM(.clk25MHz(VGA_CLK), .rst_n(rst_n), .VGA_BLANK_N(VGA_BLANK_N),
                  .VGA_HS(VGA_HS),.VGA_SYNC_N(VGA_SYNC_N), .VGA_VS(VGA_VS), 
        .xpix(xpix), .ypix(ypix));
        
//////////////////////
// Instantiate VGA //
////////////////////

  wire [15:0] daddr_vga_raw = (daddr[15:0] - 16'hE000);
  wire [11:0] daddr_vga_ofs = daddr_vga_raw[11:2];
  // This is a hacky way of checking for an address in the VGA framebuffer range
  // Technically the range is 0xE000 - 0xF2C0 but this will trigger until 0xFFFF (and also for whatever the upper 16 bits are)
  logic vga_char_we;  // fffecaa0 - fffed3ff
  logic vga_graph_we; // fffed400 - ffffffff
  logic [16:0] daddr_vidmem;
  logic draw_mode_sel;

  assign vga_char_we = &daddr[15:13] & |we_map;
  assign vga_graph_we = daddr >= 32'hfffed400 & |we_map;
  assign daddr_vidmem = daddr - 32'hfffed400;
  


  VGA_display iVGA(
    .clk(clk),
    .rst_n(rst_n),
	 .xloc(xpix), .yloc(ypix),
    .vga_char_i(data_proc_to_mem[15:0]), .vga_char_addr_i(daddr_vga_ofs), .vga_char_we_i(vga_we),
    .graph_px_i(data_proc_to_mem[3:0]), .graph_addr_i(daddr_vidmem[16:0]), .graph_we_i(vga_graph_we),
    .draw_mode_sel_i(1'b1),
    .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B)
  );
  

/////////////////////////
// LED register logic //
///////////////////////
// Hold LED state until the programmer writes to address again
always_ff @(posedge clk, negedge rst_n)
  if (!rst_n)
    LEDR_r <= 0;
  else if (LEDR_en)
    LEDR_r <= data_proc_to_mem[9:0];

///////////////////////
// Memory map logic ///
///////////////////////

// TODO Aidan - Hoffman doesn't like the always_comb.
// Probably better to do assigns with individual ternaries.
// He also commented to use wi23_defs.sv to declare memory addresses.

always_comb begin
  // Initialize all control signals
  // Physical memory
  we_dmem = 0;
  // LEDs/Switches
  LEDR_en = 0;
  // SPART
  spart_ioaddr = ADDR_DBUF;
  spart_iocs_n = 1'b1;
  spart_iorw_n = 1'b1;
  spart_databus_in = 8'h0;
  // Data back to processor.
  data_mem_to_proc_map = 32'h0;

  // Handle physical memory range primarily
  // Checks that none of the bits are set.
  if (~|daddr[15:14] | (~daddr[15] & ldcr)) begin
    we_dmem = we_map;
    data_mem_to_proc_map = ldcr ? inst_mem_to_proc : data_mem_to_proc_dmem;
  end else begin
    // Otherwise we map to the remaining peripherals
    casez (daddr[15:0])
      // LED
      16'hC000: begin 
        if (|we_map)
          LEDR_en = 1;
      end
      // Switches
      16'hC001: begin
        data_mem_to_proc_map = {22'h00 , SW};
      end
      // SPART - TX/RX buffer
      16'hC004: begin
        spart_iocs_n = ~|re_map && ~|we_map;
        spart_iorw_n = ~|we_map;
        // databuf ioaddr is same as default
        data_mem_to_proc_map = {24'h0, spart_databus};
        spart_databus_in = data_proc_to_mem[7:0];
      end
      // SPART - Status register
      16'hC005: begin
        spart_iocs_n = ~|re_map;
        spart_ioaddr = ADDR_SREG;
        data_mem_to_proc_map = {24'h0, spart_databus};
      end
      // SPART - DB register
      16'hC006, 16'hC007: begin
        spart_iocs_n = ~|re_map && ~|we_map;
        spart_iorw_n = ~|we_map;
        spart_ioaddr = daddr[0] ? ADDR_DBH : ADDR_DBL; 
        data_mem_to_proc_map = {24'h0, spart_databus};
        spart_databus_in = data_proc_to_mem[7:0];
      end
		default : begin end
      // There is no default because all of our inputs
      // are defaulted. It would be the same thing.
    endcase
  end
end

/////////////////////
// Output signals //
///////////////////
assign LEDR = LEDR_r;

endmodule
