module fp_alu 
import wi23_defs::*;
(A, B, Op, clk, Out, alu_err);
  ///////////////////////////
  //  Inputs and Outputs  //
  /////////////////////////
  input [31:0] A;
  input [31:0] B;
  input [3:0] Op;
	input clk;
  output reg [31:0] Out;
  output reg alu_err;
	
	//////////////
	//  Types  //
	//////////// 
	logic A_sign, B_sign;
  logic [7:0] A_exponent, B_exponent;
  logic [22:0] A_mantissa, B_mantissa;
	
	assign A_sign = A[31];
	assign A_exponent = A[30:23];
	assign A_mantissa = A[22:0];
	
  assign B_sign = B[31];
	assign B_exponent = B[30:23];
	assign B_mantissa = B[22:0];
	
  logic [2:0] A_type, B_type;
  assign A_type = ~|A_exponent && ~|A_mantissa ? 3'b000 :  // Zero
				          ~|A_exponent && |A_mantissa  ? 3'b001 :  // Subnormal
				          &A_exponent && ~|A_mantissa  ? 3'b010 :  // Infinity
				          &A_exponent && |A_mantissa   ? 3'b011 :  // NaN
				                                         3'b100;   // Normal
				   
  assign B_type = ~|B_exponent && ~|B_mantissa ? 3'b000 :  // Zero
	   		          ~|B_exponent && |B_mantissa  ? 3'b001 :  // Subnormal
				          &B_exponent && ~|B_mantissa  ? 3'b010 :  // Infinity
				          &B_exponent && |B_mantissa   ? 3'b011 :  // NaN
				                                         3'b100;   // Normal 	
  
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
	
  fp_adder iADDER(.clk(clk), .A(A_adder), .B(B_adder), .subtract_unflopped(subtract), .S(S_adder));
  
	///////////////////
  //  Mulitplier  //
	/////////////////
  logic [31:0] Product;
  
  fp_multiplier iMULT(.A(A), .B(B), .P(Product));
  
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
  logic eq, lt, gt;
	logic exponent_lt, exponent_eq;
	logic mantissa_lt, mantissa_eq;
  logic isNaN;
  
  assign isNaN = (~A_type & (&A_type[1:0])) || (~B_type & (&B_type[1:0]));
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
																	
	//////////////
	//  Class  //
	////////////
	logic [31:0] class_code;
	
	assign class_code = A_type == 3'b010            ? 32'h0 :
	                    A_type == 3'b100 && A_sign  ? 32'h1 :
											A_type == 3'b001 && A_sign  ? 32'h2 :
											~|A_type && A_sign          ? 32'h3 :
											~|A_type && ~A_sign         ? 32'h4 :
											A_type == 3'b001 && ~A_sign ? 32'h5 :
											A_type == 3'b100 && ~A_sign ? 32'h6 :
										                                32'h7;
  
  ////////////////////
	//  Mux Outputs  //
	//////////////////
	logic eq_ff;
	logic le_ff;
	logic lt_ff;
	logic [31:0] Product_ff;
	logic [31:0] fp_ff;
	logic [31:0] intgr_ff;
	logic [31:0] A_ff;
	logic [3:0] Op_ff;
	
	always_ff @(posedge clk) begin
		eq_ff <= eq;
		le_ff <= lt | eq;
		lt_ff <= lt;
		Product_ff <= Product;
		fp_ff <= fp;
		intgr_ff <= intgr;
		A_ff <= A;
		Op_ff <= Op;
	end
	
	
  assign Out = ~|Op_ff | &Op_ff ? S_adder :
               Op_ff == 4'b0010 ? Product_ff :
							 Op_ff == 4'b1100 ? {31'h0, eq_ff} :
							 Op_ff == 4'b1110 ? {31'h0, le_ff} :
							 Op_ff == 4'b1101 ? {31'h0, lt_ff} :
							 Op_ff == 4'b0100 ? fp_ff :
							 Op_ff == 4'b0101 ? intgr_ff :
							                    A_ff;

endmodule
   