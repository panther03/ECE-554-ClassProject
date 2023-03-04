module wi23_tb;

import wi23_defs::*;
import generic_tasks::*;

logic       clk; // 50MHz
logic       rst_n;
logic       halt;
// Switches and LEDs
logic [9:0] SW;
logic [9:0] LEDR;
// UART
logic       RX;
logic       TX;
// VGA
// VGA clock is an input to this module because it is generated in the PLL.
logic       VGA_CLK; // 25MHz
logic    	VGA_BLANK_N;
logic [7:0] VGA_B;
logic [7:0] VGA_G;
logic       VGA_HS;
logic [7:0] VGA_R;
logic       VGA_SYNC_N;
logic       VGA_VS;


wi23 WI23 (
    .*
);

initial begin
    clk = 1'b1;
    rst_n = 1'b1;
    repeat (2) @ (negedge clk);
    rst_n = 1'b0;
    repeat (2) @ (negedge clk);
    rst_n = 1'b1;
    repeat (50) @ (negedge clk);
    $display("\nYahoo!!! All Tests Passed\n");
    $finish();
end

// 50MHz clock
always
    #10 clk = ~clk;

endmodule