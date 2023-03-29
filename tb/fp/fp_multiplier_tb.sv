module fp_multiplier_tb();
	
	logic [31:0] A, B, P;
	logic clk;
	
	fp_multiplier iMULT(.A(A), .B(B), .P(P));
	
	int i, j;
	initial begin
		clk = 0;
		
		A = {1'b0, 8'hfe, 23'hffffff};
		B = {1'b0, 8'hfe, 23'hffffff};
		
		repeat (5) @(posedge clk);
		
		A = {1'b0, 8'h01, 23'hffffff};
		B = {1'b0, 8'h01, 23'hffffff};
		
		repeat (5) @(posedge clk);
		
		A = 32'h3fc00000;
		B = 32'h3fc00000;
		
		repeat (5) @(posedge clk);
		
		// max times max-subnormal
		A = 32'h7F7FFFFF;
		B = 32'h007FFFFF;
		
		repeat (5) @(posedge clk);
		
		A = 32'h7F000001;
		B = 32'h00000001;
		
		repeat (5) @(posedge clk);
		
		A = 32'h7F000000;
		B = 32'h00000001;
		
		repeat (5) @(posedge clk);
		
		A = 32'h0FFFFFFF;
		B = 32'h2F800001;
		// expect 0x00400000
		
		repeat (5) @(posedge clk);
		
		A = 32'h0FFFFFFF;
		B = 32'h2E000001;
		// expect 0x00080000
		
		repeat (5) @(posedge clk);
		
		$stop();
	end

	always
		#5 clk = ~clk;
endmodule