module fp_adder(clk, A, B, subtract_unflopped, S);
  input clk;
  input [31:0] A;
  input [31:0] B;
  input subtract_unflopped;
  output [31:0] S;

  /////////////////////////
  //  Internal Signals  //
  ///////////////////////
  // preadder signals
  logic [7:0] A_ex, B_ex;
  logic [22:0] A_m, B_m;
  logic A_s, B_s;
  
  assign A_ex = A[30:23];
  assign B_ex = B[30:23];
   
  assign A_m = A[22:0];
  assign B_m = B[22:0];
  
  assign A_s = A[31];
  assign B_s = B[31];
  
  // types
  logic [2:0] A_type, B_type;
  assign A_type = ~|A_ex && ~|A_m ? 3'b000 :  // Zero
                  ~|A_ex && |A_m  ? 3'b001 :  // Subnormal
                  &A_ex && ~|A_m  ? 3'b010 :  // Infinity
                  &A_ex && |A_m   ? 3'b011 :  // NaN
                                    3'b100;   // Normal
           
  assign B_type = ~|B_ex && ~|B_m ? 3'b000 :  // Zero
                   ~|B_ex && |B_m  ? 3'b001 :  // Subnormal
                  &B_ex && ~|B_m  ? 3'b010 :  // Infinity
                  &B_ex && |B_m   ? 3'b011 :  // NaN
                                    3'b100;   // Normal   
  
  /////////////////////////////////////////////////
  ///////////////   Special Cases    //////////////
  /////////////////////////////////////////////////
  // Special case signals
  logic [31:0] S_special_unflopped;
  logic S_special_sign;
  logic [7:0] S_special_exponent;
  logic [22:0] S_special_mantissa;
  
  logic is_special_unflopped;
  
  assign S_special_unflopped = {S_special_sign, S_special_exponent, S_special_mantissa};
  
  assign is_special_unflopped = (~^A_type | ~^B_type) || A_type == 3'b010 || B_type == 3'b010 ? 1'b1 : 1'b0;
  assign S_special_sign = ~|A_type                                                   ? B_s :  // A is 0
                          ~|B_type                                                   ? A_s :  // B is 0
                          (~A_type[1] & (A_type[2] ^ A_type[0])) && B_type == 3'b010 ? B_s :  // A = norm or subnorm and B = inf
                          (~B_type[1] & (B_type[2] ^ B_type[0])) && A_type == 3'b010 ? A_s :  // A = inf and B = norm or subnorm
                          B_type == 3'b010 && A_type == 3'b010 && A_s ~^ B_s         ? A_s :
                                                                                       1'b1;  // default to 1
              
  assign S_special_exponent = ~|A_type                                                   ? B_ex :  // A is 0
                              ~|B_type                                                   ? A_ex :  // B is 0
                              (~A_type[1] & (A_type[2] ^ A_type[0])) && B_type == 3'b010 ? B_ex :  // A = norm or subnorm and B = inf
                              (~B_type[1] & (B_type[2] ^ B_type[0])) && A_type == 3'b010 ? A_ex :  // A = inf and B = norm or subnorm
                              A_type == 3'b010 && B_type == 3'b010 && A_s == B_s         ? A_ex :  // A = inf and B = inf and same sign
                                                                                           8'hff;  // default to ff (for NaN result)

  assign S_special_mantissa = ~|A_type                                                   ? B_m :        // A is 0
                              ~|B_type                                                   ? A_m :        // B is 0
                              (~A_type[1] & (A_type[2] ^ A_type[0])) && B_type == 3'b010 ? B_m :        // A = norm or subnorm and B = inf
                              (~B_type[1] & (B_type[2] ^ B_type[0])) && A_type == 3'b010 ? A_m :        // A = inf and B = norm or subnorm
                              A_type == 3'b010 && B_type == 3'b010 && A_s == B_s         ? A_m :        // A = inf and B = inf and same sign
                                                                                           23'h000001;  // default to 1 (for NaN result)
  
  /////////////////////////////////////////////////
  ///////////////    PRE-ADDER    /////////////////
  /////////////////////////////////////////////////
  logic A_sign_unflopped, B_sign_unflopped;
  logic [27:0] A_mantissa_preadder_unflopped, B_mantissa_preadder_unflopped;
  logic [7:0] Exponent_preadder_unflopped;
  logic comp_unflopped;
  logic swp_unflopped;
  logic is_subnormal_unflopped;

  fp_preadder iPREADDER(.A(A), .B(B), .A_type(A_type), .B_type(B_type), .A_out_sign(A_sign_unflopped), .B_out_sign(B_sign_unflopped), .Exponent_out(Exponent_preadder_unflopped), .A_out_mantissa(A_mantissa_preadder_unflopped), .B_out_mantissa(B_mantissa_preadder_unflopped), .is_subnormal(is_subnormal_unflopped), .Comp_out(comp_unflopped), .swp(swp_unflopped));
  
  /////////////
  //  Flop  //
  ///////////
  logic A_sign, B_sign;
  logic [27:0] A_mantissa_preadder, B_mantissa_preadder;
  logic [7:0] Exponent_preadder;
  logic comp;
  logic swp;
  logic is_subnormal;
  logic subtract;
  logic is_special;
  logic [31:0] S_special;
  
  always_ff @(posedge clk) begin
    A_sign <= A_sign_unflopped;
    B_sign <= B_sign_unflopped;
    A_mantissa_preadder <= A_mantissa_preadder_unflopped;
    B_mantissa_preadder <= B_mantissa_preadder_unflopped;
    Exponent_preadder <= Exponent_preadder_unflopped;
    comp <= comp_unflopped;
    swp <= swp_unflopped;
    is_subnormal <= is_subnormal_unflopped;
    subtract <= subtract_unflopped;
    is_special <= is_special_unflopped;
    S_special <= S_special_unflopped;
  end
  
  /////////////////////////////////////////////////
  ///////////////      ADDER      /////////////////
  /////////////////////////////////////////////////
  /////////////////
  //  Sign-out  //
  ///////////////
  // signals
  logic B_sign_with_op;
  logic Sign_out;
  logic subtract_mod;
  logic [27:0] A_mantissa, B_mantissa;
	logic eq;
  
  // logic
  assign B_sign_with_op = B_sign ^ subtract;
	assign eq = A_mantissa_preadder == B_mantissa_preadder;
  
  assign Sign_out = subtract ? (A_sign & (~swp) /*& (~eq)*/) | (~A_sign & swp) :
                               (A_sign & (B_sign_with_op | comp)) | (~A_sign & B_sign_with_op & ~comp);
  
  assign A_mantissa = A_mantissa_preadder;
                         
  assign B_mantissa = B_mantissa_preadder;
                         
  assign subtract_mod = A_sign != B_sign_with_op;
  
  //////////////
  //  Adder  //
  ////////////
  // signals
  logic C_in, C_out;
  logic [27:0] B_mantissa_adder;
  logic [27:0] S_adder_signed;
  logic [27:0] S_adder;
  
  //logic
  assign C_in = subtract_mod ? 1'b1 : 1'b0;
  assign B_mantissa_adder = subtract_mod ? ~B_mantissa : B_mantissa;
  assign {C_out, S_adder_signed} = {1'b0, A_mantissa} + {subtract_mod, B_mantissa_adder} + C_in;
  
  assign S_adder = C_out & subtract_mod ? ~S_adder_signed + 1'b1 : S_adder_signed;
  
  /////////////////////////////////////////////////
  ///////////////    Normalize    /////////////////
  /////////////////////////////////////////////////
  ///////////////////
  //  Zero-Count  //
  /////////////////
  logic [4:0] zero_count;
  
  assign zero_count = ~|S_adder[27:0]  ? 5'h1c :
                      ~|S_adder[27:1]  ? 5'h1b :
                      ~|S_adder[27:2]  ? 5'h1a :
                      ~|S_adder[27:3]  ? 5'h19 :
                      ~|S_adder[27:4]  ? 5'h18 :
                      ~|S_adder[27:5]  ? 5'h17 :
                      ~|S_adder[27:6]  ? 5'h16 :
                      ~|S_adder[27:7]  ? 5'h15 :
                      ~|S_adder[27:8]  ? 5'h14 :
                      ~|S_adder[27:9]  ? 5'h13 :
                      ~|S_adder[27:10] ? 5'h12 :
                      ~|S_adder[27:11] ? 5'h11 :
                      ~|S_adder[27:12] ? 5'h10 :
                      ~|S_adder[27:13] ? 5'h0f :
                      ~|S_adder[27:14] ? 5'h0e :
                      ~|S_adder[27:15] ? 5'h0d :
                      ~|S_adder[27:16] ? 5'h0c :
                      ~|S_adder[27:17] ? 5'h0b :
                      ~|S_adder[27:18] ? 5'h0a :
                      ~|S_adder[27:19] ? 5'h09 :
                      ~|S_adder[27:20] ? 5'h08 :
                      ~|S_adder[27:21] ? 5'h07 :
                      ~|S_adder[27:22] ? 5'h06 :
                      ~|S_adder[27:23] ? 5'h05 :
                      ~|S_adder[27:24] ? 5'h04 :
                      ~|S_adder[27:25] ? 5'h03 :
                      ~|S_adder[27:26] ? 5'h02 :
                      ~|S_adder[27]    ? 5'h01 :
                                         5'h0;
  
  /////////////////
  //  Exponent  //
  ///////////////
  // signals
  logic [4:0] shift;
  logic [7:0] Exponent;
  logic [27:0] shifted_mantissa;
  logic [22:0] Mantissa_out;
  
  // logic
  assign shift = Exponent_preadder > zero_count ? zero_count :
                                                  Exponent_preadder[4:0];
  
  assign overflow = Exponent_preadder == 8'hfe && (C_out & ~subtract_mod);
  assign Exponent = overflow                            ? 8'hff :
                    is_subnormal & shifted_mantissa[27] ? 8'h01 :
                    is_subnormal | (~|S_adder & ~C_out) ? 8'h00 : 
                    subtract_mod                        ? Exponent_preadder - zero_count :
                                                          Exponent_preadder + C_out;
  
  //////////////
  //  Round  //
  ////////////
  assign shifted_mantissa = C_out & subtract_mod ? S_adder << (1'b1 + shift):
                            C_out                ? S_adder :
                                                   S_adder << shift;
  
  // in doc range is 26:4
  assign Mantissa_out = overflow                    ? 23'h0 :
                        shifted_mantissa[4] & C_out ? shifted_mantissa[27:5] + 1'b1 :
                        C_out                       ? shifted_mantissa[27:5] :
                        shifted_mantissa[3]         ? shifted_mantissa[26:4] + 1'b1 :
                                                      shifted_mantissa[26:4];

  //////////////////
  //  Vecotrize  //
  ////////////////
  logic [31:0] S_normal;
  assign S_normal = {Sign_out, Exponent, Mantissa_out};
  
  assign S = is_special ? S_special :
                          S_normal;
endmodule