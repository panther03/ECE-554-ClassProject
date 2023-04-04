// Contains the ROM for translating keycodes
// to ascii data
module PS2_scan_trans(
    input wire clk,
    input wire [7:0] addr,
    output reg [7:0] char_o 
  );
  
  // For converting to codepage hex values
  reg [7:0] rom[0:255];
  
  // Read the ROM for translation
  initial
    $readmemh("PS2_SCAN_TRANS.hex",rom);
  
  always @(posedge clk)
    char_o <= rom[addr];

endmodule