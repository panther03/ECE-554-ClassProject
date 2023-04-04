/**
Text Video Memory
Aidan McEllistrem
3/21/2023

There are two framebuffers:
Text Mode  ("Mode 0", emulates VGA text mode)
Graph Mode ("Mode 1", graphing mode)
This implements Mode 0.
*/
module textVideoMem(
    input wire clk,
    input wire we,
    input wire [15:0] vga_char_i,
    input wire [11:0] vga_char_waddr_i,
    input wire [9:0] xloc_i,
    input wire [8:0] yloc_i,
    output reg [3:0] pal_o    // Lower half used for text, upper half used for metadata
  );

  // total 33.6kb
  // 80*30*16 = 38400 bits = 4.8kb
  reg [15:0] framebuffer [0:2399];
  
  initial
    $readmemh("VGA_TEXT_INIT_TEST.hex",framebuffer);
  
  // Instantiate VGA Text Mode charset
  // Takes in an address and returns a byte of text info
  // Character data is defined as a 16-wide stretch of 8-bit words
  // Therefore, yloc[3:0] selects the "row" of px data
  // and we use the lower 8 bits of the framebuffer at the current address / 16
  // to get the current ASCII character
  wire [7:0] BMP_ROM_text_char;
  wire [11:0] char_idx;
  wire [11:0] char_y;
  wire [15:0] vga_char;
  // Calc text cell index from the x and y offsets given
  assign char_y =   {7'b0000000, yloc_i[8:4]};
  assign char_idx = (char_y << 6) + (char_y << 4) + {5'b00000, xloc_i[9:3]};
  assign vga_char = framebuffer[char_idx];
  // Use lower four bits of the y index to calculate the row offset
  BMP_ROM_IBM_VGA_8x16 iBMP_ROM(.clk(clk),.addr({vga_char[7:0],yloc_i[3:0]}),.dout(BMP_ROM_text_char));
  
  // decode logic for determining palette data for a pixel
  /*
    15     14 13 12   11 10 9 8  7 6 5 4 3 2 1 0
    Blink  BG Color   FG Color   ASCII Value
  */
  wire ascii_px_present;
  // select pixel data by shifting the bit of the row
  assign ascii_px_present = |(BMP_ROM_text_char & (8'b10000000 >> (xloc_i[2:0])));
  
  // 4'b0000 = Background Color (black by usual standards)
  // BG colors are implicity the first 8 colors of the palette
  wire [3:0] bg_pal;
  assign bg_pal = {1'b0, vga_char[14:12]};
  
  // FG colors can be chosen out of any of the colors in the palette
  wire [3:0] fg_pal;
  assign fg_pal = vga_char[11:8];
  
  always @(posedge clk) begin
    if (we)
      framebuffer[vga_char_waddr_i] <= vga_char_i;
    pal_o <= ascii_px_present ? fg_pal : bg_pal;
  end

endmodule