// Contains the ROM for the VGA 8x16 font
// Uses the IBM romset but this may be configured to use another fontset
module BMP_ROM_IBM_VGA_8x16(
    input wire clk,                     // 50MHz clock
    input wire [11:0] addr,
    output reg [7:0] dout          // pixel out
  );
  
  // 4KB text code page (0:31999 bits, 0:4095 bytes)
  reg [7:0] rom[0:4095];
  
  // Uses IBM's font
  initial
    $readmemh("IBM_VGA_8x16.hex",rom);
  
  always @(posedge clk)
    dout <= rom[addr];

endmodule
