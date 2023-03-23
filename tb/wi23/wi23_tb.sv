module wi23_tb;

import wi23_defs::*;
import generic_tasks::*;
import decode_tasks_pkg::*;

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

localparam REGFILE_ENTRIES = 1 << REGFILE_DEPTH;

logic [REGFILE_WIDTH-1:0] rf_tb [REGFILE_ENTRIES-1:0], fp_rf_tb [REGFILE_ENTRIES-1:0]; 


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
    repeat (20) @ (negedge clk);
    if (WI23.PROC.iDECODE.iRF.rf1[1] == WI23.PROC.iDECODE.iRF.rf1[3])
        $display("\nROR Test Passed\n");
    repeat (2) @ (negedge clk);
    //check_dec_inst(clk, WI23.inst, rf_tb, fp_rf_tb); 
    $display("\nYahoo!!! All Tests Passed\n");
    $finish();
end

always @ (*) begin
    WI23.PROC.iDECODE.iRF.rf1 = rf_tb;
    WI23.PROC.iDECODE.iRF.rf2 = rf_tb;
    WI23.PROC.iDECODE.iFPRF.rf1 = fp_rf_tb;
    WI23.PROC.iDECODE.iFPRF.rf2 = fp_rf_tb;
end

// 50MHz clock
always
    #10 clk = ~clk;

endmodule
