// Contains the ROM for translating keycodes
// to ascii data
module PS2_scan_trans(
    input wire clk,
	 input wire rst_n,
    input wire [7:0] addr,
	 input wire rdy,
    output reg [7:0] char_o,
	 // signals out
	 output reg kb_shift_o,
	 output reg kb_enter_o,
	 output reg kb_alt_o,
	 output reg kb_ctrl_o,
	 output reg kb_esc_o,
	 output reg kb_tab_o,
	 output reg [3:0] kb_fn_o
  );
  
  localparam NKEY_SIZE = 132;
  
  // For converting to codepage hex values
  reg [7:0]  lc_rom[0:NKEY_SIZE-1];  // lowercase
  reg [7:0]  uc_rom[0:NKEY_SIZE-1];  // uppercase
  reg [7:0] mod_rom[0:NKEY_SIZE-1];  // modcode
  
  // Read the ROM for translation
  initial begin
    $readmemh("PS2_SCAN_TRANS_LOWER.hex",lc_rom);
	 $readmemh("PS2_SCAN_TRANS_UPPER.hex",uc_rom);
	 $readmemh("PS2_SCAN_TRANS_MODCODES.hex",mod_rom);
  end
  
  always @(posedge clk) begin
    // lowercase and uppercase characters are in different romsets
	 // this is because the upper chars are NOT uniformly at a constant offset
    if (!(mod_rom[addr] == 8'h01)) begin 
      char_o <= lc_rom[addr];
	 end
	 else begin
	   char_o <= uc_rom[addr];
	 end
	 kb_shift_o <= (mod_rom[addr] == 8'h01);
	 kb_enter_o <= (mod_rom[addr] == 8'h04);
	 kb_alt_o   <= (mod_rom[addr] == 8'h03);
	 kb_ctrl_o  <= 0;
	 kb_esc_o   <= 0;
	 kb_tab_o   <= (mod_rom[addr] == 8'h08);
	 kb_fn_o    <= (mod_rom[addr][7:4]);
  end

endmodule