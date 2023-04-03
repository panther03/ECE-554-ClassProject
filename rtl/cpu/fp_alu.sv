module fp_alu 
import wi23_defs::*;
(A, B, Op, Out, alu_err);
  ///////////////////////////
  //  Inputs and Outputs  //
  /////////////////////////
  input [31:0] A;
  input [31:0] B;
  input [3:0] Op;
  output reg [31:0] Out;
  output reg alu_err;
  
  //////////////
	//  Adder  //
	////////////
  logic subtract;
  logic [31:0] S_adder;
	logic [31:0] A_adder;
	logic [31:0] B_adder;
  
  assign subtract = &Op;
	assign A_adder = subtract ? B : A;
	assign B_adder = subtract ? A : B;
	
  fp_adder iADDER(.A(A_adder), .B(B_adder), .subtract(subtract), .S(S_adder));
  
	///////////////////
  //  Mulitplier  //
	/////////////////
  logic [31:0] S_multiplier;
  
  fp_multiplier iMULT(.A(A), .B(B), .P(S_multiplier));
  
	//////////////////////
	//  Convert to FP  //
	////////////////////
	logic [31:0] fp;
	
	fp_convert_fp iCONVFP(.A(A), .fp(fp));
	
	///////////////////////
	//  Convert to Int  //
	/////////////////////
	logic [31:0] intgr;
	
	fp_convert_int iCONVINT(.A(A), .intgr(intgr));
	
  ///////////////////
	//  Comparator  //
	/////////////////
  // &A_ex && |A_m   ? 3'b011 :  // NaN
  logic A_sign, B_sign;
  logic [7:0] A_exponent, B_exponent;
  logic [22:0] A_mantissa, B_mantissa;
  
  logic eq, lt, gt;
  logic isNaN;
  
  assign isNaN = (&A_exponent && |A_mantissa) || (&B_exponent && |B_mantissa);
  assign eq = isNaN ? 1'b0 : A == B;
  
  assign exponent_lt = A_exponent < B_exponent;
  assign exponent_eq = A_exponent == B_exponent;
	
	assign mantissa_lt = A_mantissa < B_mantissa;
	assign mantissa_eq = A_mantissa == B_mantissa;
  
  assign lt = isNaN ? 1'b0 : 
	            A_sign & ~B_sign  ? 1'b1 :
							~A_sign & B_sign  ? 1'b0 :
							~A_sign & ~B_sign ? exponent_lt | (exponent_eq & mantissa_lt) :
							                    (~exponent_lt & ~exponent_eq) | (exponent_eq & (~mantissa_lt & ~mantissa_eq));
  
  ////////////////////
	//  Mux Outputs  //
	//////////////////
  assign Out = ~|Op | subtract ? S_adder :
               Op == 4'b0010   ? S_multiplier :
							 Op == 4'b1100   ? {31'h0, eq} :
							 Op == 4'b1110   ? {31'h0, lt | eq} :
							 Op == 4'b1101   ? {31'h0, lt} :
							 Op == 4'b0100   ? fp :
							 Op == 4'b0101   ? intgr :
							                   A;

endmodule
   