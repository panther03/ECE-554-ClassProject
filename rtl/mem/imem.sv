module imem 
import wi23_defs::*;
(
   input                   clk,
   input  [IMEM_DEPTH-1:0] addr_i,
   input  [IMEM_DEPTH-1:0] daddr_i,
   output [PC_WIDTH-1:0] inst_o,
   output [DATA_WIDTH-1:0] data_o
);

   localparam IMEM_ENTRIES = 1 << IMEM_DEPTH;
   
   reg [IMEM_WIDTH-1:0] mem_r [IMEM_ENTRIES-1:0];
   reg [PC_WIDTH-1:0] inst_r;
   reg [DATA_WIDTH-1:0] data_r;

   initial begin
      $readmemh("../../fw/FPIssueTest.hex", mem_r);
   end

   // We read on negative edge becuase the 552 memory reads asyncronously
   always @(negedge clk) begin
      inst_r[IMEM_WIDTH-1:0]               <= mem_r[addr_i];
      inst_r[2*IMEM_WIDTH-1:IMEM_WIDTH]    <= mem_r[addr_i + 1];
      inst_r[3*IMEM_WIDTH-1:2*IMEM_WIDTH]  <= mem_r[addr_i + 2];
      inst_r[4*IMEM_WIDTH-1:3*IMEM_WIDTH]  <= mem_r[addr_i + 3];
   end
   
   always @(negedge clk) begin
      data_r[IMEM_WIDTH-1:0]               <= mem_r[daddr_i];
      data_r[2*IMEM_WIDTH-1:IMEM_WIDTH]    <= mem_r[daddr_i + 1];
      data_r[3*IMEM_WIDTH-1:2*IMEM_WIDTH]  <= mem_r[daddr_i + 2];
      data_r[4*IMEM_WIDTH-1:3*IMEM_WIDTH]  <= mem_r[daddr_i + 3];
   end

   // Big-Endian
   assign inst_o = {inst_r[IMEM_WIDTH-1:0], inst_r[2*IMEM_WIDTH-1:IMEM_WIDTH], inst_r[3*IMEM_WIDTH-1:2*IMEM_WIDTH], inst_r[4*IMEM_WIDTH-1:3*IMEM_WIDTH]};
   assign data_o = {data_r[IMEM_WIDTH-1:0], data_r[2*IMEM_WIDTH-1:IMEM_WIDTH], data_r[3*IMEM_WIDTH-1:2*IMEM_WIDTH], data_r[4*IMEM_WIDTH-1:3*IMEM_WIDTH]};

endmodule
