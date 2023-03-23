module fp_adder_tb();
	
	logic [31:0] A, B, S;
	logic subtract;
	logic clk;
	
	fp_adder iADDER(.A(A), .B(B), .subtract(subtract), .S(S));
	
	initial begin
		clk = 0;
		subtract = 0;
		
		A = {1'b0, 8'hff, 23'h000000};
		B = {1'b0, 8'hff, 23'h000000};
		
		repeat (5) @(posedge clk);
		
		A = 32'h3fc00000;
		B = 32'h3fc00000;
		
		repeat (5) @(posedge clk);
		
		$stop();
	end

	always
		#5 clk = ~clk;
endmodule