// Contains the ROM for the 16-entry color palette
// This is so the color palette may be swapped at will
module BMP_ROM_VGA_PALETTE(
    input wire clk,
    input wire [3:0] addr,
    output reg [23:0] color_24_out  // 16-bit color out
  );
  
  // 16 colors, 24 bit color depth
  reg [23:0] rom[0:15];
  
  // Directly uses 4-bit CGA colors
  initial
    $readmemh("CGA_PALETTE.hex",rom);
  
  always @(posedge clk)
    color_24_out <= rom[addr];

endmodule