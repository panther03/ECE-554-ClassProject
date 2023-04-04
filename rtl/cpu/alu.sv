module alu 
import wi23_defs::*;
(  
   // Inputs
   input logic [REGFILE_WIDTH-1:0]  A,
   input logic [REGFILE_WIDTH-1:0]  B,
   input logic [4:0]                Op,
   input logic                      UnsignedOp,

   // Outputs
   output logic [REGFILE_WIDTH-1:0] Out,
   output logic                     alu_err
);

   logic [REGFILE_WIDTH:0] S;
   logic [REGFILE_WIDTH-1:0] shft;
   logic Cout;

   // Inversion logic for adder operand (used for subtract)
   logic [REGFILE_WIDTH-1:0] A_inv;
   logic inv_A;

   assign inv_A = Op[3]&Op[2];
   assign A_inv = A ^ {32{inv_A}};

   // Add 1 bit at the end so we can see the Cout result
   assign S = {1'b0, A_inv} + {1'b0, B} + {32'h0, inv_A};
   assign Cout = S[REGFILE_WIDTH];

   shifter iSHFT(.In(A),.Cnt(B[4:0]),.UnsignedOp(UnsignedOp),.Op(Op[1:0]),.Out(shft));

   logic SEQ, SLE, SLT;
   logic USLE, USLT;
   logic Ofl;

   assign Ofl = (S[REGFILE_WIDTH-1] & ~A_inv[REGFILE_WIDTH-1] & ~B[REGFILE_WIDTH-1]) | (~S[REGFILE_WIDTH-1] & A_inv[REGFILE_WIDTH-1] & B[REGFILE_WIDTH-1]);

   assign SEQ = ~|S;
   assign SLE = (~S[REGFILE_WIDTH-1] ^ Ofl);
   assign SLT = SLE & ~SEQ; 

   always_comb begin
      alu_err = 1'b0;
      casex (Op)
         5'b00000 : begin Out = S[REGFILE_WIDTH-1:0]; end   // ADD, ADDI, BEQZ, BNEZ, BLTZ, BGEZ, ST, LD, STU
         5'b00010 : begin Out = A ^ B; end   // XOR, XORI
         5'b00011 : begin Out = A & ~B; end  // ANDN, ANDNI
         5'b001?? : begin Out = shft; end    // SLL, SRL, SLLI, SRLI, ROR, ROL, RORI, ROLI
         5'b01001 : begin Out = A; end       // JAL, JALR
         5'b01010 : begin Out = B; end       // LBI
         5'b01011 : begin Out = (A << 16) | B; end // SLBI
         5'b01100 : begin Out = {31'h0, SEQ}; end  // SEQ
         5'b01101 : begin Out = ~UnsignedOp ? {31'h0, SLT} : {31'h0, SLT}; end   // SLT, USLT
         5'b01110 : begin Out = ~UnsignedOp ? {31'h0, SLE} : {31'h0, SLE}; end   // SLE, USLE
         5'b01111 : begin Out = S[REGFILE_WIDTH-1:0]; end   // SUB, SUBI
         5'b10011 : begin Out = A & B; end   // AND, ANDI
         5'b10010 : begin Out = A | B; end   // OR, ORI
         default: begin  alu_err = 1'b1; Out = 32'hx; end
      endcase
   end

    
endmodule
