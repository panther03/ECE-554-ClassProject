module dmem
import wi23_defs::*;
(
   input  logic                     clk,
   input  logic [3:0]               we_i,
   input  logic [DMEM_DEPTH-1:0]    addr_i,
   input  logic [DATA_WIDTH-1:0]    wdata_i,
   output logic [DATA_WIDTH-1:0]    rdata_o
);

   logic [DMEM_DEPTH-1:2] block_addr;
   assign block_addr = {2'b0, addr_i[DMEM_DEPTH-1:2]}; // Address aligned to word
  
   logic [DATA_WIDTH-1:0] rdata_r;

   // Block Ram 0 - 1B x 4K = 4kB
   // Address [00]
   blockram #(.RAM_WIDTH(DMEM_WIDTH), .RAM_DEPTH(DMEM_DEPTH-2)) iDMEM_BR0 (
      .clk(clk), 
      .we_i(we_i[0]), 
      .addr_i(block_addr), 
      .wdata_i(wdata_i[DMEM_WIDTH-1:0]), 
      .rdata_o(rdata_r[DMEM_WIDTH-1:0])
   );

   // Block Ram 1 - 1B x 4K = 4kB
   // Address [01]
   blockram #(.RAM_WIDTH(DMEM_WIDTH), .RAM_DEPTH(DMEM_DEPTH-2)) iDMEM_BR1 (
      .clk(clk), 
      .we_i(we_i[1]), 
      .addr_i(block_addr), 
      .wdata_i(wdata_i[2*DMEM_WIDTH-1:DMEM_WIDTH]), 
      .rdata_o(rdata_r[2*DMEM_WIDTH-1:DMEM_WIDTH])
   );

   // Block Ram 2 - 1B x 4K = 4kB
   // Address [10]
   blockram #(.RAM_WIDTH(DMEM_WIDTH), .RAM_DEPTH(DMEM_DEPTH-2)) iDMEM_BR2 (
      .clk(clk), 
      .we_i(we_i[2]), 
      .addr_i(block_addr), 
      .wdata_i(wdata_i[3*DMEM_WIDTH-1:2*DMEM_WIDTH]), 
      .rdata_o(rdata_r[3*DMEM_WIDTH-1:2*DMEM_WIDTH])
   );

   // Block Ram 3 - 1B x 4K = 4kB
   // Address [11]
   blockram #(.RAM_WIDTH(DMEM_WIDTH), .RAM_DEPTH(DMEM_DEPTH-2)) iDMEM_BR3 (
      .clk(clk), 
      .we_i(we_i[3]), 
      .addr_i(block_addr), 
      .wdata_i(wdata_i[4*DMEM_WIDTH-1:3*DMEM_WIDTH]), 
      .rdata_o(rdata_r[4*DMEM_WIDTH-1:3*DMEM_WIDTH])
   );

   assign rdata_o = {rdata_r[DMEM_WIDTH-1:0], rdata_r[2*DMEM_WIDTH-1:DMEM_WIDTH], rdata_r[3*DMEM_WIDTH-1:2*DMEM_WIDTH], rdata_r[4*DMEM_WIDTH-1:3*DMEM_WIDTH]};

endmodule