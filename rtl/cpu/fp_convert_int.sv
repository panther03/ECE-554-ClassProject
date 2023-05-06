module fp_convert_int(A, intgr);
  input [31:0] A;
  output [31:0] intgr;

  logic A_sign;
  logic [7:0] A_exponent;
  logic [23:0] A_mantissa;
  
  assign A_sign = A[31];
  assign A_exponent = A[30:23];
  assign A_mantissa = {1'b1, A[22:0]};
  
  /////////////////
  //  Exponent  //
  ///////////////
  logic [7:0] exponent_unbiased;
  
  assign exponent_unbiased = A_exponent - 8'h7e;
  
  /////////////////
  //  Mantissa  //
  ///////////////
  logic [55:0] mantissa_shifter;
  logic [31:0] round_int;
  
  assign mantissa_shifter = {32'h0, A_mantissa} << exponent_unbiased;
  
  assign round_int = mantissa_shifter[55:24];
  
  
  ///////////////
  //  Output  //
  /////////////
  logic [31:0] negative_intgr;
  logic [31:0] positive_intgr;
  logic overflow;
  logic inf;
  
  assign overflow = (exponent_unbiased > 8'h1f);
  assign inf_nan = &A_exponent;
  assign negative_intgr = overflow ? 32'h80000000 : 
                                     ~round_int[31:0] + 1'b1;
                                     
  assign positive_intgr = overflow ? 32'h7fffffff : 
                                     round_int[31:0];
  
  assign intgr = inf_nan              ? 32'h7fffffff :
                 exponent_unbiased[7] ? 32'h0 :
                 A_sign               ? negative_intgr :
                                        positive_intgr;
  
endmodule