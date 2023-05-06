module fp_convert_int_tb();
  
  logic [31:0] A, intgr;
  logic clk;
  
  fp_convert_int iCONVINT(.A(A), .intgr(intgr));
  
  initial begin
    clk = 0;
    
    testA(clk, A, intgr, 32'h3f800000, 32'h00000001);
    
    testA(clk, A, intgr, 32'hbf800000, 32'hffffffff);
    
    testA(clk, A, intgr, 32'h40000000, 32'h00000002);
    
    testA(clk, A, intgr, 32'h4b7fefff, 32'h00ffefff);
    
    testA(clk, A, intgr, 32'h468dc200, 32'h000046e1);
    
    testA(clk, A, intgr, 32'h200ff1f4, 32'h00000000);
    
    testA(clk, A, intgr, 32'ha00ff1f4, 32'h00000000);
    
    testA(clk, A, intgr, 32'h40d80000, 32'h00000006); // 6.75 -> 6
    
    testA(clk, A, intgr, 32'h4f000001, 32'h7fffffff); // max overflow
    
    testA(clk, A, intgr, 32'hcf000001, 32'h80000000); // max overflow negative
    
    testA(clk, A, intgr, 32'h7f800000, 32'h7fffffff); // inf
    
    testA(clk, A, intgr, 32'h7f800001, 32'h7fffffff); // nan
    
    $stop();
  end

  always
    #5 clk = ~clk;
    
  task automatic testA(ref clk, ref [31:0] A, ref [31:0] intgr, input [31:0] A_in, input [31:0] expected);
    begin
      A = A_in;
    
      @(posedge clk);
      if (intgr !== expected)
        $display("expected %h, but got %h", expected, intgr);
    
      repeat (4) @(posedge clk);
    end
  endtask
endmodule