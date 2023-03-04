// This file is auto generated using sw/generate_control.py. DO NOT EDIT!
package control_defs_pkg;

////////////////////////////
//// Instruction Decode ////
////////////////////////////

typedef enum logic [6:0] {
    HALT,
    NOP,
    ADDI,
    SUBI,
    XORI,
    ANDNI,
    ROLI,
    SLLI,
    RORI,
    SRLI,
    ST,
    LD,
    STU,
    BTR,
    ADD,
    SUB,
    XOR,
    ANDN,
    ROL,
    SLL,
    ROR,
    SRL,
    SEQ,
    SLT,
    SLE,
    SCO,
    BEQZ,
    BNEZ,
    BLTZ,
    BGEZ,
    LBI,
    SLBI,
    J,
    JR,
    JAL,
    JALR,
    siic,
    rti,
    LDCR,
    FADD,
    FSUB,
    FMUL,
    FDIV,
    FEQ,
    FLE,
    FLT,
    FCVTI,
    ICVTF,
    FMOVI,
    IMOVF,
    FST,
    FLD,
    FCLASS
} op_word_t;

endpackage