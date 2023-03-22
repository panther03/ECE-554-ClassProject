module imem 
import wi23_defs::*;
(
   input                   clk,
   input  [IMEM_DEPTH-1:0] addr_i,
   input  [IMEM_DEPTH-1:0] daddr_i,
   output [IMEM_WIDTH-1:0] inst_o,
   output [IMEM_WIDTH-1:0] data_o
);

   localparam IMEM_ENTRIES = 1 << IMEM_DEPTH;
   
   reg [IMEM_WIDTH-1:0] mem_r [IMEM_ENTRIES-1:0];
   reg [IMEM_WIDTH-1:0] inst_r;
   reg [IMEM_WIDTH-1:0] data_r;

   initial begin
      $readmemh("../../out/FPIssueTest.hex", mem_r);
   end

   // We read on negative edge becuase the 552 memory reads asyncronously
   always @(negedge clk) begin
      inst_r <= mem_r[addr_i];
   end
   
   always @(negedge clk) begin
      data_r <= mem_r[daddr_i];
   end

   assign inst_o = inst_r;
   assign data_o = data_r;

endmodule
