module decode 
import wi23_defs::*;
(
    // Inputs
    input logic         clk, 
    input logic         rst_n,
    input logic [IMEM_WIDTH-1:0]  inst,
    input logic [REGFILE_WIDTH-1:0]  write_in,
    input logic [REGFILE_DEPTH-1:0]  writesel,
    input logic [REGFILE_WIDTH-1:0]  fp_write_in,
    input logic [REGFILE_DEPTH-1:0]  fp_writesel,
    input logic         bypass_reg1, 
    input logic         bypass_reg2,
    input logic         fp_bypass_reg1, 
    input logic         fp_bypass_reg2,
    input logic [1:0]   InstFmt, 
    input logic [1:0]   JType,
    input logic         XtendSel, 
    input logic         RegWrite,
    input logic         FPRegWrite,
    input logic [0:0]   FPInst,
    input logic [1:0]   FPIntCvtReg,
    input logic         MemRead,
    input logic         MemWrite,

    // Outputs
    output logic [REGFILE_WIDTH-1:0] reg1,
    output logic [REGFILE_WIDTH-1:0] reg2,
    output logic [REGFILE_WIDTH-1:0] imm,
    output logic [REGFILE_WIDTH-1:0] ofs,
    output logic [REGFILE_WIDTH-1:0] fp_reg1,
    output logic [REGFILE_WIDTH-1:0] fp_reg2,
    output logic decode_err
);

    ////////////////
    /// RF Logic ///
    ////////////////

    wire [REGFILE_DEPTH-1:0] reg1sel, reg2sel;
    wire [REGFILE_WIDTH-1:0] reg1raw, reg2raw;
    
    wire [REGFILE_DEPTH-1:0] fp_reg1sel, fp_reg2sel;
    wire [REGFILE_WIDTH-1:0] fp_reg1raw, fp_reg2raw;

    logic [REGFILE_WIDTH-1:0] dec_reg1;
    logic [REGFILE_WIDTH-1:0] dec_reg2;
    logic [REGFILE_WIDTH-1:0] dec_fp_reg1;
    logic [REGFILE_WIDTH-1:0] dec_fp_reg2;
    
    /////////////////////////
    /// Int Register file ///
    /////////////////////////

    assign reg1sel = inst[25:21];
    assign reg2sel = inst[20:16];

    rf iRF (.clk(clk),.rst_n(rst_n),.write(RegWrite),.err(int_decode_err),
            .read1regsel(reg1sel),.read2regsel(reg2sel),.writeregsel(writesel),
            .read1data(reg1raw),.read2data(reg2raw),.writedata(write_in));
    
    assign dec_reg1 = bypass_reg1 ? write_in : reg1raw;
    assign dec_reg2 = bypass_reg2 ? write_in : reg2raw;
    
    ////////////////////////
    /// FP Register file ///
    ////////////////////////

    assign fp_reg1sel = inst[25:21];
    assign fp_reg2sel = inst[20:16];
    
    rf iFPRF (.clk(clk),.rst_n(rst_n),.write(FPRegWrite),.err(fp_decode_err),
            .read1regsel(fp_reg1sel),.read2regsel(fp_reg2sel),.writeregsel(fp_writesel),
            .read1data(fp_reg1raw),.read2data(fp_reg2raw),.writedata(fp_write_in));

    assign dec_fp_reg1 = fp_bypass_reg1 ? fp_write_in : fp_reg1raw;
    assign dec_fp_reg2 = fp_bypass_reg2 ? fp_write_in : fp_reg2raw;

    /////////////////////////////
    // Immediate Decode Logic ///
    /////////////////////////////

    wire [REGFILE_WIDTH-1:0] imm_sign_extend,imm_zero_extend;

    // I-format
    assign imm_sign_extend = {{16{inst[15]}},inst[15:0]};
    assign imm_zero_extend = {16'h0,inst[15:0]};

    assign imm = XtendSel ? imm_zero_extend : imm_sign_extend;

    // sign extend for branch offset
    // J-format
    assign ofs = {{6{inst[25]}},inst[25:0]};

    // Decode Error
    assign decode_err = int_decode_err | fp_decode_err;
    

    ///////////////////
    /// Output Reg  ///   
    ///////////////////

    // Integer Regfile
    // Reg1 is always integer register
    assign reg1 = dec_reg1;
    // Reg2 is overloaded with Fd for LD/ST
    assign reg2 = FPInst & (MemRead | MemWrite) ? dec_fp_reg2 : dec_reg2;

    // FP Regfile
    // Reg1 is :
    //      1. FP Fs except
    //      2. FCVTI, FMOVI (FPIntCvtReg[0])
    assign fp_reg1 = FPInst & FPIntCvtReg[0] ? dec_reg1 : dec_fp_reg1;
    // Reg2 is always fp register
    assign fp_reg2 = dec_fp_reg2;

endmodule