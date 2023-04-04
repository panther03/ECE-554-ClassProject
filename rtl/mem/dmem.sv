module dmem
import wi23_defs::*;
(
   input                   clk,
   input  [3:0]            we_i,
   input  [DMEM_DEPTH-1:0] addr_i,
   input  [DATA_WIDTH-1:0] wdata_i,
   output [DATA_WIDTH-1:0] rdata_o
);

   localparam DMEM_ENTRIES = 1 << DMEM_DEPTH;

   reg [DMEM_WIDTH-1:0] mem_r [DMEM_ENTRIES-1:0];
   reg [DATA_WIDTH-1:0] rdata_r;

   // Intel HDL Coding Styles, 14.1.7 "Simple Dual-Port, Dual-Clock Synchronous RAM"
   // We read on negative edge becuase the 552 memory reads asyncronously
   // We also write on negative edge because you have to write and read on the same edge
   always @(negedge clk) begin
      if (we_i[0]) begin
         mem_r[addr_i]     <= wdata_i[DMEM_WIDTH-1:0];
      end
      if (we_i[1]) begin
         mem_r[addr_i + 1] <= wdata_i[2*DMEM_WIDTH-1:DMEM_WIDTH];
      end
      if (we_i[2]) begin
         mem_r[addr_i + 2] <= wdata_i[3*DMEM_WIDTH-1:2*DMEM_WIDTH];
      end
      if (we_i[3]) begin
         mem_r[addr_i + 3] <= wdata_i[4*DMEM_WIDTH-1:3*DMEM_WIDTH];
      end
      rdata_r[DMEM_WIDTH-1:0]               <= mem_r[addr_i];
      rdata_r[2*DMEM_WIDTH-1:DMEM_WIDTH]    <= mem_r[addr_i + 1];
      rdata_r[3*DMEM_WIDTH-1:2*DMEM_WIDTH]  <= mem_r[addr_i + 2];
      rdata_r[4*DMEM_WIDTH-1:3*DMEM_WIDTH]  <= mem_r[addr_i + 3];
   end

   assign rdata_o = rdata_r;

endmodule