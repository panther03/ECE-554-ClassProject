module fp_multiplier_tb();
  
  logic [31:0] A, B, P;
  logic clk;
  
  fp_multiplier iMULT(.A(A), .B(B), .P(P));
  
  int i, j;
  initial begin
    clk = 0;
    
    testA_B(clk, A, B, P, 32'h3fc00000, 32'h3fc00000, 32'h40100000); // 1.5 * 1.5 = 2.25
    
    testA_B(clk, A, B, P, 32'h7f7fffff, 32'h7f7fffff, 32'h7f800000); // max * max
    
    testA_B(clk, A, B, P, 32'h00ffffff, 32'h00ffffff, 32'h00000000); // max-subnormal * max-subnormal
    
    testA_B(clk, A, B, P, 32'h7f7fffff, 32'h007FFFFF, 32'h407ffffd); // max * max-subnormal
    
    testA_B(clk, A, B, P, 32'h7f000001, 32'h00000001, 32'h34800001); // large number * min
    
    testA_B(clk, A, B, P, 32'h7f000000, 32'h00000001, 32'h34800000); // large number * min
    
    testA_B(clk, A, B, P, 32'h0fffffff, 32'h2f800001, 32'h00400000); // should produce subnormal with 1 in msb of mant
          
    testA_B(clk, A, B, P, 32'h0fffffff, 32'h2e000001, 32'h00080000); // should produce subnormal one 1
    
    testA_B(clk, A, B, P, 32'h0fbbffff, 32'h27000007, 32'h00000018); // subnormal with rounding
    
    testA_B(clk, A, B, P, 32'h0fbfffff, 32'h25000007, 32'h00000002); // subnormal with rounding
    
    $stop();
  end

  always
    #5 clk = ~clk;
    
  task automatic testA_B(ref clk, ref [31:0] A, ref [31:0] B, ref [31:0] P, input [31:0] A_in, input [31:0] B_in, input [31:0] P_expected);
    begin
      A = A_in;
      B = B_in;
    
      @(posedge clk);
      if (P !== P_expected)
        $display("expected %h, but got %h", P_expected, P);
    
      repeat (4) @(posedge clk);
    end
  endtask
endmodule