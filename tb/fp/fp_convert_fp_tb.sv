module fp_convert_fp_tb();
	
	logic [31:0] A, fp;
	logic clk;
	
	fp_convert_fp iCONVFP(.A(A), .fp(fp));
	
	initial begin
		clk = 0;
		
		testA(clk, A, fp, 32'h00000001, 32'h3f800000);
		
		testA(clk, A, fp, 32'hffffffff, 32'hbf800000);
		
		testA(clk, A, fp, 32'h00ffefff, 32'h4b7fefff);
		
		testA(clk, A, fp, 32'h0fffefff, 32'h4d7fff00);
		
		testA(clk, A, fp, 32'h0fffffff, 32'h4d800000);
		
		testA(clk, A, fp, 32'h7fffffff, 32'h4f000000);
		
		testA(clk, A, fp, 32'h00000000, 32'h00000000);
		
		testA(clk, A, fp, 32'h80000000, 32'hcf000000);
		
		testA(clk, A, fp, 32'h00000005, 32'h40a00000);
		
		$stop();
	end

	always
		#5 clk = ~clk;
		
	task automatic testA(ref clk, ref [31:0] A, ref [31:0] fp, input [31:0] A_in, input [31:0] expected);
		begin
			A = A_in;
		
			@(posedge clk);
			if (fp !== expected)
				$display("expected %h, but got %h", expected, fp);
		
			repeat (4) @(posedge clk);
		end
	endtask
endmodule