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
  
  
  // Mux output
  assign Out = (Op == 2'b00) | (Op == 2'b01) ? S_adder :
                                               S_multiplier;

endmodule
   