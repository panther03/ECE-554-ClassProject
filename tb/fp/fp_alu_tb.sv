module fp_alu_tb();
  
  logic [31:0] A, B, S;
  logic subtract;
  logic clk;
	logic [3:0] Op;
  
  fp_alu iALU(.A(A), .B(B), .Op(4'hf), .clk(clk), .Out(S), .alu_err(alu_err));
  
  initial begin
    clk = 0;
    
    testA_B(clk, A, B, subtract, S, 32'hc1200000, 32'h41200000, 1'b0, 32'h41a00000); // 1. 10 - -10 = 20
		
		testA_B(clk, A, B, subtract, S, 32'hc1200000, 32'hc1200000, 1'b0, 32'h00000000); // 2. -10 - -10 = 0
		
		testA_B(clk, A, B, subtract, S, 32'h41200000, 32'h41200000, 1'b0, 32'h00000000); // 3. 10 - 10 = 0
		
		testA_B(clk, A, B, subtract, S, 32'h41200000, 32'hc1200000, 1'b0, 32'hc1a00000); // 4. -10 - 10 = -20
    
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