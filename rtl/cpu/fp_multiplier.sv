module fp_multiplier(A, B, P);
  input [31:0] A;
  input [31:0] B;
  output [31:0] P;
  
  /////////////////////////
  //  Internal Signals  //
  ///////////////////////
  logic [7:0] A_exponent, B_exponent;
  logic [22:0] A_mantissa, B_mantissa;
  logic A_sign, B_sign;

  assign A_sign = A[31];
  assign B_sign = B[31];
  
  assign A_exponent = A[30:23];
  assign B_exponent = B[30:23];
   
  assign A_mantissa = A[22:0];
  assign B_mantissa = B[22:0];
  
  // types
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
  
  logic A_NaN, B_NaN;
  assign A_NaN = ~A_type[2] & &A_type[1:0];
  assign B_NaN = ~B_type[2] & &B_type[1:0];
                                        
  /////////////////
  //  Sign_Out  //
  ///////////////
  logic Sign_out;
  assign Sign_out = A_sign ^ B_sign;
  
  /////////////////////////////////////////////////
  ///////////////   Special Cases    //////////////
  /////////////////////////////////////////////////
  // Special case signals
  logic [31:0] P_special;
  logic P_special_sign;
  logic [7:0] P_special_exponent;
  logic [22:0] P_special_mantissa;
  
  logic is_special;
  logic is_mixed;
  logic inf_overflow, underflow;
  
  assign P_special = {P_special_sign, P_special_exponent, P_special_mantissa};
  
  assign is_mixed = ~A_type[1] && ~B_type[1] && ((A_type[0] & B_type[2]) || (A_type[2] & B_type[0]));
  assign is_special = (A_type == 3'b100 && B_type == 3'b100) || is_mixed ? 1'b0 : 1'b1;
  assign P_special_sign = ~|A_type                                                   ? Sign_out :  // A is 0
                          ~|B_type                                                   ? Sign_out :  // B is 0
                          (~A_type[1] & (A_type[2] ^ A_type[0])) && B_type == 3'b010 ? B_sign :  // A = norm or subnorm and B = inf
                          (~B_type[1] & (B_type[2] ^ B_type[0])) && A_type == 3'b010 ? A_sign :  // A = inf and B = norm or subnorm
                          A_type == 3'b010 && B_type == 3'b010 && A_sign == B_sign   ? 1'b0 :    // both inf and same sign
                                                                                       (A_NaN ? A_sign : B_sign);  // default to sign of NaN
              
  assign P_special_exponent = ~|A_type                                 ? A_exponent :  // A is 0
                              ~|B_type                                 ? B_exponent :  // B is 0
                              (A_type == 3'b001) && (B_type == 3'b001) ? A_exponent :  // two subnorms multiply to 0
                                                                         (A_NaN ? A_exponent : B_exponent);  // default to NaN exponent

  assign P_special_mantissa = ~|A_type                                 ? A_mantissa :  // A is 0
                              ~|B_type                                 ? B_mantissa :  // B is 0
                              B_type == 3'b010                         ? B_mantissa :  // B = inf
                              A_type == 3'b010                         ? A_mantissa :  // A = inf
                              (A_type == 3'b001) && (B_type == 3'b001) ? 23'h0 :       // two subnorms multiply to 0
                                                                         (A_NaN ? A_mantissa : B_mantissa);  // default to NaN mantissa
  
  ///////////////////////
  //  Multiplication  //
  /////////////////////
  logic [47:0] multiplicand;
  logic [22:0] rounded_mantissa;
  logic A_msb, B_msb;
  
  assign A_msb = A_type != 3'b001;
  assign B_msb = B_type != 3'b001;
  assign multiplicand = {A_msb, A_mantissa} * {B_msb, B_mantissa};
                                
  //////////////////
  //  Normalize  //
  ////////////////
  logic [4:0] potential_shift_amt;
  logic [4:0] subnormal_shift_amt;
  logic [4:0] subnormal_shift_amt_adjusted;
  logic [47:0] mantissa_shifted;
  logic [7:0] exponent_add_val;
  logic is_subnormal_out;
  
  // detect where most significant 1 is.
  assign potential_shift_amt = multiplicand[47] ? 5'h1 :  // +1
                               multiplicand[46] ? 5'h2 :  // +0
                               multiplicand[45] ? 5'h3 :  // -1
                               multiplicand[44] ? 5'h4 :  // -2
                               multiplicand[43] ? 5'h5 :  // -3
                               multiplicand[42] ? 5'h6 :  // -4
                               multiplicand[41] ? 5'h7 :  // -5
                               multiplicand[40] ? 5'h8 :  // -6
                               multiplicand[39] ? 5'h9 :  // -7
                               multiplicand[38] ? 5'ha :  // -8
                               multiplicand[37] ? 5'hb :  // -9
                               multiplicand[36] ? 5'hc :  // -a
                               multiplicand[35] ? 5'hd :  // -b
                               multiplicand[34] ? 5'he :  // -c
                               multiplicand[33] ? 5'hf :  // -d
                               multiplicand[32] ? 5'h10 : // -e
                               multiplicand[31] ? 5'h11 : // -f
                               multiplicand[30] ? 5'h12 : // -10
                               multiplicand[29] ? 5'h13 : // -11
                               multiplicand[28] ? 5'h14 : // -12
                               multiplicand[27] ? 5'h15 : // -13
                               multiplicand[26] ? 5'h16 : // -14
                               multiplicand[25] ? 5'h17 : // -15
                               multiplicand[25] ? 5'h18 : // -16
                                                  5'h19;  // -17
                          
  assign exponent_add_val = multiplicand[47] ? 8'h01 :  // +1
                            multiplicand[46] ? 8'h00 :  // +0
                            multiplicand[45] ? 8'hff :  // -1
                            multiplicand[44] ? 8'hfe :  // -2
                            multiplicand[43] ? 8'hfd :  // -3
                            multiplicand[42] ? 8'hfc :  // -4
                            multiplicand[41] ? 8'hfb :  // -5
                            multiplicand[40] ? 8'hfa :  // -6
                            multiplicand[39] ? 8'hf9 :  // -7
                            multiplicand[38] ? 8'hf8 :  // -8
                            multiplicand[37] ? 8'hf7 :  // -9
                            multiplicand[36] ? 8'hf6 :  // -a
                            multiplicand[35] ? 8'hf5 :  // -b
                            multiplicand[34] ? 8'hf4 :  // -c
                            multiplicand[33] ? 8'hf3 :  // -d
                            multiplicand[32] ? 8'hf2 : // -e
                            multiplicand[31] ? 8'hf1 : // -f
                            multiplicand[30] ? 8'hf0 : // -10
                            multiplicand[29] ? 8'hef : // -11
                            multiplicand[28] ? 8'hee : // -12
                            multiplicand[27] ? 8'hed : // -13
                            multiplicand[26] ? 8'hec : // -14
                            multiplicand[25] ? 8'heb : // -15
                            multiplicand[25] ? 8'hea : // -16
                                               8'he9;  // -17
                 
  assign mantissa_shifted = is_subnormal_out ? multiplicand >> subnormal_shift_amt_adjusted : 
                                               multiplicand << potential_shift_amt;
  assign rounded_mantissa = mantissa_shifted[24] ? mantissa_shifted[47:25] + 1'b1 :
                                                   mantissa_shifted[47:25];
  
  /////////////////
  //  Exponent  //
  ///////////////
  logic [7:0] A_exponent_unbiased, B_exponent_unbiased;
  logic [8:0] exponent_sum;
  logic [7:0] exponent_after_shift;
  logic [7:0] exponent_biased;
  logic [7:0] exponent_to_bias;
  logic A_exponent_sign, B_exponent_sign;
  logic [1:0] xtr_bits;
  logic can_shift;
  logic zeroed;
  logic signed [8:0] signed_exponent_for_zeroed;
  
  assign A_exponent_unbiased = A_type == 3'b001 ? 8'h82 : // -126
                                                  A_exponent - 8'h7f;
  assign B_exponent_unbiased = B_type == 3'b001 ? 8'h82 : // -126
                                                  B_exponent - 8'h7f;
  assign A_exponent_sign = A_exponent_unbiased[7];
  assign B_exponent_sign = B_exponent_unbiased[7];
  
  assign exponent_sum = {A_exponent_sign, A_exponent_unbiased} + {B_exponent_sign, B_exponent_unbiased};
  assign {xtr_bits, exponent_after_shift} = exponent_sum + {exponent_add_val[7], exponent_add_val};
  
  assign exponent_biased = exponent_after_shift + 8'h7f;
  
  assign inf_overflow = exponent_after_shift[7] & ~A_exponent_sign & ~B_exponent_sign;
  assign underflow = ~exponent_after_shift[7] & A_exponent_sign & B_exponent_sign;
  
  // make sure exponent_after_shift must be greater than -127
  
  // check if exponent gets zeroed
  assign signed_exponent_for_zeroed = {xtr_bits[0], exponent_after_shift};
  assign zeroed = signed_exponent_for_zeroed <= 9'sh16a; // -150
  assign is_subnormal_out = signed_exponent_for_zeroed <= 9'sh181; // -127
  assign subnormal_shift_amt = 9'sh181 - signed_exponent_for_zeroed;
  assign subnormal_shift_amt_adjusted = multiplicand[47] ? subnormal_shift_amt :
                                                           subnormal_shift_amt - 1'b1;
  
  ///////////////
  //  Output  //
  /////////////
  logic [31:0] P_normal;
  logic [7:0] Exponent_out;
  logic [22:0] Mantissa_out;
  
  assign Exponent_out = inf_overflow ? 8'hff : 
                        underflow    ? 8'h00 :
                                       exponent_biased;
                     
  assign Mantissa_out = inf_overflow | zeroed ? 23'h0 :
                                                rounded_mantissa;
                     
  assign P_normal = {Sign_out, Exponent_out, Mantissa_out};

  assign P = is_special ? P_special :
                          P_normal;
endmodule