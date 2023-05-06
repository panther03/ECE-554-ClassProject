import wi23_defs::*;
module queue (
   input         clk,
   input         enable,
   input  [1:0]  raddr,
   input  [1:0]  waddr,
   input  [DATA_WIDTH-1:0]  wdata,
   output [DATA_WIDTH-1:0]  rdata
);
  reg [DATA_WIDTH-1:0] mem[3:0];
  reg [DATA_WIDTH-1:0] rdata_r;

  integer i;

  initial begin
    for (i = 0; i < 4; i += 1) begin
       mem[i] <= 0;
    end
  end

  // Intel HDL Coding Styles, 14.1.7 "Simple Dual-Port, Dual-Clock Synchronous RAM"
  // Queue reads and writes on negedge because it is subject to the same timing
  // requirements as the data/instruction memory (being a memory mapped peripheral.)
  always @(posedge clk) begin
    if (enable) begin
       mem[waddr] <= wdata;
    end
    rdata_r <= mem[raddr];
  end


  assign rdata = rdata_r;

endmodule