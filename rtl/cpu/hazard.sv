module hazard 
import wi23_defs::*;
(
  IF_ID_reg1, IF_ID_reg2, ID_EX_regw, EX_MEM_regw,
  ID_EX_ctrl_regw, EX_MEM_ctrl_regw, stall,
  ID_EX_is_load, IF_ID_is_branch, FEX_busy, ID_FEX_is_fp_ex
);

input [REGFILE_DEPTH-1:0] IF_ID_reg1, IF_ID_reg2, ID_EX_regw, EX_MEM_regw;
input ID_EX_ctrl_regw, EX_MEM_ctrl_regw;
input IF_ID_is_branch, ID_EX_is_load;
input FEX_busy, ID_FEX_is_fp_ex; 
output stall;

// Check for two stall cases:
// 1. A branch with a hazard: needs a result from an EX stage, forward to it in ID
// 2. A computation after a load: needs a result in EX from MEM simultaneously, must wait one cycle
// 3. FEX is busy and a new FP instruction is decoded

// TODO new FP registers stall
wire IF_EX_hazard = ID_EX_ctrl_regw & ((IF_ID_reg1 == ID_EX_regw)
                                    | (IF_ID_reg2 == ID_EX_regw));
wire IF_MEM_hazard = EX_MEM_ctrl_regw & ((IF_ID_reg1 == EX_MEM_regw)
                                      | (IF_ID_reg2 == EX_MEM_regw));

assign stall =  (IF_ID_is_branch & (IF_EX_hazard | IF_MEM_hazard))
             |  (ID_EX_is_load & IF_EX_hazard)
             |  (FEX_busy & ID_FEX_is_fp_ex);

endmodule
