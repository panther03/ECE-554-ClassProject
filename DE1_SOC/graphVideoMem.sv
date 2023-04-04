/**
Graphing Video Memory
Aidan McEllistrem
3/21/2023

There are two framebuffers:
Text Mode  ("Mode 0", emulates VGA text mode)
Graph Mode ("Mode 1", graphing mode)
This implements Mode 1.
*/
module graphVideoMem(
    input wire clk,
    input wire we,
    input wire [18:0] waddr_i,
    input wire [3:0] pal_i,        // Color data in
    input wire [9:0] xloc_i,
    input wire [8:0] yloc_i,
    output reg [3:0] pal_o   // Color data out
  );
  
  initial
    $readmemh("VGA_GRAPH_INIT_TEST.hex",framebuffer);
  
  // 320*240*4 = 38.4k memory used
  // Quarter width: pixels are 2x wide and 2x tall
  // This saves valuable framebuffer space.
  reg [3:0] framebuffer [0:76799];
  
  // Effectively divide each x and y coord by 2
  // 1 0100 0000 = 320 in binary
  // we can write addr = yloc[8:1] * 320 + xloc_i
  wire [16:0] framebuffer_addr_sel;
  assign framebuffer_addr_sel = (yloc_i[8:1] * 320) + xloc_i[9:1];
  
  always @(posedge clk) begin
    if (we)
      framebuffer[framebuffer_addr_sel] <= pal_i;
    pal_o <= framebuffer[framebuffer_addr_sel];
  end

endmodule