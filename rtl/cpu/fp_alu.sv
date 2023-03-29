module fp_alu 
import wi23_defs::*;
(A, B, Op, Out, alu_err);
  ///////////////////////////
  //  Inputs and Outputs  //
  /////////////////////////
  input [31:0] A;
  input [31:0] B;
  input [1:0] Op;
  output reg [31:0] Out;
  output reg alu_err;
  
  // Adder
  logic subtract;
  logic [31:0] S_adder;
  
  assign subtract = Op[0] & ~Op[1];
  fp_adder iADDER(.A(A), .B(B), .subtract(subtract), .S(S_adder));
  
  // Mulitplier
  logic [31:0] S_multiplier;
  
  fp_multiplier iMULT(.A(A), .B(B), .P(S_multiplier));
  
  // Comparison
  // &A_ex && |A_m   ? 3'b011 :  // NaN
  logic A_sign, B_sign;
  logic [7:0] A_exponent, B_exponent;
  logic [22:0] A_mantissa, B_mantissa;
  
  logic eq, lt, gt;
  logic isNaN;
  
  assign isNaN = (&A_exponent && |A_mantissa) || (&B_exponent && |B_mantissa);
  assign eq = isNaN ? 1'b0 : A == B;
  
  assign exponent_gt = A_exponent > B_exponent;
  assign exponent_lt = A_exponent < B_exponent;
  assign exponent_eq = A_exponent == B_exponent;
  
  assign lt = isNaN ? 1'b0 : A == B;
  
  // Mux output
  assign Out = (Op == 2'b00) | (Op == 2'b01) ? S_adder :
                                               S_multiplier;

endmodule
   