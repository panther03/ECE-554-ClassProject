// Contains the ROM for translating keycodes
// to ascii data
module PS2_scan_trans(
    input wire clk,
    input wire [7:0] addr,
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
  
  // For converting to codepage hex values
  reg [7:0] lc_rom[0:255];  // lowercase
  reg [7:0] uc_rom[0:255];  // uppercase
  reg [7:0] mod_rom[0:255];  // modcode
  
  // Read the ROM for translation
  initial begin
    $readmemh("PS2_SCAN_TRANS_LOWER.hex",lc_rom);
	 $readmemh("PS2_SCAN_TRANS_UPPER.hex",uc_rom);
	 $readmemh("PS2_SCAN_TRANS_MODCODES.hex",mod_rom);
  end
	 
  wire shift_key;
  assign shift_key = mod_rom[addr] == 8'h01;
  
  always @(posedge clk) begin
    // lowercase and uppercase characters are in different romsets
	 // this is because the upper chars are NOT uniformly at a constant offset
    if (!shift_key) begin 
      char_o <= lc_rom[addr];
	 end
	 else begin
	   char_o <= uc_rom[addr];
	 end
	 kb_shift_o <= (shift_key);
	 kb_enter_o <= (mod_rom[addr] == 8'h04);
	 kb_alt_o   <= (mod_rom[addr] == 8'h03);
	 kb_ctrl_o  <= 0;
	 kb_esc_o   <= 0;
	 kb_tab_o   <= (mod_rom[addr] == 8'h08);
	 kb_fn_o    <= (mod_rom[addr][7:4]);
  end

endmodule