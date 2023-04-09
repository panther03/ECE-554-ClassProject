module shifter 
import wi23_defs::*;
(In, Cnt, UnsignedOp, Op, Out);
   
   input [REGFILE_WIDTH-1:0] In;
   input [4:0]  Cnt;
   input [1:0]  Op;
   input        UnsignedOp;
   output [REGFILE_WIDTH-1:0] Out;

   wire [REGFILE_WIDTH-1:0] sr1_out,sr2_out,sr3_out,sr4_out;
   reg [REGFILE_WIDTH-1:0] sr0_in,sr1_in,sr2_in,sr3_in,sr4_in;

   wire Sign;

   assign Sign = UnsignedOp ? 1'b0 : In[31];

   // 00 => ROL
   // 01 => SLL
   // 10 => ROR
   // 11 => SRL

   always @* case (Op)
      2'b00 : sr4_in = {In[15:0],In[31:16]};             // << ROL 16
      2'b01 : sr4_in = {In[15:0],16'h0};                 // << 16
      2'b10 : sr4_in = {In[15:0],In[31:16]};             // >> ROR 16
      2'b11 : sr4_in = {{16{Sign}},In[31:16]};           // >> 16
   endcase

   always @* case (Op)
      2'b00 : sr3_in = {sr4_out[23:0],sr4_out[31:24]};   // << ROL 8
      2'b01 : sr3_in = {sr4_out[23:0],8'h0};             // << 8
      2'b10 : sr3_in = {sr4_out[7:0],sr4_out[31:8]};     // >> ROR 8
      2'b11 : sr3_in = {{8{Sign}},sr4_out[31:8]};        // >> 8
   endcase

   always @* case (Op)
      2'b00 : sr2_in = {sr3_out[27:0],sr3_out[31:28]};   // << ROL 4
      2'b01 : sr2_in = {sr3_out[27:0],4'b0000};          // << 4
      2'b10 : sr2_in = {sr3_out[3:0],sr3_out[31:4]};     // >> ROR 4
      2'b11 : sr2_in = {{4{Sign}},sr3_out[31:4]};        // >> 4
   endcase

   always @* case (Op)
      2'b00 : sr1_in = {sr2_out[29:0],sr2_out[31:30]};   // << ROL 2
      2'b01 : sr1_in = {sr2_out[29:0],2'b00};            // << 2
      2'b10 : sr1_in = {sr2_out[1:0],sr2_out[31:2]};     // >> ROR 2
      2'b11 : sr1_in = {{2{Sign}},sr2_out[31:2]};        // >> 2
   endcase

   always @* case (Op)
      2'b00 : sr0_in = {sr1_out[30:0],sr1_out[31]};
      2'b01 : sr0_in = {sr1_out[30:0],1'b0};
      2'b10 : sr0_in = {sr1_out[0],sr1_out[31:1]};
      2'b11 : sr0_in = {Sign,sr1_out[31:1]};
   endcase
   
   assign sr4_out = Cnt[4] ? sr4_in : In;
   assign sr3_out = Cnt[3] ? sr3_in : sr4_out;
   assign sr2_out = Cnt[2] ? sr2_in : sr3_out;
   assign sr1_out = Cnt[1] ? sr1_in : sr2_out;
   assign Out = Cnt[0] ? sr0_in : sr1_out;

endmodule

