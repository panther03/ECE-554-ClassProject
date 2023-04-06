module fp_preadder
//import wi23_defs::*;
(A, B, A_type, B_type, A_out_sign, B_out_sign, Exponent_out, A_out_mantissa, B_out_mantissa, is_subnormal, Comp_out, swp);
  input [31:0] A;
  input [31:0] B;
  input [2:0] A_type;
  input [2:0] B_type;
  output A_out_sign;
  output B_out_sign;
  output [7:0] Exponent_out;
  output [27:0] A_out_mantissa;
  output [27:0] B_out_mantissa;
	output is_subnormal;
  output Comp_out;
	output swp;

  /////////////////////////
  //  Internal Signals  //
  ///////////////////////
  // Components of A and B
  logic A_sign, B_sign;
  logic [7:0] A_exponent, B_exponent;
  logic [27:0] A_mantissa, B_mantissa;
  logic [36:0] A_gaurd, B_gaurd;
  
  assign A_sign = A[31];
  assign B_sign = B[31];
  
  assign A_exponent = A[30:23];
  assign B_exponent = B[30:23];
  
  assign A_mantissa[27] = |A_exponent ? 1'b1 : 1'b0;
  assign A_mantissa[26:4] = A[22:0];
  assign A_mantissa[3:0] = 4'b0;
  
  assign B_mantissa[27] = |B_exponent ? 1'b1 : 1'b0;
  assign B_mantissa[26:4] = B[22:0];
  assign B_mantissa[3:0] = 4'b0;
  
  assign A_gaurd = {A_sign, A_exponent, A_mantissa};
  assign B_gaurd = {B_sign, B_exponent, B_mantissa};
  
/*
  3'b000 :  // Zero
  3'b001 :  // Subnormal
  3'b010 :  // Infinity
  3'b011 :  // NaN
  3'b100    // Normal
*/

  ///////////////////
  //  Subnormals  //
  /////////////////
  logic A_sub_sign, B_sub_sign;
  logic [27:0] A_sub_mantissa, B_sub_mantissa;
  logic [7:0] S_sub_exponent;
  
  logic comp_mantissa;
  
  assign is_subnormal = A_type == 3'b001 && B_type == 3'b001;
  assign comp_mantissa = A_mantissa >= B_mantissa;
  
  assign A_sub_sign = comp_mantissa ? A_sign :
                                      B_sign;
  assign B_sub_sign = comp_mantissa ? B_sign :
                                      A_sign;
  
  assign A_sub_mantissa = comp_mantissa ? A_mantissa :
                                          B_mantissa;
  assign B_sub_mantissa = comp_mantissa ? B_mantissa :
                                          A_mantissa;
								 
  assign S_sub_exponent = 8'h00;
  
  //////////////
  //  Mixed  //
  ////////////
  logic [36:0] A_mixed, B_mixed_inter, B_mixed;
	logic [27:0] B_mixed_shifted;
  logic [4:0] zero_count;
  
  logic is_mixed;
	// logic C_out_mix;
	// logic [7:0] exponent_diff_mix;
  
  // set subnormal to B
  assign A_mixed = ~|A_exponent ? B_gaurd : A_gaurd;
  assign B_mixed_inter = ~|A_exponent ? A_gaurd : B_gaurd;
  assign is_mixed = ~A_type[1] && ~B_type[1] && ((A_type[0] & B_type[2]) || (A_type[2] & B_type[0]));
  
  // count the zeros in B's mantissa
	/*
  assign zero_count = ~|B_mixed_inter[27:0]  ? 5'h1c : // -155  // irrelevant
                      ~|B_mixed_inter[27:1]  ? 5'h1b : // -154  // irrelevant
                      ~|B_mixed_inter[27:2]  ? 5'h1a : // -153  // irrelevant
                      ~|B_mixed_inter[27:3]  ? 5'h19 : // -152  // irrelevant
                      ~|B_mixed_inter[27:4]  ? 5'h18 : // -151  // irrelevant
                      ~|B_mixed_inter[27:5]  ? 5'h17 : // -150
                      ~|B_mixed_inter[27:6]  ? 5'h16 : // -149
                      ~|B_mixed_inter[27:7]  ? 5'h15 : // -148
                      ~|B_mixed_inter[27:8]  ? 5'h14 : // -147
                      ~|B_mixed_inter[27:9]  ? 5'h13 : // -146
                      ~|B_mixed_inter[27:10] ? 5'h12 : // -145
                      ~|B_mixed_inter[27:11] ? 5'h11 : // -144
                      ~|B_mixed_inter[27:12] ? 5'h10 : // -143
                      ~|B_mixed_inter[27:13] ? 5'h0f : // -142
                      ~|B_mixed_inter[27:14] ? 5'h0e : // -141
                      ~|B_mixed_inter[27:15] ? 5'h0d : // -140
                      ~|B_mixed_inter[27:16] ? 5'h0c : // -139
                      ~|B_mixed_inter[27:17] ? 5'h0b : // -138
                      ~|B_mixed_inter[27:18] ? 5'h0a : // -137
                      ~|B_mixed_inter[27:19] ? 5'h09 : // -136
                      ~|B_mixed_inter[27:20] ? 5'h08 : // -135
                      ~|B_mixed_inter[27:21] ? 5'h07 : // -134
                      ~|B_mixed_inter[27:22] ? 5'h06 : // -133
                      ~|B_mixed_inter[27:23] ? 5'h05 : // -132
                      ~|B_mixed_inter[27:24] ? 5'h04 : // -131
                      ~|B_mixed_inter[27:25] ? 5'h03 : // -130
                      ~|B_mixed_inter[27:26] ? 5'h02 : // -129
                      ~B_mixed_inter[27]     ? 5'h01 : // -128
                                               5'h0;   // -127*/
					  
	// assign {C_out_mix, exponent_diff_mix} = {4'b0, zero_count} + {1'b0, A_mixed[35:28]};
  assign B_mixed_shifted = B_mixed_inter[27:0] >> (A_mixed[35:28] - 1'b1);
  assign B_mixed = {B_mixed_inter[36], {8'h00}, B_mixed_shifted[27:0]};
  
  ///////////////
  //  Normal  //
  /////////////
  // signals
  logic [36:0] A_normal, B_normal;
  logic [27:0] A_normal_mantissa, B_normal_mantissa;
  logic [7:0] A_normal_exponent, B_normal_exponent;
  logic [27:0] A_normal_out_mantissa, B_normal_out_mantissa;
  logic [7:0] A_normal_out_exponent;
  logic [27:0] mantissa_to_shift;
  logic A_normal_sign, B_normal_sign;
  
  logic [7:0] exponent_diff;
  logic [4:0] normal_shift_amt;
  
  logic comp_normal;
  
  // logic
  assign A_normal = is_mixed ? A_mixed : A_gaurd;
  assign B_normal = is_mixed ? B_mixed : B_gaurd;
  
  assign A_normal_sign = A_normal[36];
  assign A_normal_exponent = A_normal[35:28];
  assign A_normal_mantissa = A_normal[27:0];
  
  assign B_normal_sign = B_normal[36];
  assign B_normal_exponent = B_normal[35:28];
  assign B_normal_mantissa = B_normal[27:0];
  
  assign comp_normal = (A_normal_exponent > B_normal_exponent) || B_normal[0] ?  1'b1 :  // A is bigger
                       A_normal_exponent < B_normal_exponent                  ?  1'b0 :  // B is bigger
                       A_normal_mantissa >= B_normal_mantissa                 ?  1'b1 :  // A_exponent = B_exponent but A is bigger
					                                                                       1'b0;

  assign A_normal_out_exponent = comp_normal ? A_normal_exponent : 
                                               B_normal_exponent;

  assign exponent_diff = comp_normal && ~B_normal[0] ? A_normal_exponent - B_normal_exponent : // A is larger and exponents have same sign
                         comp_normal && B_normal[0] ?  A_normal_exponent + B_normal_exponent : // A is larger and B has a negative exponent
						                        B_normal_exponent - A_normal_exponent;  // B is larger

  assign normal_shift_amt = exponent_diff <= 8'h1c ? exponent_diff[4:0] : // less than mantissa bit count
                                                     5'h1c;               // shift out all bits

  assign mantissa_to_shift = comp_normal ? B_normal_mantissa :
                                           A_normal_mantissa;
										   
  assign A_normal_out_mantissa = comp_normal ? A_normal_mantissa :
                                               B_normal_mantissa;
										   
  assign A_normal_out_sign = comp_normal ? A_normal_sign :
                                           B_normal_sign;
  assign B_normal_out_sign = comp_normal ? B_normal_sign :
                                           A_normal_sign;

  // shift B's mantissa by the number of 0's
  assign B_normal_out_mantissa = mantissa_to_shift >> normal_shift_amt;
  
  ////////////////////
  //  Mux Outputs  //
  //////////////////
  // signals
  logic A_out_sign, B_out_sign, Comp_out;
  logic [27:0] A_out_mantissa, B_out_mantissa;
  logic [7:0] Exponent_out;
  
  // logic
  assign A_out_sign = is_subnormal ? A_sub_sign :
	                    is_mixed     ? A_mixed[36] :
					                           A_normal_out_sign;
									 
  assign A_out_mantissa = is_subnormal ? A_sub_mantissa :
					                     A_normal_out_mantissa;
  
  assign B_out_sign = is_subnormal ? B_sub_sign :
	                    is_mixed     ? B_mixed[36] :
					                           B_normal_out_sign;
									 
  assign B_out_mantissa = is_subnormal ? B_sub_mantissa :
	                        is_mixed     ? B_mixed[27:0] :
					                               B_normal_out_mantissa;
  
  assign Exponent_out = is_subnormal ? S_sub_exponent :
	                      is_mixed     ? A_mixed[35:28] :
                                       A_normal_out_exponent;
									   
  assign Comp_out = is_subnormal ? comp_mantissa :
	                                 1'b1;
	/*                  is_mixed     ? 1'b1 :
                                   comp_normal;*/
	assign swp = is_subnormal ? ~comp_mantissa :
	             is_mixed     ? ~|A_exponent :
							                ~comp_normal;
endmodule