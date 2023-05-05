module fp_adder_tb();
  
  logic [31:0] A, B, S;
  logic subtract;
  logic clk;
  
  fp_adder iADDER(.clk(clk), .A(A), .B(B), .subtract_unflopped(subtract), .S(S));
  
  initial begin
    clk = 0;
    
    testA_B(clk, A, B, subtract, S, 32'h7f800000, 32'h7f800000, 1'b0, 32'h7f800000); // 1. inf + inf = inf
    
    testA_B(clk, A, B, subtract, S, 32'h7f800000, 32'hff800000, 1'b0, 32'hff800001); // 2. inf + -inf = nan
    
    testA_B(clk, A, B, subtract, S, 32'h3fc00000, 32'h3fc00000, 1'b0, 32'h40400000); // 3. 1.5 + 1.5 = 3
    
    testA_B(clk, A, B, subtract, S, 32'h7f7fffff, 32'h7f000007, 1'b0, 32'h7f800000); // 4. big + big = inf
    
    testA_B(clk, A, B, subtract, S, 32'h3F7FFFFF, 32'h37000007, 1'b0, 32'h3F800040); // 5. 0.99999994 + 7.629401E-6 = 1.0000076
    
    testA_B(clk, A, B, subtract, S, 32'h017FFFFE, 32'h00000007, 1'b0, 32'h01800001); // 6. small + sub = slightly bigger small
    
    testA_B(clk, A, B, subtract, S, 32'h417FFFFE, 32'h00000007, 1'b0, 32'h417FFFFE); // 7. big + sub = big
    
    testA_B(clk, A, B, subtract, S, 32'h417FFFFE, 32'h04000007, 1'b0, 32'h417FFFFE); // 8. big + small = big
    
    testA_B(clk, A, B, subtract, S, 32'h402A0000, 32'h00000000, 1'b0, 32'h402A0000); // 9. x + 0 = x
    
    testA_B(clk, A, B, subtract, S, 32'h4307778D, 32'hC41F53E7, 1'b0, 32'hC3FAEC08); // 10. 135.467 + -637.311 = -501.844

    testA_B(clk, A, B, subtract, S, 32'h420DDE35, 32'hC41F53E7, 1'b0, 32'hC4167604); // 11. 35.467 + -637.311 = -601.844
    
    testA_B(clk, A, B, subtract, S, 32'h41D3346E, 32'h423D832D, 1'b0, 32'h42938EB2); // 12. 26.4006 + 47.3781 = 73.7787
    
    testA_B(clk, A, B, subtract, S, 32'h000668DC, 32'h000D832D, 1'b0, 32'h0013EC09); // 13. 5.8863E-40 + 1.240918E-39 = 1.240918E-39
    
    testA_B(clk, A, B, subtract, S, 32'h427DDE35, 32'hC2FC9F3B, 1'b0, 32'hC27B6041); // 14. 63.467 + -126.311 = -62.843998
    
    testA_B(clk, A, B, subtract, S, 32'h427DDE35, 32'hC28C9F3B, 1'b0, 32'hC0DB0208); // 15. 63.467 + -70.311 = -6.843998
    
    testA_B(clk, A, B, subtract, S, 32'hC27DDE35, 32'h42FC9F3B, 1'b0, 32'h427B6041); // 16. -63.467 + 126.311 = 62.843998
    
    testA_B(clk, A, B, subtract, S, 32'hC366FF8A, 32'hC47FF9AD, 1'b0, 32'hC49CDCC8); // 17. -230.9982 + -1023.9012 = -1254.8994
    
    testA_B(clk, A, B, subtract, S, 32'hC366FF8A, 32'hC47FF9AD, 1'b1, 32'h444639CB); // 18. -230.9982 - -1023.9012 = 792.90295
    
    testA_B(clk, A, B, subtract, S, 32'hC47FF9AD, 32'hC366FF8A, 1'b1, 32'hC44639CB); // 19. -1023.9012 - -230.9982 = -792.9023
    
    testA_B(clk, A, B, subtract, S, 32'hC47FF9AD, 32'h7C7FF9AD, 1'b1, 32'hFC7FF9AD); // 20. -1023.9012 - 5.316399E36 = -5.316399E36
    
    testA_B(clk, A, B, subtract, S, 32'hFF36FF8A, 32'h7D7BB9AC, 1'b1, 32'hFF46BB25); // 21. -2.4324633E38 - 2.0912518E37 = -2.6415885E38
    
    testA_B(clk, A, B, subtract, S, 32'hFF76FF8A, 32'h7E7BB9AC, 1'b1, 32'hFF800000); // 22. -3.2831692E38 - 8.3650073E37 = -Inf
    
    testA_B(clk, A, B, subtract, S, 32'h8036FF8F, 32'h017FB9AC, 1'b1, 32'h818D9CBA); // 23. -5.050794E-39 - 4.6969316E-38 = -5.202011E-38
    
    testA_B(clk, A, B, subtract, S, 32'h0036FF8F, 32'h807FB9AC, 1'b1, 32'h00B6B93B); // 24. 5.050794E-39 - -1.1729715E-38 = 1.6780508E-38
    
    testA_B(clk, A, B, subtract, S, 32'h0036FF8F, 32'h007FB9AC, 1'b1, 32'h8048BA1D); // 25. 5.050794E-39 - 1.1729715E-38 = -6.67892E-39
    
    testA_B(clk, A, B, subtract, S, 32'h40600000, 32'h40e00000, 1'b0, 32'h41280000); // 26. 3.5 + 7 = 10.5
    
    testA_B(clk, A, B, subtract, S, 32'h40600000, 32'h40e00000, 1'b1, 32'hc0600000); // 27. 3.5 - 7 = -3.5
    
    testA_B(clk, A, B, subtract, S, 32'h40600000, 32'h40600000, 1'b1, 32'h00000000); // 28. 3.5 - 3.5 = 0
    
    $stop();
  end

  always
    #5 clk = ~clk;
    
  integer count = 0;
  task automatic testA_B(ref clk, ref [31:0] A, ref [31:0] B, ref subtract, ref [31:0] S, input [31:0] A_in, input [31:0] B_in, input sub_in, input [31:0] S_expected);
    begin
      @(posedge clk);
      A = A_in;
      B = B_in;
      subtract = sub_in;
      count++;
    
      repeat (2) @(posedge clk);
      if (S != S_expected)
        $display("test %d: expected %h, but got %h", count, S_expected, S);
    
      repeat (3) @(posedge clk);
    end
  endtask
endmodule