module fp_adder_tb();
	
	logic [31:0] A, B, S;
	logic subtract;
	logic clk;
	
	fp_adder iADDER(.A(A), .B(B), .subtract(subtract), .S(S));
	
	initial begin
		clk = 0;
		
		testA_B(clk, A, B, subtract, S, 32'h7f800000, 32'h7f800000, 1'b0, 32'h7f800000); // inf + inf = inf
		
		testA_B(clk, A, B, subtract, S, 32'h7f800000, 32'hff800000, 1'b0, 32'hff800001); // inf + -inf = nan
		
		testA_B(clk, A, B, subtract, S, 32'h3fc00000, 32'h3fc00000, 1'b0, 32'h40400000); // 1.5 + 1.5 = 3
		
		testA_B(clk, A, B, subtract, S, 32'h7f7fffff, 32'h7f000007, 1'b0, 32'h7f800000); // big + big = inf
		
		testA_B(clk, A, B, subtract, S, 32'h3F7FFFFF, 32'h37000007, 1'b0, 32'h3F800040); // 0.99999994 + 7.629401E-6 = 1.0000076
		
		testA_B(clk, A, B, subtract, S, 32'h017FFFFE, 32'h00000007, 1'b0, 32'h01800001); // small + sub = slightly bigger small
		
		testA_B(clk, A, B, subtract, S, 32'h417FFFFE, 32'h00000007, 1'b0, 32'h417FFFFE); // big + sub = big
		
		testA_B(clk, A, B, subtract, S, 32'h417FFFFE, 32'h04000007, 1'b0, 32'h417FFFFE); // big + small = big
		
		testA_B(clk, A, B, subtract, S, 32'h402A0000, 32'h00000000, 1'b0, 32'h402A0000); // x + 0 = x
		
		testA_B(clk, A, B, subtract, S, 32'h3fc00000, 32'h3fc00000, 1'b0, 32'h40400000); // 1.5 + 1.5 = 3
		
		testA_B(clk, A, B, subtract, S, 32'h3fc00000, 32'h3fc00000, 1'b0, 32'h40400000); // 1.5 + 1.5 = 3
		
		testA_B(clk, A, B, subtract, S, 32'h3fc00000, 32'h3fc00000, 1'b0, 32'h40400000); // 1.5 + 1.5 = 3
		
		$stop();
	end

	always
		#5 clk = ~clk;
		
	task automatic testA_B(ref clk, ref [31:0] A, ref [31:0] B, ref subtract, ref [31:0] S, input [31:0] A_in, input [31:0] B_in, input sub_in, input [31:0] S_expected);
		begin
			A = A_in;
			B = B_in;
			subtract = sub_in;
		
			@(posedge clk);
			if (S != S_expected)
				$display("expected %h, but got %h", S_expected, S);
		
			repeat (4) @(posedge clk);
		end
	endtask
endmodule