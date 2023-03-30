module hazard 
import wi23_defs::*;
(
  IF_ID_reg1, IF_ID_reg2, ID_EX_regw, ID_FEX_regw, EX_MEM_regw,
  ID_EX_ctrl_regw, EX_MEM_ctrl_regw, ID_FEX_ctrl_regw, stall,
  ID_EX_is_load, IF_ID_is_branch, FEX_busy, IF_ID_is_fp_ex, ID_FEX_ctrl_FPIntCvtReg,
  FEX_busy_er
);

input [REGFILE_DEPTH-1:0] IF_ID_reg1, IF_ID_reg2, ID_EX_regw, ID_FEX_regw, EX_MEM_regw;
input ID_EX_ctrl_regw, EX_MEM_ctrl_regw, ID_FEX_ctrl_regw;
input IF_ID_is_branch, ID_EX_is_load;
input FEX_busy, IF_ID_is_fp_ex, FEX_busy_er;
input [1:0] ID_FEX_ctrl_FPIntCvtReg;
output stall;

// Check for two stall cases:
// 1. A branch with a hazard: needs a result from an EX stage, forward to it in ID
// 2. A computation after a load: needs a result in EX from MEM simultaneously, must wait one cycle
// 3. FEX is busy and a new FP instruction is decoded

// TODO new FP registers stall
logic IF_EX_hazard;
assign IF_EX_hazard = ID_EX_ctrl_regw & ((IF_ID_reg1 == ID_EX_regw)
                                    | (IF_ID_reg2 == ID_EX_regw));
logic IF_MEM_hazard;
assign IF_MEM_hazard = EX_MEM_ctrl_regw & ((IF_ID_reg1 == EX_MEM_regw)
                                      | (IF_ID_reg2 == EX_MEM_regw));
logic ID_FEX_hazard;
assign ID_FEX_hazard = ID_FEX_ctrl_regw & ((IF_ID_reg1 == ID_FEX_regw)
                                    | (IF_ID_reg2 == ID_FEX_regw));
assign stall =  (IF_ID_is_branch & (IF_EX_hazard | IF_MEM_hazard))
             |  (ID_EX_is_load & IF_EX_hazard)
             |  (FEX_busy & IF_ID_is_fp_ex & ~FEX_busy_er)
             |  (ID_FEX_hazard & ID_FEX_ctrl_FPIntCvtReg[1]); // FP writes Int register used in Int execution

endmodule
