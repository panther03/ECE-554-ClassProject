module alu 
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
   
  /////////////////////////
  //  Internal Signals  //
  ///////////////////////
  // Components of A and B
  logic A_sign, B_sign;
  logic [7:0] A_exponent, B_exponent;
  logic [22:0] A_mantissa, B_mantissa;
  
  assign A_sign = A[31];
  assign B_sign = B[31];
  
  assign A_exponent = A[30:23];
  assign B_exponent = B[30:23];
   
  assign A_mantissa = A[22:0];
  assign B_mantissa = B[22:0];
   
  // Special case signals
  logic [2:0] A_type, B_type;
  logic [31:0] S_special;
  logic S_special_sign;
  logic [7:0] S_special_exponent;
  logic [22:0] S_special_mantissa;
  
  assign S_special = {S_special_sign, S_special_exponent, S_special_mantissa};
  
  // subnormal signals
  logic [22:0] A_sub_mantissa, B_sub_mantissa;
  logic [7:0] S_sub_exponent;
  
  // mixed signals
  logic [31:0] A_mixed, B_mixed;
  logic [4:0] zero_count;
  
  
   
  //////////////////////
  //  Special Cases  //
  ////////////////////
  assign A_type = ~|A_exponent && ~|A_mantissa ? 3'b000 :  // Zero
				  ~|A_exponent && |A_mantissa  ? 3'b001 :  // Subnormal
				  &A_exponent && ~|A_mantissa  ? 3'b010 :  // Infinity
				  &A_exponent && |A_mantissa   ? 3'b011 :  // NaN
				  3'b100                                   // Normal
				   
  assign B_type = ~|B_exponent && ~|B_mantissa ? 3'b000 :  // Zero
	   		      ~|B_exponent && |B_mantissa  ? 3'b001 :  // Subnormal
				  &B_exponent && ~|B_mantissa  ? 3'b010 :  // Infinity
				  &B_exponent && |B_mantissa   ? 3'b011 :  // NaN
				  3'b100                                   // Normal 	

  assign S_special_sign = ~|A_type                                         ? B_sign :  // A is 0
						  ~|B_type                                         ? A_sign :  // B is 0
						  (~A_type[1] & (A[2] ^ A[0])) && B_type == 3'b010 ? B_sign :  // A = norm or subnorm and B = inf
						  (~B_type[1] & (B[2] ^ B[0])) && A_type == 3'b010 ? A_sign :  // A = inf and B = norm or subnorm
						  1'b1;                                                        // default to 1
						  
  assign S_special_exponent = ~|A_type                                                 ? B_exponent :  // A is 0
						      ~|B_type                                                 ? A_exponent :  // B is 0
							  (~A_type[1] & (A[2] ^ A[0])) && B_type == 3'b010         ? B_exponent :  // A = norm or subnorm and B = inf
						      (~B_type[1] & (B[2] ^ B[0])) && A_type == 3'b010         ? A_exponent :  // A = inf and B = norm or subnorm
							  A_type == 3'b010 && B_type == 3'b010 && A_sign == B_sign ? A_exponent :  // A = inf and B = inf and same sign
							  8'hff;                                                                   // default to ff (for NaN result)

  assign S_special_mantissa = ~|A_type                                                 ? B_mantissa :  // A is 0
						      ~|B_type                                                 ? A_mantissa :  // B is 0
							  (~A_type[1] & (A[2] ^ A[0])) && B_type == 3'b010         ? B_mantissa :  // A = norm or subnorm and B = inf
						      (~B_type[1] & (B[2] ^ B[0])) && A_type == 3'b010         ? A_mantissa :  // A = inf and B = norm or subnorm
							  A_type == 3'b010 && B_type == 3'b010 && A_sign == B_sign ? A_mantissa :  // A = inf and B = inf and same sign
							  23'h000001;                                                              // default to 1 (for NaN result)

  ///////////////////
  //  Subnormals  //
  /////////////////
  assign comp = A_mantissa >= B_mantissa;
  
  assign A_sub_mantissa = comp ? A_mantissa :
                                 B_mantissa;
  assign B_sub_mantissa = comp ? B_mantissa :
                                 A_mantissa;
								 
  assign S_sub_exponent = 8'h00;
  
  //////////////
  //  Mixed  //
  ////////////
  // set subnormal to B
  assign A_mixed = ~|A_exponent ? B : A;
  assign B_mixed_inter = ~|A_exponent ? A : B;
  
  // count the zeros in B's mantissa
  assign zero_count = B_mixed_inter[22:0] == 23'h0 ? 5'h17 :
                      B_mixed_inter[22:1] == 22'h0 ? 5'h16 :
					  B_mixed_inter[22:2] == 21'h0 ? 5'h15 :
					  B_mixed_inter[22:3] == 20'h0 ? 5'h14 :
					  B_mixed_inter[22:4] == 19'h0 ? 5'h13 :
					  B_mixed_inter[22:5] == 18'h0 ? 5'h12 :
					  B_mixed_inter[22:6] == 17'h0 ? 5'h11 :
					  B_mixed_inter[22:7] == 16'h0 ? 5'h10 :
					  B_mixed_inter[22:8] == 15'h0 ? 5'h0f :
					  B_mixed_inter[22:9] == 14'h0 ? 5'h0e :
					  B_mixed_inter[22:10] == 13'h0 ? 5'0d :
					  B_mixed_inter[22:11] == 12'h0 ? 5'0c :
					  B_mixed_inter[22:12] == 11'h0 ? 5'0b :
					  B_mixed_inter[22:13] == 10'h0 ? 5'h0a :
					  B_mixed_inter[22:14] == 9'h0 ? 5'h09 :
					  B_mixed_inter[22:15] == 8'h0 ? 5'h08 :
					  B_mixed_inter[22:16] == 7'h0 ? 5'h07 :
					  B_mixed_inter[22:17] == 6'h0 ? 5'h06 :
					  B_mixed_inter[22:18] == 5'h0 ? 5'h05 :
					  B_mixed_inter[22:19] == 4'h0 ? 5'h04 :
					  B_mixed_inter[22:20] == 3'h0 ? 5'h03 :
					  B_mixed_inter[22:21] == 2'h0 ? 5'h02 :
					  B_mixed_inter[22] == 1'h0 ? 5'h01 :
					  5'h0;
  
  // shift B's mantissa by the number of 0's
  assign sr4_in = {16'h0,B_mixed_inter[22:16]}; // >> 16
  assign sr3_in = {8'h0,sr4_out[22:8]};         // >> 8
  assign sr2_in = {4'h0,sr3_out[22:4]};         // >> 4
  assign sr1_in = {2'h0,sr2_out[22:2]};         // >> 2
  assign sr0_in = {1'h0,sr1_out[22:1]};         // >> 1
  
  
  assign sr4_out = zero_count[4] ? sr4_in : B_mixed_inter[22:0];
  assign sr3_out = zero_count[3] ? sr3_in : sr4_out;
  assign sr2_out = zero_count[2] ? sr2_in : sr3_out;
  assign sr1_out = zero_count[1] ? sr1_in : sr2_out;
  assign B_mixed_inter_shifted = zero_count[0] ? sr0_in : sr1_out;
endmodule
   