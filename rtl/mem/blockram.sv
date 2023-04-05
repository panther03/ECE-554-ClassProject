module blockram
import wi23_defs::*;
# (parameter RAM_WIDTH = 8, parameter RAM_DEPTH = 12)
(
   input  logic                   clk,
   input  logic                   we_i,
   input  logic [RAM_DEPTH-1:0]   addr_i,
   input  logic [RAM_WIDTH-1:0]   wdata_i,
   output logic [RAM_WIDTH-1:0]   rdata_o
);

  localparam RAM_ENTRIES = 1 << RAM_DEPTH;

  reg [RAM_WIDTH-1:0] mem_r [RAM_ENTRIES-1:0];
  reg [RAM_WIDTH-1:0] rdata_r;

  // Intel HDL Coding Styles, 14.1.7 "Simple Dual-Port, Dual-Clock Synchronous RAM"
  // We read on negative edge becuase the 552 memory reads asyncronously
  // We also write on negative edge because you have to write and read on the same edge
  always @(negedge clk) begin
    if (we_i) begin
      mem_r[addr_i] <= wdata_i[RAM_WIDTH-1:0];
    end
    rdata_r[RAM_WIDTH-1:0] <= mem_r[addr_i];
  end

  assign rdata_o = rdata_r;

endmodule