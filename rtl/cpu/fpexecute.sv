module fpexecute 
import wi23_defs::*;
(
    clk, rst_n,
    reg1, reg2, imm, pc_inc, alu_out, fp_inst_valid,
    AluOp, InstFmt, AluSrc,
    ex_err, busy
); 

    input logic clk, rst_n;
    input [REGFILE_WIDTH-1:0] reg1, reg2, imm, pc_inc;
    input  fp_inst_valid;
    output [REGFILE_WIDTH-1:0] alu_out;
    output logic ex_err, busy;

    ///////////////////////
    /// Control Signals ///
    ///////////////////////

    input [3:0] AluOp;
    input [1:0] InstFmt;
    input AluSrc;

    ////////////////////////
    /// Main ALU Section ///
    ////////////////////////

    logic [1:0] busy_cntr;

    wire [REGFILE_WIDTH-1:0] aluA, aluB;
    wire alu_err;

    assign aluA = reg1;
    assign aluB = AluSrc ? imm : reg2;
    //fp_alu iFPALU(.A(aluA),.B(aluB),.Op(AluOp),.Out(alu_out),.alu_err(alu_err));

    // Error handling
    assign ex_err = alu_err;

    // Busy logic
    always_ff @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            busy <= 1'b0;
        else
            busy <= |busy_cntr;
    end

    always_ff @(posedge clk, negedge rst_n) begin
        if (~rst_n)
            busy_cntr <= 2'h0;
        else if (fp_inst_valid & ~|busy)
            busy_cntr <= 2'h0;
        else
            busy_cntr <= busy_cntr == 2'h2 ? 2'h2 : busy_cntr + 1;
    end

endmodule