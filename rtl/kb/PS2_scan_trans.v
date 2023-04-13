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
	 output reg [3:0] kb_fn_o
  );
  
  // For converting to codepage hex values
  reg [15:0] rom[0:255];
  
  // Read the ROM for translation
  initial
    $readmemh("PS2_SCAN_TRANS.hex",rom);
  
  always @(posedge clk) begin
    char_o <= rom[addr][7:0];
	 kb_enter_o <= (rom[addr][15:8] == 8'h04);
  end

endmodule