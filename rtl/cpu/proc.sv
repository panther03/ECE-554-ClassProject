module proc 
import wi23_defs::*;
(
   // Inputs
   // Clock and reset
   input logic                   clk,
   input logic                   rst_n,
   // Instruction Input
   input logic [PC_WIDTH-1:0]    inst_i,
   // Data Memory Read
   input logic [DATA_WIDTH-1:0]  data_mem_to_proc_i,

   // Outputs
   // Instruction Memory Signals
   output logic [PC_WIDTH-1:0]   iaddr_o, // Output full 32-bit address
   output logic                  ldcr_o,
   // Data Memory Signals
   output logic [DATA_WIDTH-1:0] daddr_o, // Output full 32-bit address
   output logic [3:0]            we_o,
   output logic [3:0]            re_o,
   output logic [DATA_WIDTH-1:0] data_proc_to_mem_o,
   // Error and Halt status
   output logic                  err_o,
   output logic                  halt_o
);

import control_defs_pkg::*;


   // Disclaimer: This codebase used dff.v modules instead of always blocks
   // due to CS552 restricting certain Verilog features
   // I have converted these into always blocks, however I have done so
   // lazily to avoid introducing new logic bugs
   // The reasoning being that this codebase will not be with us for the whole semester (it will likely have to be rewritten.)

   // I have also not converted the rest of the codebase to fit the style guidelines in README.md.

   /////////////////////////
   /// Fetch Block wires ///
   /////////////////////////
   logic [PC_WIDTH-1:0] pc_inc;
   logic stall, flush;
   logic fetch_err;

   /////////////////////////////
   // IF_ID Transition wires ///
   /////////////////////////////

   logic [PC_WIDTH-1:0] IF_ID_pc_inc_in, IF_ID_pc_inc_out;
   logic [PC_WIDTH-1:0] IF_ID_inst_in, IF_ID_inst_out, IF_ID_inst_out_temp;

   /////////////////////////////////
   /// Early Control Block wires ///
   /////////////////////////////////

   logic FpInst_ea, MemRead_ea, MemWrite_ea;
   logic [1:0] FPIntCvtReg_ea;
   logic IF_ID_ctrl_FpInst_ea, IF_ID_ctrl_MemRead_ea, IF_ID_ctrl_MemWrite_ea;
   logic [1:0] IF_ID_ctrl_FPIntCvtReg_ea;

   ///////////////////////////
   /// Control Block wires ///
   ///////////////////////////

   logic [7:0] op_word;
   logic ctrl_err;

   logic [4:0] AluOp;
   logic [1:0] InstFmt, JType, CondOp, MemGran;
   logic RegWrite, MemWrite, MemRead, InstMemRead,
        MemToReg, AluSrc, XtendSel,
        Exc, Rtn, Halt, FPInst, UnsignedOp;
   op_word_t Op;
   logic [1:0] FPIntCvtReg;
   
   //////////////////////////
   /// Decode Block wires ///
   //////////////////////////

   logic [REGFILE_WIDTH-1:0] reg1, reg2, imm, ofs;
   logic bypass_reg1, bypass_reg2;
   logic [REGFILE_WIDTH-1:0] fp_reg1, fp_reg2;
   logic fp_bypass_reg1, fp_bypass_reg2;
   logic fp_int_bypass_reg1, fp_int_bypass_reg2;
   logic decode_err;
   
   //////////////////////////
   ///// Mem Block wires ////
   //////////////////////////

   logic mem_err, mem2_err;

   //////////////////////////////
   /// ID_EX Transition wires ///
   //////////////////////////////

   op_word_t ID_EX_ctrl_Op_in, ID_EX_ctrl_Op_out;
   logic ID_EX_ctrl_RegWrite_in, ID_EX_ctrl_RegWrite_out;
   logic ID_EX_ctrl_MemWrite_in, ID_EX_ctrl_MemWrite_out;
   logic ID_EX_ctrl_MemRead_in, ID_EX_ctrl_MemRead_out;
   logic ID_EX_ctrl_InstMemRead_in, ID_EX_ctrl_InstMemRead_out;
   logic ID_EX_ctrl_MemToReg_in, ID_EX_ctrl_MemToReg_out;
   logic ID_EX_ctrl_AluSrc_in, ID_EX_ctrl_AluSrc_out;
   logic [1:0] ID_EX_ctrl_InstFmt_in, ID_EX_ctrl_InstFmt_out;
   logic [1:0] ID_EX_ctrl_JType_in, ID_EX_ctrl_JType_out;
   logic [4:0] ID_EX_ctrl_AluOp_in, ID_EX_ctrl_AluOp_out;
   logic ID_EX_ctrl_FpInst_in, ID_EX_ctrl_FpInst_out;
   logic [1:0] ID_EX_ctrl_FPIntCvtReg_in, ID_EX_ctrl_FPIntCvtReg_out;
   logic ID_EX_ctrl_UnsignedOp_in, ID_EX_ctrl_UnsignedOp_out;
   logic [1:0] ID_EX_ctrl_MemGran_in, ID_EX_ctrl_MemGran_out;

   logic ID_EX_ctrl_Halt_in, ID_EX_ctrl_Halt_out;

   logic [REGFILE_WIDTH-1:0] ID_EX_reg1_in, ID_EX_reg1_out;
   logic [REGFILE_WIDTH-1:0] ID_EX_reg2_in, ID_EX_reg2_out;
   logic [REGFILE_WIDTH-1:0] ID_EX_imm_in, ID_EX_imm_out;

   logic [PC_WIDTH-1:0] ID_EX_pc_inc_in, ID_EX_pc_inc_out;
   logic [PC_WIDTH-1:0] ID_EX_inst_in, ID_EX_inst_out;

   ///////////////////////////////
   /// ID_FEX Transition wires ///
   ///////////////////////////////

   op_word_t ID_FEX_ctrl_Op_in, ID_FEX_ctrl_Op_out;
   logic ID_FEX_ctrl_RegWrite_in, ID_FEX_ctrl_RegWrite_out;
   logic ID_FEX_ctrl_AluSrc_in, ID_FEX_ctrl_AluSrc_out;
   logic [1:0] ID_FEX_ctrl_InstFmt_in, ID_FEX_ctrl_InstFmt_out;
   logic [4:0] ID_FEX_ctrl_AluOp_in, ID_FEX_ctrl_AluOp_out;
   logic ID_FEX_ctrl_FpInst_in, ID_FEX_ctrl_FpInst_out;
   logic ID_FEX_ctrl_MemRead_in, ID_FEX_ctrl_MemRead_out;
   logic [1:0] ID_FEX_ctrl_FPIntCvtReg_in, ID_FEX_ctrl_FPIntCvtReg_out;

   logic ID_FEX_ctrl_Halt_in, ID_FEX_ctrl_Halt_out;

   logic [REGFILE_WIDTH-1:0] ID_FEX_reg1_in, ID_FEX_reg1_out;
   logic [REGFILE_WIDTH-1:0] ID_FEX_reg2_in, ID_FEX_reg2_out;
   logic [REGFILE_WIDTH-1:0] ID_FEX_imm_in, ID_FEX_imm_out;

   logic [PC_WIDTH-1:0] ID_FEX_inst_in, ID_FEX_inst_out;
   logic [PC_WIDTH-1:0] ID_FEX_pc_inc_in, ID_FEX_pc_inc_out;

   ///////////////////////////
   /// Execute Block wires ///
   ///////////////////////////

   logic [REGFILE_WIDTH-1:0] alu_out;
   logic [REGFILE_WIDTH-1:0] reg1_frwrd, reg2_frwrd;
   logic [REGFILE_WIDTH-1:0] fp_alu_out;
   logic [REGFILE_WIDTH-1:0] fp_reg1_frwrd, fp_reg2_frwrd;
   logic [REGFILE_DEPTH-1:0] writesel;
   logic [REGFILE_DEPTH-1:0] fp_writesel;
   logic ex_err, fp_ex_err;
   logic FEX_busy, FEX_busy_er;
   logic fp_ex_inst_valid;

   ///////////////////////////////
   /// EX_MEM Transition wires ///
   ///////////////////////////////

   op_word_t EX_MEM_ctrl_Op_in, EX_MEM_ctrl_Op_out;
   logic EX_MEM_ctrl_RegWrite_in, EX_MEM_ctrl_RegWrite_out;
   logic EX_MEM_ctrl_MemRead_in,  EX_MEM_ctrl_MemRead_out;
   logic EX_MEM_ctrl_InstMemRead_in,  EX_MEM_ctrl_InstMemRead_out;
   logic EX_MEM_ctrl_MemWrite_in, EX_MEM_ctrl_MemWrite_out;
   logic EX_MEM_ctrl_MemToReg_in, EX_MEM_ctrl_MemToReg_out;
   logic EX_MEM_ctrl_FpInst_in, EX_MEM_ctrl_FpInst_out;
   logic [1:0] EX_MEM_ctrl_FPIntCvtReg_in, EX_MEM_ctrl_FPIntCvtReg_out;
   logic [1:0] EX_MEM_ctrl_MemGran_in, EX_MEM_ctrl_MemGran_out;

   logic EX_MEM_ctrl_Halt_in, EX_MEM_ctrl_Halt_out;

   logic [REGFILE_WIDTH-1:0] EX_MEM_alu_out_in,  EX_MEM_alu_out_out;
   logic [REGFILE_WIDTH-1:0] EX_MEM_reg2_in, EX_MEM_reg2_out;
   logic [REGFILE_DEPTH-1:0] EX_MEM_writesel_in, EX_MEM_writesel_out;

   ///////////////////////////////
   /// MEM_WB Transition wires ///
   ///////////////////////////////

   op_word_t MEM_WB_ctrl_Op_in, MEM_WB_ctrl_Op_out;
   logic MEM_WB_ctrl_RegWrite_in, MEM_WB_ctrl_RegWrite_out;
   logic MEM_WB_ctrl_MemToReg_in, MEM_WB_ctrl_MemToReg_out;
   logic MEM_WB_ctrl_FpInst_in, MEM_WB_ctrl_FpInst_out;
   logic [1:0] MEM_WB_ctrl_FPIntCvtReg_in, MEM_WB_ctrl_FPIntCvtReg_out;
   logic [1:0] MEM_WB_ctrl_MemGran_in, MEM_WB_ctrl_MemGran_out;

   logic MEM_WB_ctrl_Halt_in, MEM_WB_ctrl_Halt_out;

   logic [REGFILE_DEPTH-1:0] MEM_WB_writesel_in, MEM_WB_writesel_out;
   logic [REGFILE_WIDTH-1:0] MEM_WB_alu_out_in, MEM_WB_alu_out_out;
   logic [REGFILE_WIDTH-1:0] MEM_WB_mem_out_in, MEM_WB_mem_out_out;

   ///////////////////////////////
   /// FEX_WB Transition wires ///
   ///////////////////////////////

   op_word_t FEX_WB_ctrl_Op_in, FEX_WB_ctrl_Op_r, FEX_WB_ctrl_Op_out;
   logic FEX_WB_ctrl_RegWrite_in, FEX_WB_ctrl_RegWrite_r, FEX_WB_ctrl_RegWrite_out;
   logic FEX_WB_ctrl_FpInst_in, FEX_WB_ctrl_FpInst_r, FEX_WB_ctrl_FpInst_out;
   logic FEX_WB_ctrl_MemRead_in, FEX_WB_ctrl_MemRead_r, FEX_WB_ctrl_MemRead_out;
   logic [1:0] FEX_WB_ctrl_FPIntCvtReg_in, FEX_WB_ctrl_FPIntCvtReg_r, FEX_WB_ctrl_FpIntCvtReg_out;

   logic FEX_WB_ctrl_Halt_in, FEX_WB_ctrl_Halt_r, FEX_WB_ctrl_Halt_out;

   logic [REGFILE_DEPTH-1:0] FEX_WB_writesel_in, FEX_WB_writesel_r, FEX_WB_writesel_out;
   logic [REGFILE_WIDTH-1:0] FEX_WB_alu_out_in, FEX_WB_alu_out_r, FEX_WB_alu_out_out;

   /////////////////////////////
   /// Writeback Block wires ///
   /////////////////////////////

   logic [REGFILE_WIDTH-1:0] write_in;
   logic [REGFILE_WIDTH-1:0] fp_write_in;

   /////////////////////////////
   /// Forwarding Unit wires ///
   /////////////////////////////

   logic frwrd_MEM_EX_opA, frwrd_MEM_EX_opB;
   logic frwrd_WB_EX_opA, frwrd_WB_EX_opB;
   logic frwrd_WB_FEX_opA, frwrd_WB_FEX_opB;
   logic frwrd_fp_WB_EX_opA, frwrd_fp_WB_EX_opB;
   logic frwrd_int_WB_EX_opA, frwrd_int_WB_EX_opB; 
   logic frwrd_MEM_FEX_opA, frwrd_MEM_FEX_opB;
   logic frwrd_EX_ID_opA, frwrd_FEX_ID_opA;

   ///////////////////
   /// Fetch Block ///
   ///////////////////

   // Don't use the normal reg_frwrd signal here,
   // we are only interested in the special EX->ID forward case,
   // and standard RF bypass case.
   logic [REGFILE_WIDTH-1:0] reg1_frwrd_fetch;
   assign reg1_frwrd_fetch  = frwrd_EX_ID_opA ? EX_MEM_alu_out_out : frwrd_FEX_ID_opA ? FEX_WB_alu_out_out : reg1;

   // Halt from all integer stages is passed to stop PC increment,
   // but the testbench should only see Halt from MEM_WB.
   logic all_halts;
   assign all_halts  = Halt | ID_EX_ctrl_Halt_out | EX_MEM_ctrl_Halt_out | MEM_WB_ctrl_Halt_out;

   fetch iFETCH(.clk(clk), .rst_n(rst_n), .fetch_err(fetch_err), 
      .stall(stall), .flush(flush), .JType(JType), .CondOp(CondOp),
      .iaddr(iaddr_o), .pc_inc_out(pc_inc), .pc_inc_in(IF_ID_pc_inc_out), .reg1(reg1_frwrd_fetch),
      .Halt(all_halts), .Rtn(Rtn), .Exc(Exc), .ofs(ofs), .imm(imm));
   
   ////////////////////////
   /// IF/ID Transition ///
   ////////////////////////

   // flip bit 26 to default to NOP instead of HALT when we stall
   assign IF_ID_inst_in = inst_i ^ 32'h04000000;
   assign IF_ID_pc_inc_in = pc_inc;   
   
   // If we get a stall or halt, we recirculate values here.
   // If we get a flush, we load in 0 (nop) for the instruction.
   logic [((2*PC_WIDTH)-1):0] IF_ID_reg_in;
   assign IF_ID_reg_in =    (all_halts | stall) ? {IF_ID_pc_inc_out,IF_ID_inst_out_temp}    :   
                            (flush ? {IF_ID_pc_inc_out,32'h0} : {IF_ID_pc_inc_in, IF_ID_inst_in});

   always @(posedge clk, negedge rst_n)
      if (!rst_n) begin
         IF_ID_inst_out_temp <= 0;
         IF_ID_pc_inc_out <= 0;
      end else begin
         IF_ID_inst_out_temp <= IF_ID_reg_in[PC_WIDTH-1:0];
         IF_ID_pc_inc_out <= IF_ID_reg_in[((2*PC_WIDTH)-1):PC_WIDTH];
      end

   // Since we flipped at input, flip at output as well.
   assign IF_ID_inst_out = IF_ID_inst_out_temp ^ 32'h04000000;

   ///////////////////////////
   /// Early Control Block ///
   ///////////////////////////

   control iEACONTROL (.op_word({inst_i[31:26], inst_i[1:0]}), .MemRead(MemRead_ea), .MemWrite(MemWrite_ea), .FPInst(FpInst_ea), .FPIntCvtReg(FPIntCvtReg_ea),
      .ctrl_err(), .RegWrite(),
      .InstFmt(), .MemToReg(), .AluSrc(),
      .AluOp(), .CondOp(), .JType(),
      .XtendSel(), .Rtn(), .Exc(), .Halt(), .Op(), .InstMemRead(), .UnsignedOp(), .MemGran());

   always_ff @ (posedge clk, negedge rst_n) begin
      if (~rst_n) begin
         IF_ID_ctrl_FpInst_ea <= 0;
         IF_ID_ctrl_MemRead_ea <= 0;
         IF_ID_ctrl_MemWrite_ea <= 0;
         IF_ID_ctrl_FPIntCvtReg_ea <= 2'b0;
      end else begin
         IF_ID_ctrl_FpInst_ea <= FpInst_ea;
         IF_ID_ctrl_MemRead_ea <= MemRead_ea;
         IF_ID_ctrl_MemWrite_ea <= MemWrite_ea;
         IF_ID_ctrl_FPIntCvtReg_ea <= FPIntCvtReg_ea;
      end
   end

   /////////////////////
   /// Control Block ///
   /////////////////////

   // From the schematic, this is part of decode stage,
   // but listed as top level for convenience.
   
   assign op_word = {IF_ID_inst_out[31:26],IF_ID_inst_out[1:0]};
   control iCONTROL(.op_word(op_word), .ctrl_err(ctrl_err),
      .RegWrite(RegWrite), .MemWrite(MemWrite), .MemRead(MemRead),
      .InstFmt(InstFmt), .MemToReg(MemToReg), .AluSrc(AluSrc),
      .AluOp(AluOp), .CondOp(CondOp), .JType(JType),
      .XtendSel(XtendSel), .Rtn(Rtn), .Exc(Exc), .Halt(Halt), .FPInst(FPInst), .FPIntCvtReg(FPIntCvtReg), 
      .Op(Op), .InstMemRead(InstMemRead), .UnsignedOp(UnsignedOp), .MemGran(MemGran));

   ////////////////////
   /// Decode Block ///
   ////////////////////
   
   decode iDECODE(.clk(clk), .rst_n(rst_n), .decode_err(decode_err),
      .inst(IF_ID_inst_out), .writesel(MEM_WB_writesel_out), .fp_writesel(FEX_WB_writesel_out),
      .bypass_reg1(bypass_reg1), .bypass_reg2(bypass_reg2),
      .fp_bypass_reg1(fp_bypass_reg1), .fp_bypass_reg2(fp_bypass_reg2),
      .fp_int_bypass_reg1(fp_int_bypass_reg1), .fp_int_bypass_reg2(fp_int_bypass_reg2),
      .write_in(write_in), .reg1(reg1), .reg2(reg2), .imm(imm), .ofs(ofs),
      .fp_write_in(fp_write_in), .fp_reg1(fp_reg1), .fp_reg2(fp_reg2),
      .InstFmt(InstFmt), .JType(JType), .XtendSel(XtendSel), 
      .RegWrite(MEM_WB_ctrl_RegWrite_out), .FPRegWrite(FEX_WB_ctrl_RegWrite_out),
      .FPInst(FPInst), .FPIntCvtReg(FPIntCvtReg), .MemRead(MemRead), .MemWrite(MemWrite), .UnsignedOp(UnsignedOp));

   ////////////////////////
   /// ID/EX Transition ///
   ////////////////////////

   // squash all control signals to 0 if we stall
   assign ID_EX_ctrl_RegWrite_in = stall ? 0 : RegWrite & ~FPInst;
   assign ID_EX_ctrl_MemWrite_in = stall ? 0 : MemWrite;
   assign ID_EX_ctrl_MemRead_in = stall ? 0 : MemRead;
   assign ID_EX_ctrl_MemToReg_in = stall ? 0 : MemToReg;
   assign ID_EX_ctrl_AluSrc_in = stall ? 0 : AluSrc;
   assign ID_EX_ctrl_InstFmt_in = stall ? 0 : InstFmt;
   assign ID_EX_ctrl_JType_in = stall ? 0 : JType;
   assign ID_EX_ctrl_AluOp_in = stall ? 0 : AluOp;
   assign ID_EX_ctrl_Halt_in = stall ? 0 : Halt;
   assign ID_EX_ctrl_InstMemRead_in = stall ? 0 : InstMemRead;
   assign ID_EX_ctrl_Op_in = stall ? NOP : (FPInst & ~(MemRead | MemWrite) ? NOP : Op);  // All Integeter instructions + FP LD/ST
   assign ID_EX_ctrl_FpInst_in = stall ? 0 : FPInst;
   assign ID_EX_ctrl_FPIntCvtReg_in = stall ? 0 : FPIntCvtReg;
   assign ID_EX_ctrl_UnsignedOp_in = stall ? 0 : UnsignedOp;
   assign ID_EX_ctrl_MemGran_in = stall ? 0 : MemGran;

   assign ID_EX_reg1_in = reg1;
   assign ID_EX_reg2_in = reg2;
   assign ID_EX_imm_in = imm;

   // squash inst to nop, control bits don't matter
   // because the following stages only use
   // reg fields & imm etc.
   assign ID_EX_inst_in = stall ? 0 : IF_ID_inst_out;
   assign ID_EX_pc_inc_in = IF_ID_pc_inc_out;

   always @(posedge clk, negedge rst_n) 
      if (!rst_n) begin
         ID_EX_ctrl_Op_out <= NOP;
         ID_EX_ctrl_RegWrite_out <= 0;
         ID_EX_ctrl_MemWrite_out <= 0;
         ID_EX_ctrl_MemRead_out <= 0;
         ID_EX_ctrl_MemToReg_out <= 0;
         ID_EX_ctrl_AluSrc_out <= 0;
         ID_EX_ctrl_InstFmt_out <= 0;
         ID_EX_ctrl_JType_out <= 0;
         ID_EX_ctrl_AluOp_out <= 0;
         ID_EX_reg1_out <= 0;
         ID_EX_reg2_out <= 0;
         ID_EX_imm_out <= 0;
         ID_EX_pc_inc_out <= 0;
         ID_EX_inst_out <= 0;
         ID_EX_ctrl_Halt_out <= 0;
         ID_EX_ctrl_InstMemRead_out <= 0;
			ID_EX_ctrl_FpInst_out <= 0;
         ID_EX_ctrl_UnsignedOp_out <= 0;
         ID_EX_ctrl_MemGran_out <= 0;
      end else begin
         ID_EX_ctrl_Op_out <= ID_EX_ctrl_Op_in;
         ID_EX_ctrl_RegWrite_out <= ID_EX_ctrl_RegWrite_in;
         ID_EX_ctrl_MemWrite_out <= ID_EX_ctrl_MemWrite_in;
         ID_EX_ctrl_MemRead_out <= ID_EX_ctrl_MemRead_in;
         ID_EX_ctrl_MemToReg_out <= ID_EX_ctrl_MemToReg_in;
         ID_EX_ctrl_AluSrc_out <= ID_EX_ctrl_AluSrc_in;
         ID_EX_ctrl_InstFmt_out <= ID_EX_ctrl_InstFmt_in;
         ID_EX_ctrl_JType_out <= ID_EX_ctrl_JType_in;
         ID_EX_ctrl_AluOp_out <= ID_EX_ctrl_AluOp_in;
         ID_EX_reg1_out <= ID_EX_reg1_in;
         ID_EX_reg2_out <= ID_EX_reg2_in;
         ID_EX_imm_out <= ID_EX_imm_in;
         ID_EX_pc_inc_out <= ID_EX_pc_inc_in;
         ID_EX_inst_out <= ID_EX_inst_in;
         ID_EX_ctrl_Halt_out <= ID_EX_ctrl_Halt_in;
         ID_EX_ctrl_InstMemRead_out <= ID_EX_ctrl_InstMemRead_in;
			ID_EX_ctrl_FpInst_out <= ID_EX_ctrl_FpInst_in;
			ID_EX_ctrl_FPIntCvtReg_out <= ID_EX_ctrl_FPIntCvtReg_in;
         ID_EX_ctrl_UnsignedOp_out <= ID_EX_ctrl_UnsignedOp_in;
         ID_EX_ctrl_MemGran_out <= ID_EX_ctrl_MemGran_in;
      end

   /////////////////////////
   /// ID/FEX Transition ///
   /////////////////////////

   // squash all control signals to 0 if we stall
   assign ID_FEX_ctrl_RegWrite_in = stall ? 0 : RegWrite & FPInst;
   assign ID_FEX_ctrl_AluSrc_in = stall ? 0 : AluSrc;
   assign ID_FEX_ctrl_InstFmt_in = stall ? 0 : InstFmt;
   assign ID_FEX_ctrl_AluOp_in = stall ? 0 : AluOp;
   assign ID_FEX_ctrl_Halt_in = stall ? 0 : Halt;
   assign ID_FEX_ctrl_Op_in = stall ? NOP : (FPInst & ~(MemRead | MemWrite) ? Op : NOP);  // All FP Instructions - FP LD/ST
   assign ID_FEX_ctrl_FpInst_in = stall ? 0 : FPInst;
   assign ID_FEX_ctrl_MemRead_in = stall ? 0 : MemRead;
   assign ID_FEX_ctrl_FPIntCvtReg_in = stall ? 0 : FPIntCvtReg;

   assign ID_FEX_reg1_in = fp_reg1;
   assign ID_FEX_reg2_in = fp_reg2;
   assign ID_FEX_imm_in = imm;

   // squash inst to nop, control bits don't matter
   // because the following stages only use
   // reg fields & imm etc.
   assign ID_FEX_inst_in = stall ? 0 : IF_ID_inst_out;
   assign ID_FEX_pc_inc_in = IF_ID_pc_inc_out;

   always @(posedge clk, negedge rst_n) 
      if (!rst_n) begin
         ID_FEX_ctrl_Op_out <= NOP;
         ID_FEX_ctrl_RegWrite_out <= 0;
         ID_FEX_ctrl_AluSrc_out <= 0;
         ID_FEX_ctrl_InstFmt_out <= 0;
         ID_FEX_ctrl_AluOp_out <= 0;
         ID_FEX_reg1_out <= 0;
         ID_FEX_reg2_out <= 0;
         ID_FEX_imm_out <= 0;
         ID_FEX_pc_inc_out <= 0;
         ID_FEX_inst_out <= 0;
         ID_FEX_ctrl_Halt_out <= 0;
         ID_FEX_ctrl_FpInst_out <= 0;
         ID_FEX_ctrl_FPIntCvtReg_out <= 0;
         ID_FEX_ctrl_MemRead_out <= 0;
      end else begin
         ID_FEX_ctrl_Op_out <= ID_FEX_ctrl_Op_in;
         ID_FEX_ctrl_RegWrite_out <= ID_FEX_ctrl_RegWrite_in;
         ID_FEX_ctrl_AluSrc_out <= ID_FEX_ctrl_AluSrc_in;
         ID_FEX_ctrl_InstFmt_out <= ID_FEX_ctrl_InstFmt_in;
         ID_FEX_ctrl_AluOp_out <= ID_FEX_ctrl_AluOp_in;
         ID_FEX_reg1_out <= ID_FEX_reg1_in;
         ID_FEX_reg2_out <= ID_FEX_reg2_in;
         ID_FEX_imm_out <= ID_FEX_imm_in;
         ID_FEX_pc_inc_out <= ID_FEX_pc_inc_in;
         ID_FEX_inst_out <= ID_FEX_inst_in;
         ID_FEX_ctrl_Halt_out <= ID_FEX_ctrl_Halt_in;
         ID_FEX_ctrl_FpInst_out <= ID_FEX_ctrl_FpInst_in;
         ID_FEX_ctrl_MemRead_out <= ID_FEX_ctrl_MemRead_in;
         ID_FEX_ctrl_FPIntCvtReg_out <= ID_FEX_ctrl_FPIntCvtReg_in;
      end

   /////////////////////
   /// Execute Block ///
   /////////////////////
  
   assign reg1_frwrd =  frwrd_MEM_EX_opA     ?  EX_MEM_alu_out_out   :  // EX -> EX
                        frwrd_WB_EX_opA      ?  write_in             :  // MEM -> EX
                        frwrd_fp_WB_EX_opA   ?  fp_write_in          :  // FEX -> EX
                                                ID_EX_reg1_out       ;  // No Forwarding
   assign reg2_frwrd =  frwrd_MEM_EX_opB     ?  EX_MEM_alu_out_out   :  // EX -> EX
                        frwrd_WB_EX_opB      ?  write_in             :  // MEM -> EX
                        frwrd_fp_WB_EX_opB   ?  fp_write_in          :  // FEX -> EX
                                                ID_EX_reg2_out       ;  // No Forwarding
   
   execute iEXECUTE(.ex_err(ex_err), 
      .reg1(reg1_frwrd), .reg2(reg2_frwrd), .imm(ID_EX_imm_out),
      .pc_inc(ID_EX_pc_inc_out), .alu_out(alu_out),
      .AluOp(ID_EX_ctrl_AluOp_out), .JType(ID_EX_ctrl_JType_out),
      .InstFmt(ID_EX_ctrl_InstFmt_out), .AluSrc(ID_EX_ctrl_AluSrc_out), .UnsignedOp(ID_EX_ctrl_UnsignedOp_out));

   // Instfmt
   // 00 - I-Format 2
   // 01 - I-Format 1
   // 10 - R-Format 
   // 11 - J-Format

   always_comb begin
      case (ID_EX_ctrl_InstFmt_out)
         2'b00 : writesel = (ID_EX_ctrl_JType_out == 2'b01) ? 'd30 : ID_EX_inst_out[25:21];   // special case for Jump & Link, write to R30
         2'b01 : writesel = (ID_EX_inst_out[31:26] == 6'b010011) ? ID_EX_inst_out[25:21] : ID_EX_inst_out[20:16]; // exception case for STU (needs to write to Rs)
         2'b10 : writesel = ID_EX_inst_out[15:11];
         2'b11 : writesel = 'd30;
      endcase
   end

   ////////////////////////
   /// FP Execute Block ///
   ////////////////////////
  
   assign fp_reg1_frwrd =  frwrd_MEM_FEX_opA    ?  EX_MEM_alu_out_out   :  // EX -> FEX
                           frwrd_WB_FEX_opA     ?  fp_write_in          :  // FEX -> FEX
                           frwrd_int_WB_EX_opA  ?  write_in             :  // MEM -> FEX
                                                   ID_FEX_reg1_out      ;  // No forwarding
   assign fp_reg2_frwrd =  frwrd_MEM_FEX_opB    ?  EX_MEM_alu_out_out   :  // EX -> FEX
                           frwrd_WB_FEX_opB     ?  fp_write_in          :  // FEX -> FEX
                           frwrd_int_WB_EX_opB  ?  write_in             :  // MEM -> FEX
                                                   ID_FEX_reg2_out      ;  // No forwarding

   // FP EX Unit Valid only for non-LD/ST FP Instructions
   assign fp_ex_inst_valid = ID_FEX_ctrl_FpInst_out & ~(ID_EX_ctrl_MemRead_out | ID_EX_ctrl_MemWrite_out);
   
   fpexecute iFPEXECUTE(.clk(clk), .rst_n(rst_n), .ex_err(fp_ex_err), 
      .reg1(fp_reg1_frwrd), .reg2(fp_reg2_frwrd), .imm(ID_FEX_imm_out),
      .pc_inc(ID_FEX_pc_inc_out), .alu_out(fp_alu_out),
      .AluOp(ID_FEX_ctrl_AluOp_out), .fp_inst_valid(fp_ex_inst_valid),
      .InstFmt(ID_FEX_ctrl_InstFmt_out), .AluSrc(ID_FEX_ctrl_AluSrc_out), .busy(FEX_busy), .busy_er(FEX_busy_er));

   // Instfmt
   // 01 - I-Format 1
   // 10 - R-Format 

   always_comb begin
      case (ID_FEX_ctrl_InstFmt_out)
         2'b01 : fp_writesel = ID_FEX_inst_out[20:16];    // FP LD/ST, Not written through FP pipeline
         default : fp_writesel = ID_FEX_inst_out[15:11];  // 2'b10 : R-Format 
      endcase
   end

   /////////////////////////
   /// EX/MEM Transition ///
   /////////////////////////

   assign EX_MEM_ctrl_RegWrite_in = ID_EX_ctrl_RegWrite_out;
   assign EX_MEM_ctrl_MemWrite_in = ID_EX_ctrl_MemWrite_out;
   assign EX_MEM_ctrl_MemRead_in  = ID_EX_ctrl_MemRead_out;
   assign EX_MEM_ctrl_MemToReg_in = ID_EX_ctrl_MemToReg_out;
   assign EX_MEM_ctrl_InstMemRead_in = ID_EX_ctrl_InstMemRead_out;
	assign EX_MEM_ctrl_FpInst_in = ID_EX_ctrl_FpInst_out;
	assign EX_MEM_ctrl_FPIntCvtReg_in = ID_EX_ctrl_FPIntCvtReg_out;
   assign EX_MEM_ctrl_MemGran_in = ID_EX_ctrl_MemGran_out;

   assign EX_MEM_ctrl_Halt_in = ID_EX_ctrl_Halt_out;
  
   assign EX_MEM_alu_out_in = alu_out;
   assign EX_MEM_reg2_in = reg2_frwrd;
   assign EX_MEM_writesel_in = writesel;

   assign EX_MEM_ctrl_Op_in = ID_EX_ctrl_Op_out;

   always @(posedge clk, negedge rst_n)
      if (!rst_n) begin
         EX_MEM_ctrl_Op_out <= NOP;
         EX_MEM_ctrl_RegWrite_out <= 0;
         EX_MEM_ctrl_MemRead_out  <= 0;
         EX_MEM_ctrl_MemWrite_out <= 0;
         EX_MEM_ctrl_MemToReg_out <= 0;
         EX_MEM_alu_out_out <= 0;
         EX_MEM_reg2_out <= 0;
         EX_MEM_writesel_out <= 0;
         EX_MEM_ctrl_Halt_out <= 0;
         EX_MEM_ctrl_InstMemRead_out <= 0;
			EX_MEM_ctrl_FpInst_out <= 0;
			EX_MEM_ctrl_FPIntCvtReg_out <= 0;
         EX_MEM_ctrl_MemGran_out <= 0;
      end else begin
         EX_MEM_ctrl_Op_out <= EX_MEM_ctrl_Op_in;
         EX_MEM_ctrl_RegWrite_out <= EX_MEM_ctrl_RegWrite_in;
         EX_MEM_ctrl_MemRead_out  <= EX_MEM_ctrl_MemRead_in;
         EX_MEM_ctrl_MemWrite_out <= EX_MEM_ctrl_MemWrite_in;
         EX_MEM_ctrl_MemToReg_out <= EX_MEM_ctrl_MemToReg_in;
         EX_MEM_alu_out_out <= EX_MEM_alu_out_in;
         EX_MEM_reg2_out <= EX_MEM_reg2_in;
         EX_MEM_writesel_out <= EX_MEM_writesel_in;
         EX_MEM_ctrl_Halt_out <= EX_MEM_ctrl_Halt_in;
         EX_MEM_ctrl_InstMemRead_out <= EX_MEM_ctrl_InstMemRead_in;
			EX_MEM_ctrl_FpInst_out <= EX_MEM_ctrl_FpInst_in;
			EX_MEM_ctrl_FPIntCvtReg_out <= EX_MEM_ctrl_FPIntCvtReg_in;
         EX_MEM_ctrl_MemGran_out <= EX_MEM_ctrl_MemGran_in;
      end

   ////////////////////
   /// Memory Block ///
   ////////////////////

   assign daddr_o = EX_MEM_alu_out_out;
   assign data_proc_to_mem_o = EX_MEM_reg2_out;
   always_comb begin
      we_o = 4'h0;
      casez (EX_MEM_ctrl_MemGran_out)
         2'b00 : we_o = {4{EX_MEM_ctrl_MemWrite_out}} & 4'hF; // Word Access
         2'b10 : we_o = {4{EX_MEM_ctrl_MemWrite_out}} & 4'hC; // Half-Word Access
         2'b01 : we_o = {4{EX_MEM_ctrl_MemWrite_out}} & 4'h8; // Byte Access
         default : begin end // Unsupported Access
      endcase
   end
   always_comb begin
      re_o = 4'h0;
      casez (EX_MEM_ctrl_MemGran_out)
         2'b00 : re_o = {4{EX_MEM_ctrl_MemRead_out}} & 4'hF; // Word Access
         2'b10 : re_o = {4{EX_MEM_ctrl_MemRead_out}} & 4'hC; // Half-Word Access
         2'b01 : re_o = {4{EX_MEM_ctrl_MemRead_out}} & 4'h8; // Byte Access
         default : begin end // Unsupported Access
      endcase
   end
   assign ldcr_o = EX_MEM_ctrl_InstMemRead_out;
   assign mem_err = &EX_MEM_ctrl_MemGran_out; // Unsupported Access 

   /////////////////////////
   /// MEM/WB Transition ///
   /////////////////////////

   assign MEM_WB_ctrl_RegWrite_in = EX_MEM_ctrl_RegWrite_out;
   assign MEM_WB_ctrl_MemToReg_in = EX_MEM_ctrl_MemToReg_out;
   assign MEM_WB_ctrl_Halt_in = EX_MEM_ctrl_Halt_out;
   assign MEM_WB_ctrl_MemGran_in = EX_MEM_ctrl_MemGran_out;

   assign MEM_WB_alu_out_in = EX_MEM_alu_out_out;
   always_comb begin
      MEM_WB_mem_out_in = 32'h0;
      casez (EX_MEM_ctrl_MemGran_out)
         2'b00 : MEM_WB_mem_out_in = data_mem_to_proc_i; // Word Access
         2'b01 : MEM_WB_mem_out_in = 32'h000000FF & data_mem_to_proc_i; // Byte Access
         2'b10 : MEM_WB_mem_out_in = 32'h0000FFFF & data_mem_to_proc_i; // Half-Word Access
         default : begin end // Unsupported Access
      endcase
   end
   assign MEM_WB_writesel_in = EX_MEM_writesel_out;

   assign MEM_WB_ctrl_Op_in = EX_MEM_ctrl_Op_out;
	
	assign MEM_WB_ctrl_FpInst_in = EX_MEM_ctrl_FpInst_out;
	assign MEM_WB_ctrl_FPIntCvtReg_in = EX_MEM_ctrl_FPIntCvtReg_out;
  
   always @(posedge clk, negedge rst_n)
      if (!rst_n) begin
         MEM_WB_ctrl_Op_out <= NOP;
         MEM_WB_ctrl_RegWrite_out <= 0;
         MEM_WB_ctrl_MemToReg_out <= 0;
         MEM_WB_ctrl_Halt_out <= 0;
         MEM_WB_writesel_out <= 0;
         MEM_WB_alu_out_out <= 0;
         MEM_WB_mem_out_out <= 0;
			MEM_WB_ctrl_FpInst_out <= 0;
			MEM_WB_ctrl_FPIntCvtReg_out <= 0;
         MEM_WB_ctrl_MemGran_out <= 0;
      end else begin
         MEM_WB_ctrl_Op_out <= MEM_WB_ctrl_Op_in;
         MEM_WB_ctrl_RegWrite_out <= MEM_WB_ctrl_RegWrite_in;
         MEM_WB_ctrl_MemToReg_out <= MEM_WB_ctrl_MemToReg_in;
         MEM_WB_ctrl_Halt_out <= MEM_WB_ctrl_Halt_in;
         MEM_WB_writesel_out <= MEM_WB_writesel_in;
         MEM_WB_alu_out_out <= MEM_WB_alu_out_in;
         MEM_WB_mem_out_out <= MEM_WB_mem_out_in;
			MEM_WB_ctrl_FpInst_out <= MEM_WB_ctrl_FpInst_in;
			MEM_WB_ctrl_FPIntCvtReg_out <= MEM_WB_ctrl_FpInst_out;
         MEM_WB_ctrl_MemGran_out <= MEM_WB_ctrl_MemGran_in;
      end
   
   /////////////////////////
   /// FEX/WB Transition ///
   /////////////////////////

   assign FEX_WB_ctrl_Op_in = ID_FEX_ctrl_Op_out;
   assign FEX_WB_ctrl_RegWrite_in = ID_FEX_ctrl_RegWrite_out;
   assign FEX_WB_ctrl_Halt_in = ID_FEX_ctrl_Halt_out;
   assign FEX_WB_writesel_in = fp_writesel;
   assign FEX_WB_alu_out_in = fp_alu_out;
   assign FEX_WB_ctrl_FpInst_in = ID_FEX_ctrl_FpInst_out;
   assign FEX_WB_ctrl_FPIntCvtReg_in = ID_FEX_ctrl_FPIntCvtReg_out;
   assign FEX_WB_ctrl_MemRead_in = ID_FEX_ctrl_MemRead_out;

   // TODO madrat Change FEX_WB_alu_out_out to be correct ALU output when ALU pipelined
   always_ff @(posedge clk, negedge rst_n)
      if (!rst_n) begin
         // 1st FEX Cycle
         FEX_WB_ctrl_Op_r <= NOP;
         FEX_WB_ctrl_RegWrite_r <= 0;
         FEX_WB_ctrl_Halt_r <= 0;
         FEX_WB_writesel_r <= 0;
         FEX_WB_ctrl_FpInst_r <= 0;
         FEX_WB_ctrl_FPIntCvtReg_r <= 0;
         FEX_WB_ctrl_MemRead_r <= 0;

         // 2nd FEX Cycle
         FEX_WB_ctrl_Op_out <= NOP;
         FEX_WB_ctrl_RegWrite_out <= 0;
         FEX_WB_ctrl_Halt_out <= 0;
         FEX_WB_writesel_out <= 0;
         FEX_WB_alu_out_out <= 0;
         FEX_WB_ctrl_FpInst_out <= 0;
         FEX_WB_ctrl_FpIntCvtReg_out <= 2'b0;
         FEX_WB_ctrl_MemRead_out <= 0;
      end else begin
         // 1st FEX Cycle
         FEX_WB_ctrl_Op_r <= FEX_WB_ctrl_Op_in;
         FEX_WB_ctrl_RegWrite_r <= FEX_WB_ctrl_RegWrite_in;
         FEX_WB_ctrl_Halt_r <= FEX_WB_ctrl_Halt_in;
         FEX_WB_writesel_r <= FEX_WB_writesel_in;
         FEX_WB_ctrl_FpInst_r <= FEX_WB_ctrl_FpInst_in;
         FEX_WB_ctrl_FPIntCvtReg_r <= FEX_WB_ctrl_FPIntCvtReg_in;
         FEX_WB_ctrl_MemRead_r <= FEX_WB_ctrl_MemRead_in;

         // 2nd FEX Cycle
         FEX_WB_ctrl_Op_out <= FEX_WB_ctrl_Op_r;
         FEX_WB_ctrl_RegWrite_out <= FEX_WB_ctrl_RegWrite_r;
         FEX_WB_ctrl_Halt_out <= FEX_WB_ctrl_Halt_r;
         FEX_WB_writesel_out <= FEX_WB_writesel_r;
         FEX_WB_alu_out_out <= FEX_WB_alu_out_in;
         FEX_WB_ctrl_FpInst_out <= FEX_WB_ctrl_FpInst_r;
         FEX_WB_ctrl_FpIntCvtReg_out <= FEX_WB_ctrl_FPIntCvtReg_r;
         FEX_WB_ctrl_MemRead_out <= FEX_WB_ctrl_MemRead_r;
      end

   ///////////////////////
   /// Writeback Block ///
   ///////////////////////
   
   // Integer regfile can be written from :
   //    1. Integer pipeline MEM or ALU
   //    2. FP pipeline for IMOVF, ICVTF and FCLASS
   assign write_in = FEX_WB_ctrl_FpInst_out & FEX_WB_ctrl_FpIntCvtReg_out[1]  ? FEX_WB_alu_out_out :                       // FP pipeline
                     MEM_WB_ctrl_MemToReg_out                                 ? MEM_WB_mem_out_out : MEM_WB_alu_out_out;   // Int pipeline

   // FP register can be written from :
   //    1. Integer pipeline if FP LD
   //    2. FP pipeline for all other FP instructions
   assign fp_write_in = MEM_WB_ctrl_MemToReg_out & MEM_WB_ctrl_FpInst_out ?   MEM_WB_mem_out_out :          // Integer pipeline
                                                                              FEX_WB_alu_out_out;           // FP pipeline

   assign halt_o = MEM_WB_ctrl_Halt_out;

   /////////////////////////////
   /// Hazard Detection Unit ///
   /////////////////////////////

   logic IF_ID_is_fp_ex;
	
   // FP instruction to FEX a) FP Inst b) Non-LD/ST FP Inst
   assign IF_ID_is_fp_ex = IF_ID_ctrl_FpInst_ea & ~(IF_ID_ctrl_MemRead_ea | IF_ID_ctrl_MemWrite_ea);

   hazard iHAZARD (.clk(clk),.IF_ID_reg1(IF_ID_inst_out[25:21]),.IF_ID_reg2(IF_ID_inst_out[20:16]),
      .IF_ID_is_branch(JType[0]),.ID_EX_is_load(ID_EX_ctrl_MemRead_out), .ID_EX_ctrl_FpInst(ID_FEX_ctrl_FpInst_out),
      .ID_EX_ctrl_regw(ID_EX_ctrl_RegWrite_out),.EX_MEM_ctrl_regw(EX_MEM_ctrl_RegWrite_out), .ID_FEX_ctrl_regw(ID_FEX_ctrl_RegWrite_out),
      .ID_EX_regw(writesel),.ID_FEX_regw(fp_writesel),.EX_MEM_regw(EX_MEM_writesel_out), .ID_FEX_ctrl_FPIntCvtReg(ID_FEX_ctrl_FPIntCvtReg_out),
      .FEX_busy(FEX_busy), .IF_ID_is_fp_ex(IF_ID_is_fp_ex), .FEX_busy_er(FEX_busy_er),
      .stall(stall));

   ///////////////////////
   /// Forwarding Unit ///
   ///////////////////////

   // TODO Op[5] to determine FP
   // TODO Op[xx] to determine write to Int from FP or FP from Int
   // TODO FP register indexes
   // TODO Forward from MEM->FEX1, FEX2->FEX1, FEX2->EX, EX->FEX1
   forward iFORWARD (
      // Inputs
      .FEX_WB_regw(FEX_WB_writesel_out),.EX_MEM_regw(EX_MEM_writesel_out),.MEM_WB_regw(MEM_WB_writesel_out),
      .IF_ID_reg1(IF_ID_inst_out[25:21]),.IF_ID_reg2(IF_ID_inst_out[20:16]),
      .ID_EX_reg1(ID_EX_inst_out[25:21]),.ID_EX_reg2(ID_EX_inst_out[20:16]),
      .ID_FEX_reg1(ID_FEX_inst_out[25:21]),.ID_FEX_reg2(ID_FEX_inst_out[20:16]),
      .EX_MEM_ctrl_regw(EX_MEM_ctrl_RegWrite_out),.MEM_WB_ctrl_regw(MEM_WB_ctrl_RegWrite_out), .FEX_WB_ctrl_regw(FEX_WB_ctrl_RegWrite_out),
      .ID_EX_ctrl_FpInst(ID_EX_ctrl_FpInst_out),.ID_FEX_ctrl_FpInst(ID_FEX_ctrl_FpInst_out),.EX_MEM_ctrl_FpInst(EX_MEM_ctrl_FpInst_out),.MEM_WB_ctrl_FpInst(MEM_WB_ctrl_FpInst_out),.FEX_WB_ctrl_FpInst(FEX_WB_ctrl_FpInst_out), 
      .FEX_WB_ctrl_MemRead(FEX_WB_ctrl_MemRead_out), .MEM_WB_ctrl_MemToReg(MEM_WB_ctrl_MemToReg_out),
      .FEX_WB_ctrl_FPIntCvtReg(FEX_WB_ctrl_FpIntCvtReg_out), .ID_FEX_ctrl_FPIntCvtReg(ID_FEX_ctrl_FPIntCvtReg_out),
      .IF_ID_ctrl_FPIntCvtReg(IF_ID_ctrl_FPIntCvtReg_ea),

      // Outputs
      .frwrd_MEM_EX_opA(frwrd_MEM_EX_opA),.frwrd_MEM_EX_opB(frwrd_MEM_EX_opB),
      .frwrd_WB_EX_opA(frwrd_WB_EX_opA),.frwrd_WB_EX_opB(frwrd_WB_EX_opB),
      .frwrd_EX_ID_opA(frwrd_EX_ID_opA),.frwrd_FEX_ID_opA(frwrd_FEX_ID_opA),
      .frwrd_WB_FEX_opA(frwrd_WB_FEX_opA),.frwrd_WB_FEX_opB(frwrd_WB_FEX_opB),
      .frwrd_fp_WB_EX_opA(frwrd_fp_WB_EX_opA),.frwrd_fp_WB_EX_opB(frwrd_fp_WB_EX_opB),
      .frwrd_int_WB_EX_opA(frwrd_int_WB_EX_opA),.frwrd_int_WB_EX_opB(frwrd_int_WB_EX_opB),
      .frwrd_MEM_FEX_opA(frwrd_MEM_FEX_opA),.frwrd_MEM_FEX_opB(frwrd_MEM_FEX_opB),
      .bypass_reg1(bypass_reg1),.bypass_reg2(bypass_reg2),
      .fp_bypass_reg1(fp_bypass_reg1),.fp_bypass_reg2(fp_bypass_reg2),
      .fp_int_bypass_reg1(fp_int_bypass_reg1),.fp_int_bypass_reg2(fp_int_bypass_reg2)
   );

   // error handling
   assign err_o = ex_err | ctrl_err | fetch_err | decode_err | mem_err;

endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:
