// This file is auto generated using sw/generate_control.py. DO NOT EDIT!
// This module outputs the decode control signals.
module control
import control_defs_pkg::*;
(
    //Inputs
    input logic [6:0]  op_word,

    //Outputs
    output logic [0:0]  RegWrite,
    output logic [0:0]  MemWrite,
    output logic [0:0]  MemRead,
    output logic [1:0]  InstFmt,
    output logic [0:0]  MemToReg,
    output logic [0:0]  AluSrc,
    output logic [3:0]  AluOp,
    output logic [1:0]  CondOp,
    output logic [1:0]  JType,
    output logic [0:0]  XtendSel,
    output logic [0:0]  Exc,
    output logic [0:0]  Rtn,
    output logic [0:0]  Halt,
    output logic [0:0]  ctrl_err,
    output op_word_t ID_EX_Op_in
);

/*
    7 bit opcode word comprised of the 5-bit opcode,
    and the 2 LSBs of the instruction to indicate ALU
    operation in the R-type case (in that order.)
*/
always_comb begin
    case (op_word) inside
        7'b00000_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 1; ctrl_err = 0; ID_EX_Op_in = HALT; end // HALT
        7'b00001_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = NOP; end // NOP
        7'b01000_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = ADDI; end // ADDI
        7'b01001_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b1111; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = SUBI; end // SUBI
        7'b01010_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0010; CondOp = 2'b00; JType = 2'b00; XtendSel = 1; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = XORI; end // XORI
        7'b01011_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0011; CondOp = 2'b00; JType = 2'b00; XtendSel = 1; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = ANDNI; end // ANDNI
        7'b10100_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0100; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = ROLI; end // ROLI
        7'b10101_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0101; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = SLLI; end // SLLI
        7'b10110_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0110; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = RORI; end // RORI
        7'b10111_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0111; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = SRLI; end // SRLI
        7'b10000_?? : begin RegWrite = 0; MemWrite = 1; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = ST; end // ST
        7'b10001_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 1; InstFmt = 2'b01; MemToReg = 1; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = LD; end // LD
        7'b10011_?? : begin RegWrite = 1; MemWrite = 1; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = STU; end // STU
        7'b11001_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b1000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = BTR; end // BTR
        7'b11011_00 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = ADD; end // ADD
        7'b11011_01 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b1111; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = SUB; end // SUB
        7'b11011_10 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0010; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = XOR; end // XOR
        7'b11011_11 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0011; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = ANDN; end // ANDN
        7'b11010_00 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0100; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = ROL; end // ROL
        7'b11010_01 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0101; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = SLL; end // SLL
        7'b11010_10 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0110; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = ROR; end // ROR
        7'b11010_11 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0111; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = SRL; end // SRL
        7'b11100_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b1100; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = SEQ; end // SEQ
        7'b11101_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b1101; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = SLT; end // SLT
        7'b11110_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b1110; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = SLE; end // SLE
        7'b11111_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0001; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = SCO; end // SCO
        7'b01100_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b11; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = BEQZ; end // BEQZ
        7'b01101_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b01; JType = 2'b11; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = BNEZ; end // BNEZ
        7'b01110_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b10; JType = 2'b11; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = BLTZ; end // BLTZ
        7'b01111_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b11; JType = 2'b11; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = BGEZ; end // BGEZ
        7'b11000_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 1; AluOp = 4'b1010; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = LBI; end // LBI
        7'b10010_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 1; AluOp = 4'b1011; CondOp = 2'b00; JType = 2'b00; XtendSel = 1; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = SLBI; end // SLBI
        7'b00100_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b11; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b10; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = J; end // J
        7'b00101_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b01; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = JR; end // JR
        7'b00110_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b11; MemToReg = 0; AluSrc = 0; AluOp = 4'b1001; CondOp = 2'b00; JType = 2'b10; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = JAL; end // JAL
        7'b00111_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b1001; CondOp = 2'b00; JType = 2'b01; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = JALR; end // JALR
        7'b00010_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 1; Rtn = 0; Halt = 0; ctrl_err = 0; ID_EX_Op_in = siic; end // siic
        7'b00011_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 1; Halt = 0; ctrl_err = 0; ID_EX_Op_in = rti; end // rti
        default: begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 1; Halt = 0; ctrl_err = 1; ID_EX_Op_in = NOP; end // error case (default)
    endcase
end

endmodule