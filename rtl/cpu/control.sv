// This file is auto generated using sw/generate_control.py. DO NOT EDIT!
// This module outputs the decode control signals.
module control
import control_defs_pkg::*;
(
    //Inputs
    input logic [7:0]  op_word,

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
    output logic [0:0]  FPInst,
    output logic [1:0]  FPIntCvtReg,
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
        8'b000000_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 1; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = HALT; end // HALT
        8'b000001_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = NOP; end // NOP
        8'b001000_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = ADDI; end // ADDI
        8'b001001_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b1111; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = SUBI; end // SUBI
        8'b001010_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0010; CondOp = 2'b00; JType = 2'b00; XtendSel = 1; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = XORI; end // XORI
        8'b001011_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0011; CondOp = 2'b00; JType = 2'b00; XtendSel = 1; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = ANDNI; end // ANDNI
        8'b010100_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0100; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = ROLI; end // ROLI
        8'b010101_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0101; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = SLLI; end // SLLI
        8'b010110_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0110; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = RORI; end // RORI
        8'b010111_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0111; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = SRLI; end // SRLI
        8'b010000_?? : begin RegWrite = 0; MemWrite = 1; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = ST; end // ST
        8'b010001_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 1; InstFmt = 2'b01; MemToReg = 1; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = LD; end // LD
        8'b010011_?? : begin RegWrite = 1; MemWrite = 1; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = STU; end // STU
        8'b011001_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b1000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = BTR; end // BTR
        8'b011011_00 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = ADD; end // ADD
        8'b011011_01 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b1111; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = SUB; end // SUB
        8'b011011_10 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0010; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = XOR; end // XOR
        8'b011011_11 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0011; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = ANDN; end // ANDN
        8'b011010_00 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0100; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = ROL; end // ROL
        8'b011010_01 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0101; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = SLL; end // SLL
        8'b011010_10 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0110; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = ROR; end // ROR
        8'b011010_11 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0111; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = SRL; end // SRL
        8'b011100_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b1100; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = SEQ; end // SEQ
        8'b011101_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b1101; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = SLT; end // SLT
        8'b011110_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b1110; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = SLE; end // SLE
        8'b011111_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 0; AluOp = 4'b0001; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = SCO; end // SCO
        8'b001100_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b11; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = BEQZ; end // BEQZ
        8'b001101_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b01; JType = 2'b11; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = BNEZ; end // BNEZ
        8'b001110_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b10; JType = 2'b11; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = BLTZ; end // BLTZ
        8'b001111_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b11; JType = 2'b11; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = BGEZ; end // BGEZ
        8'b011000_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 1; AluOp = 4'b1010; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = LBI; end // LBI
        8'b010010_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 1; AluOp = 4'b1011; CondOp = 2'b00; JType = 2'b00; XtendSel = 1; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = SLBI; end // SLBI
        8'b000100_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b11; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b10; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = J; end // J
        8'b000101_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b01; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = JR; end // JR
        8'b000110_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b11; MemToReg = 0; AluSrc = 0; AluOp = 4'b1001; CondOp = 2'b00; JType = 2'b10; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = JAL; end // JAL
        8'b000111_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b1001; CondOp = 2'b00; JType = 2'b01; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = JALR; end // JALR
        8'b000010_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 1; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = siic; end // siic
        8'b000011_?? : begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 1; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = rti; end // rti
        8'b000011_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 1; InstFmt = 2'b01; MemToReg = 1; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = LDCR; end // LDCR
        8'b111011_00 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = FADD; end // FADD
        8'b111011_01 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b1111; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = FSUB; end // FSUB
        8'b111011_10 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b0010; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = FMUL; end // FMUL
        8'b111011_11 : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b0011; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = FDIV; end // FDIV
        8'b111100_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b1100; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = FEQ; end // FEQ
        8'b111110_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b1110; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = FLE; end // FLE
        8'b111111_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b1101; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = FLT; end // FLT
        8'b100001_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b0100; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b01; ctrl_err = 0; ID_EX_Op_in = FCVTI; end // FCVTI
        8'b100000_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b0101; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b10; ctrl_err = 0; ID_EX_Op_in = ICVTF; end // ICVTF
        8'b100011_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b0110; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b01; ctrl_err = 0; ID_EX_Op_in = FMOVI; end // FMOVI
        8'b100010_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b0111; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b10; ctrl_err = 0; ID_EX_Op_in = IMOVF; end // IMOVF
        8'b110000_?? : begin RegWrite = 0; MemWrite = 1; MemRead = 0; InstFmt = 2'b01; MemToReg = 0; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = FST; end // FST
        8'b110001_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 1; InstFmt = 2'b01; MemToReg = 1; AluSrc = 1; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b01; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b00; ctrl_err = 0; ID_EX_Op_in = FLD; end // FLD
        8'b100100_?? : begin RegWrite = 1; MemWrite = 0; MemRead = 0; InstFmt = 2'b10; MemToReg = 0; AluSrc = 1; AluOp = 4'b1000; CondOp = 2'b00; JType = 2'b01; XtendSel = 0; Exc = 0; Rtn = 0; Halt = 0; FPInst = 1; FPIntCvtReg = 2'b10; ctrl_err = 0; ID_EX_Op_in = FCLASS; end // FCLASS
        default: begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 1; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; ctrl_err = 1; ID_EX_Op_in = NOP; end // error case (default)
    endcase
end

endmodule