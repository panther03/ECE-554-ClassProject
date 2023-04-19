module wi23_tb;

import wi23_defs::*;
import control_defs_pkg::*;
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
    // Enter Reset
    rst_n = 1'b0;
    repeat (2) @ (negedge clk);
    // Out of reset
    rst_n = 1'b1;
    repeat (20000) @ (negedge clk);
    $display("\nYahoo!!! All Tests Passed\n");
    $finish();
end

// 50MHz clock
always
    #10 clk = ~clk;

///////////////////////////////////////////
///////// Start Simulation Trace //////////
///////////////////////////////////////////

// Simulation trace
int sim_log_file;

// Initialize simulation trace
initial begin
    sim_log_file = $fopen("wi23_tb_trace.log");
end

string write_reg, int_reg, fp_reg;
string writesel_string;

logic [PC_WIDTH-1:0] inst;
logic [PC_WIDTH-1:0] pc;
op_word_t Op, OpInt, OpFP;
logic [REGFILE_DEPTH-1:0] writesel, int_writesel, fp_writesel;
logic [REGFILE_WIDTH-1:0] write_in, int_write_in, fp_write_in;
logic [REGFILE_WIDTH-1:0] mem_write_data, mem_read_data, mem_data_addr;
logic [REGFILE_WIDTH-1:0] write_data, read_data, read_addr, write_addr;
logic regwrite, int_regwrite, fp_regwrite;
logic mem_inst, fp_inst;

assign int_reg = "R";
assign fp_reg = "F";

//////////////////////
// Instruction Data //
//////////////////////

// Instruction Opcode
assign inst = WI23.PROC.MEM_WB_inst_out;

// Instruction PC
assign pc = WI23.PROC.MEM_WB_pc_inc_out - 4;

// Integer Instruction Opcode
assign OpInt = WI23.PROC.MEM_WB_ctrl_Op_out;

// FP Instruction Opcode
assign OpFP = WI23.PROC.FEX_WB_ctrl_Op_out;

// Integer Instruction Register Write Index
assign int_writesel = WI23.PROC.MEM_WB_writesel_out;

// FP Instruction Register Write Index
assign fp_writesel = WI23.PROC.FEX_WB_writesel_out;

// Integer Instruction Write Valid
assign int_regwrite = WI23.PROC.WB_IntRegWrite;

// FP Instruction Write Valid
assign fp_regwrite = WI23.PROC.WB_FPRegWrite;

// Integer Instruction Write Data
assign int_write_in = WI23.PROC.write_in;

// FP Instruction Write Data
assign fp_write_in = WI23.PROC.fp_write_in;

// FP Instruction Retiring
assign fp_inst = WI23.PROC.FEX_WB_ctrl_FpInst_out;

// Memory Access Instruction Retiring
assign mem_inst = WI23.PROC.MEM_WB_ctrl_MemToReg_out | WI23.PROC.MEM_WB_ctrl_MemWrite_out;

// Instruction Mnemonic
assign Op = OpInt == NOP ? OpFP : OpInt;

// Register File Write Valid
assign regwrite = int_regwrite | fp_regwrite;

// Register File Write Data
assign write_in = regwrite ? (int_regwrite ? int_write_in : fp_write_in) : 32'hX;

// Register Write Index
assign writesel = regwrite ? (int_regwrite ? int_writesel : fp_writesel) : 5'hX;

// MEM is always 1 pipeline stage (and 1 cycle) before WB
always_ff @ (posedge clk) begin
    mem_write_data <= WI23.data_proc_to_mem;
    mem_read_data <= WI23.data_mem_to_proc_map;
    mem_data_addr <= WI23.daddr;
end
    
// Store Instruction Address and Data
assign write_addr = WI23.PROC.MEM_WB_ctrl_MemWrite_out ? mem_data_addr : 32'hX;
assign write_data = WI23.PROC.MEM_WB_ctrl_MemWrite_out ? mem_write_data : 32'hX;

// Load Instruction Address and Data
assign read_addr = WI23.PROC.MEM_WB_ctrl_MemToReg_out ? mem_data_addr : 32'hX;
assign read_data = WI23.PROC.MEM_WB_ctrl_MemToReg_out ? mem_read_data : 32'hX;

// String for Register File and Index
assign write_reg = regwrite ? (int_regwrite ? int_reg : fp_reg) : "x";

// Write Simulation Trace File
always_ff @(negedge clk) begin
    if (rst_n) begin
        if (Op != NOP) begin
            //$fdisplay(sim_log_file, "instruction: %8x", inst);
            $fdisplay(sim_log_file, "insn:     PC: @0x%4x Inst: %s RegWrite: %s%0d RegValue: 0x%8x LoadAddr: 0x%8x LoadValue: 0x%8x StoreAddr: 0x%8x StoreValue: 0x%8x", pc, Op, write_reg, writesel, write_in, read_addr, read_data, write_addr, write_data);
        end
    end
end

////////////////////////////////////////
///////// End Simulation Trace /////////
////////////////////////////////////////

endmodule
