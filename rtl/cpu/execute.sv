module execute 
import wi23_defs::*;
(
    // Inputs
    input logic [REGFILE_WIDTH-1:0] reg1, 
    input logic [REGFILE_WIDTH-1:0] reg2, 
    input logic [REGFILE_WIDTH-1:0] imm, 
    input logic [REGFILE_WIDTH-1:0] pc_inc,
    input logic [4:0]               AluOp,
    input logic [1:0]               JType, 
    input logic [1:0]               InstFmt,
    input logic                     AluSrc,
    input logic                     UnsignedOp,

    // Outputs
    output [REGFILE_WIDTH-1:0]      alu_out,
    output logic                    ex_err
); 

    ///////////////////////
    // Main ALU Section ///
    ///////////////////////

    wire [REGFILE_WIDTH-1:0] aluA, aluB;
    wire alu_err;

    assign aluA = ^JType ? pc_inc : reg1;
    assign aluB = AluSrc ? imm : reg2;
    alu iALU(.A(aluA),.B(aluB),.Op(AluOp),.UnsignedOp(UnsignedOp),.Out(alu_out),.alu_err(alu_err));

    // Error handling
    assign ex_err = alu_err;

endmodule