/**
VGA Display Driver
Aidan McEllistrem
3/20/2023

Dual-Mode VGA display meant to show text and color data.
Designed to take up much less space than a full framebuffer (~46k compared to ~345k)
*/
module VGA_display(
  input wire clk,
  input wire rst_n,
  
  /*input wire [9:0] x_pos,
  input wire x_we,
  input wire [8:0] y_pos,
  input wire y_we,*/
  input wire [9:0] xloc,
  input wire [8:0] yloc,
  
  input wire [15:0] vga_char_i,        // Character data to write into buffer in from MM'd value
  input wire [11:0] vga_char_addr_i,   // Address from MM to put char data in 
                                  //(addr 0 = first col, first row, addr 80 = first col, second row, etc)
  input wire vga_char_we_i,            // MM'd write enable
  
  input wire [3:0]  graph_px_i,        // Graph palette pixel data to write into buffer from MM'd value
  input wire [18:0] graph_addr_i,      // Address to put pixel data in  
  input wire graph_we_i,               // MM'd write enable
  
  input wire draw_mode_sel_i,          // Chooses framebuffer output
  //input wire graph_fullscreen_sel_i;  // Can either draw full-size or windowed
  //input wire [9:0] graph_screen_x;    // Windowed-mode x-coord offset
  //input wire [8:0] graph_screen_y;    // Windowed-mode y-coord offset
  output wire [7:0] VGA_B,
  output wire [7:0] VGA_G,
  output wire [7:0] VGA_R
);

  ////////////////////////////////////
  // internal nets for connections //
  //////////////////////////////////
  wire [18:0] raddr;			     // address into videoMem for reads
  wire [3:0] text_pal_color;	 // selects palette colors
  wire [3:0] graph_pal_color;	 // |/
  wire [18:0] waddr;				   // write address to videoMem
  wire [8:0] wdata;					   // write data to videoMem
  wire we;
  
  
  reg [18:0] count;					// generate a pulse on add_img
  
  wire [23:0] BMP_VGA_color_24;
 
					
  // Instantiate "Mode 0" Text Memory
  textVideoMem iTEXT_VID_MEM(
      .clk(clk),.we(vga_char_we_i),
      .vga_char_i(vga_char_i), .vga_char_waddr_i(vga_char_addr_i),
      .xloc_i(xloc), .yloc_i(yloc),
      .pal_o(text_pal_color)
  );
  
  // Instantiate "Mode 1" Video Memory
  graphVideoMem iVIDMEM(
    .clk(clk),.we(graph_we_i),
    .pal_i(graph_px_i),.waddr_i(graph_addr_i),
    .xloc_i(xloc), .yloc_i(yloc),
    .pal_o(graph_pal_color)
  );  
  
  // Direct color data is not stored in video memory,
  // instead, we get it from a palette ROM bank
  wire [3:0] pal_sel;
  assign pal_sel = draw_mode_sel_i ? graph_pal_color : text_pal_color;
  
  // Instantiate VGA Palette
  BMP_ROM_VGA_PALETTE iPALETTE(.clk(clk),.addr(pal_sel),.color_24_out(BMP_VGA_color_24));
  
  // draw_mode_sel 0 selects text memory, 1 selects video memory
  assign VGA_R = BMP_VGA_color_24[23:16];
  assign VGA_G = BMP_VGA_color_24[15:8];
  assign VGA_B = BMP_VGA_color_24[7:0];
	
 endmodule