module alu 
import wi23_defs::*;
(A, B, Op, Out, alu_err);
   
   input [REGFILE_WIDTH-1:0] A;
   input [REGFILE_WIDTH-1:0] B;
   input [3:0] Op;
   output reg [REGFILE_WIDTH-1:0] Out;
   output reg alu_err;

   wire [REGFILE_WIDTH:0] S;
   wire [REGFILE_WIDTH-1:0] shft;
   wire Cout;

   // Inversion logic for adder operand (used for subtract)
   wire [REGFILE_WIDTH-1:0] A_inv;
   wire inv_A;

   assign inv_A = Op[3]&Op[2];
   assign A_inv = A ^ {32{inv_A}};

   // Add 1 bit at the end so we can see the Cout result
   assign S = {1'b0, A_inv} + {1'b0, B} + {32'h0, inv_A};
   assign Cout = S[REGFILE_WIDTH];

   shifter iSHFT(.In(A),.Cnt(B[4:0]),.Op(Op[1:0]),.Out(shft));

   wire SEQ, SLE, SLT;
   wire Ofl;

   assign Ofl = (S[REGFILE_WIDTH-1] & ~A_inv[REGFILE_WIDTH-1] & ~B[REGFILE_WIDTH-1]) | (~S[REGFILE_WIDTH-1] & A_inv[REGFILE_WIDTH-1] & B[REGFILE_WIDTH-1]);

   assign SEQ = ~|S;
   assign SLT = SLE & ~SEQ; 
   assign SLE = (~S[REGFILE_WIDTH-1] ^ Ofl);  

   always @* casex (Op)
      4'b0000 : begin alu_err = 1'b0; Out = S[REGFILE_WIDTH-1:0]; end
      4'b0001 : begin alu_err = 1'b0; Out = {31'h0, Cout}; end
      4'b0010 : begin alu_err = 1'b0; Out = A ^ B; end
      4'b0011 : begin alu_err = 1'b0; Out = A & ~B; end
      4'b01?? : begin alu_err = 1'b0; Out = shft; end
      4'b1000 : begin alu_err = 1'b0; Out = {A[0],A[1],A[2],A[3],A[4],A[5],A[6],A[7],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15],A[16],A[17],A[18],A[19],A[20],A[21],A[22],A[23],A[24],A[25],A[26],A[27],A[28],A[29],A[30],A[31]}; end
      4'b1001 : begin alu_err = 1'b0; Out = A; end
      4'b1010 : begin alu_err = 1'b0; Out = B; end
      4'b1011 : begin alu_err = 1'b0; Out = (A << 16) | B; end
      4'b1100 : begin alu_err = 1'b0; Out = {31'h0, SEQ}; end
      4'b1101 : begin alu_err = 1'b0; Out = {31'h0, SLT}; end
      4'b1110 : begin alu_err = 1'b0; Out = {31'h0, SLE}; end
      4'b1111 : begin alu_err = 1'b0; Out = S[REGFILE_WIDTH-1:0]; end
      default: begin  alu_err = 1'b1; Out = 32'hx; end
   endcase

    
endmodule
