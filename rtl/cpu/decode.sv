module decode 
import wi23_defs::*;
(
    // Inputs
    input logic         clk, 
    input logic         rst_n,
    input logic [IMEM_WIDTH-1:0]  inst,
    input logic [REGFILE_WIDTH-1:0]  write_in,
    input logic [2:0]   writesel,
    input logic         bypass_reg1, 
    input logic         bypass_reg2,
    input logic [1:0]   InstFmt, 
    input logic [1:0]   JType,
    input logic         XtendSel, 
    input logic         RegWrite,
    input logic [0:0]   FPInst,
    input logic [1:0]   FPIntCvtReg,

    // Outputs
    output logic [REGFILE_WIDTH-1:0] reg1,
    output logic [REGFILE_WIDTH-1:0] reg2,
    output logic [REGFILE_WIDTH-1:0] imm,
    output logic [REGFILE_WIDTH-1:0] ofs,
    output logic decode_err
);

    ///////////////
    // rf logic //
    /////////////

    wire [2:0] reg1sel, reg2sel;
    wire [REGFILE_WIDTH-1:0] reg1raw, reg2raw;

    assign reg1sel = inst[10:8];
    assign reg2sel = inst[7:5];

    rf iRF (.clk(clk),.rst_n(rst_n),.write(RegWrite),.err(decode_err),
            .read1regsel(reg1sel),.read2regsel(reg2sel),.writeregsel(writesel),
            .read1data(reg1raw),.read2data(reg2raw),.writedata(write_in));

    assign reg1 = bypass_reg1 ? write_in : reg1raw;
    assign reg2 = bypass_reg2 ? write_in : reg2raw;

    /////////////////////////////
    // immediate decode logic //
    ///////////////////////////

    wire [REGFILE_WIDTH-1:0] imm_sign_extend,imm_zero_extend;

    assign imm_sign_extend = InstFmt[0] ? {{27{inst[4]}},inst[4:0]} : {{24{inst[7]}},inst[7:0]};
    assign imm_zero_extend = InstFmt[0] ? {27'h0,inst[4:0]} : {24'h0,inst[7:0]};

    assign imm = XtendSel ? imm_zero_extend : imm_sign_extend;

    // sign extend for branch offset
    assign ofs = {{21{inst[10]}},inst[10:0]};
    
endmodule