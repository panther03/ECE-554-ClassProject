module fpexecute 
import wi23_defs::*;
(
    clk, rst_n,
    reg1, reg2, imm, pc_inc, alu_out, fp_inst_valid,
    AluOp, InstFmt, AluSrc,
    ex_err, busy, busy_er
); 

    input logic clk, rst_n;
    input [REGFILE_WIDTH-1:0] reg1, reg2, imm, pc_inc;
    input logic fp_inst_valid;
    output [REGFILE_WIDTH-1:0] alu_out;
    output logic ex_err, busy, busy_er;

    ///////////////////////
    /// Control Signals ///
    ///////////////////////

    input [4:0] AluOp;
    input [1:0] InstFmt;
    input AluSrc;

    ////////////////////////
    /// Main ALU Section ///
    ////////////////////////

    wire [REGFILE_WIDTH-1:0] aluA, aluB;
    wire alu_err;

    assign aluA = reg1;
    assign aluB = AluSrc ? imm : reg2;
    fp_alu iFPALU(.clk(clk),.A(aluA),.B(aluB),.Op(AluOp[3:0]),.Out(alu_out),.alu_err(alu_err));

    // Error handling
    assign ex_err = alu_err;

    // Busy logic
    logic fp_inst_valid_r;
    always_ff @ (posedge clk)
        fp_inst_valid_r <= fp_inst_valid;
    
    // Assert busy in the current cycle and the next cycle. FP takes 2 cycles to execute.
    assign busy = fp_inst_valid | fp_inst_valid_r;
    
    // Assert early busy release. FEX is going to be free in the next cycle
    assign busy_er = fp_inst_valid_r;

endmodule
