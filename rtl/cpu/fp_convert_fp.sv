module fp_convert_fp(A, fp);
  input [31:0] A;
  output [31:0] fp;
  
  logic Sign_out;
  logic [7:0] Exponent_out;
  logic [22:0] Mantissa_out;
  
  assign fp = {Sign_out, Exponent_out, Mantissa_out};

  /////////////////////
  //  Extract Sign  //
  ///////////////////
  assign Sign_out = A[31];
  
  /////////////////////////
  //  Extract Mantissa  //
  ///////////////////////
  logic [31:0] A_us;
  logic [31:0] mantissa_unrounded;
  logic [24:0] mantissa_rounded;
  logic round;
  logic round_carry_out;
  
  // unsigned A
  assign A_us = Sign_out ? ~A + 1'b1 : A;

  assign mantissa_unrounded = A_us[31] ? A_us :
                              A_us[30] ? A_us << 1 :
                              A_us[29] ? A_us << 2 :
                              A_us[28] ? A_us << 3 :
                              A_us[27] ? A_us << 4 :
                              A_us[26] ? A_us << 5 :
                              A_us[25] ? A_us << 6 :
                              A_us[24] ? A_us << 7 :
                              A_us[23] ? A_us << 8 :
                              A_us[22] ? A_us << 9 :
                              A_us[21] ? A_us << 10 :
                              A_us[20] ? A_us << 11 :
                              A_us[19] ? A_us << 12 :
                              A_us[18] ? A_us << 13 :
                              A_us[17] ? A_us << 14 :
                              A_us[16] ? A_us << 15 :
                              A_us[15] ? A_us << 16 :
                              A_us[14] ? A_us << 17 :
                              A_us[13] ? A_us << 18 :
                              A_us[12] ? A_us << 19 :
                              A_us[11] ? A_us << 20 :
                              A_us[10] ? A_us << 21 :
                              A_us[9]  ? A_us << 22 :
                              A_us[8]  ? A_us << 23 :
                              A_us[7]  ? A_us << 24 :
                              A_us[6]  ? A_us << 25 :
                              A_us[5]  ? A_us << 26 :
                              A_us[4]  ? A_us << 27 :
                              A_us[3]  ? A_us << 28 :
                              A_us[2]  ? A_us << 39 :
                              A_us[1]  ? A_us << 30 :
                                         32'h0;
  
  assign round = mantissa_unrounded[7:0] > 8'h7f;
  assign mantissa_rounded = round ? {1'b0, mantissa_unrounded[31:8]} + 25'h0000001 :
                                    {mantissa_unrounded[31:8], 1'b0};
  assign round_carry_out = round & mantissa_rounded[24];
  assign Mantissa_out = round_carry_out ? mantissa_rounded[23:1] :
                        round           ? mantissa_rounded[22:0] :
                                          mantissa_rounded[23:1];
  
  /////////////////
  //  Exponent  //
  ///////////////
  logic [7:0] exponent;
  
  assign exponent = A_us[31] ? 8'h9e :
                    A_us[30] ? 8'h9d :
                    A_us[29] ? 8'h9c :
                    A_us[28] ? 8'h9b :
                    A_us[27] ? 8'h9a :
                    A_us[26] ? 8'h99 :
                    A_us[25] ? 8'h98 :
                    A_us[24] ? 8'h97 :
                    A_us[23] ? 8'h96 :
                    A_us[22] ? 8'h95 :
                    A_us[21] ? 8'h94 :
                    A_us[20] ? 8'h93 :
                    A_us[19] ? 8'h92 :
                    A_us[18] ? 8'h91 :
                    A_us[17] ? 8'h90 :
                    A_us[16] ? 8'h8f :
                    A_us[15] ? 8'h8e :
                    A_us[14] ? 8'h8d :
                    A_us[13] ? 8'h8c :
                    A_us[12] ? 8'h8b :
                    A_us[11] ? 8'h8a :
                    A_us[10] ? 8'h89 :
                    A_us[9]  ? 8'h88 :
                    A_us[8]  ? 8'h87 :
                    A_us[7]  ? 8'h86 :
                    A_us[6]  ? 8'h85 :
                    A_us[5]  ? 8'h84 :
                    A_us[4]  ? 8'h83 :
                    A_us[3]  ? 8'h82 :
                    A_us[2]  ? 8'h81 :
                    A_us[1]  ? 8'h80 :
                    A_us[0]  ? 8'h7f :
                               8'h0;
                
  assign Exponent_out = round_carry_out ? exponent + 8'h01 :
                                          exponent;
endmodule