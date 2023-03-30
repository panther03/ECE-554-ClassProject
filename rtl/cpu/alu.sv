module alu 
import wi23_defs::*;
(A, B, Op, Out, alu_err);
   
   input [REGFILE_WIDTH-1:0] A;
   input [REGFILE_WIDTH-1:0] B;
   input [4:0] Op;
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

   always_comb begin
   alu_err = 1'b0;
      casex (Op)
         5'b00000 : begin Out = S[REGFILE_WIDTH-1:0]; end
         5'b00010 : begin Out = A ^ B; end
         5'b00011 : begin Out = A & ~B; end
         5'b001?? : begin Out = shft; end
         5'b01000 : begin Out = {A[0],A[1],A[2],A[3],A[4],A[5],A[6],A[7],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15],A[16],A[17],A[18],A[19],A[20],A[21],A[22],A[23],A[24],A[25],A[26],A[27],A[28],A[29],A[30],A[31]}; end
         5'b01001 : begin Out = A; end
         5'b01010 : begin Out = B; end
         5'b01011 : begin Out = (A << 16) | B; end
         5'b01100 : begin Out = {31'h0, SEQ}; end
         5'b01101 : begin Out = {31'h0, SLT}; end
         5'b01110 : begin Out = {31'h0, SLE}; end
         5'b01111 : begin Out = S[REGFILE_WIDTH-1:0]; end
         5'b10011 : begin Out = A & B; end
         5'b10010 : begin Out = A | B; end 
         default: begin  alu_err = 1'b1; Out = 32'hx; end
      endcase
   end

    
endmodule
