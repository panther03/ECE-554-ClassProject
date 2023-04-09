module hazard 
import wi23_defs::*;
(
  clk, IF_ID_reg1, IF_ID_reg2, ID_EX_regw, ID_FEX_regw, EX_MEM_regw,
  ID_EX_ctrl_regw, EX_MEM_ctrl_regw, ID_FEX_ctrl_regw, ID_EX_ctrl_FpInst, stall,
  ID_EX_is_load, IF_ID_is_branch, FEX_busy, IF_ID_is_fp_ex, ID_FEX_ctrl_FPIntCvtReg,
  FEX_busy_er
);

input clk;
input [REGFILE_DEPTH-1:0] IF_ID_reg1, IF_ID_reg2, ID_EX_regw, ID_FEX_regw, EX_MEM_regw;
input ID_EX_ctrl_regw, EX_MEM_ctrl_regw, ID_FEX_ctrl_regw;
input ID_EX_ctrl_FpInst;
input IF_ID_is_branch, ID_EX_is_load;
input FEX_busy, IF_ID_is_fp_ex, FEX_busy_er;
input [1:0] ID_FEX_ctrl_FPIntCvtReg;
output stall;

// Check for two stall cases:
// 1. A branch with a hazard: needs a result from an FEX/EX stage, forward to it in ID
// 2. A computation after a load: needs a result in FEX/EX from MEM simultaneously, must wait one cycle
// 3. FEX is busy and a new FP instruction is decoded
// 4. FP writes Int register used in Int execution

logic IF_EX_hazard;
assign IF_EX_hazard = ID_EX_ctrl_regw & ((IF_ID_reg1 == ID_EX_regw)
                                    | (IF_ID_reg2 == ID_EX_regw));
logic IF_MEM_hazard;
assign IF_MEM_hazard = EX_MEM_ctrl_regw & ((IF_ID_reg1 == EX_MEM_regw)
                                      | (IF_ID_reg2 == EX_MEM_regw));
logic ID_FEX_hazard;
assign ID_FEX_hazard = ID_FEX_ctrl_regw & ID_EX_ctrl_FpInst & ((IF_ID_reg1 == ID_FEX_regw)
                                    | (IF_ID_reg2 == ID_FEX_regw));
logic IF_FEX_hazard;
assign IF_FEX_hazard = (ID_EX_ctrl_regw | ID_EX_ctrl_FpInst) & ((IF_ID_reg1 == ID_EX_regw)
                                    | (IF_ID_reg2 == ID_EX_regw));

// We get FEX result in 2 cycles. So Stall IF_ID branch for 2 cycles.
logic ID_FEX_hazard_r;
always_ff @ (posedge clk)
  ID_FEX_hazard_r <= ID_FEX_hazard;

logic [1:0] FEX_ctrl_FPIntCvtReg_r;
always_ff @ (posedge clk)
  FEX_ctrl_FPIntCvtReg_r <= ID_FEX_ctrl_FPIntCvtReg;

assign stall =  (IF_ID_is_branch & (IF_EX_hazard | IF_MEM_hazard | ((ID_FEX_hazard & ID_FEX_ctrl_FPIntCvtReg[1] | ID_FEX_hazard_r & FEX_ctrl_FPIntCvtReg_r[1]))))
             |  (ID_EX_is_load & (IF_EX_hazard | IF_FEX_hazard))
             |  (FEX_busy & IF_ID_is_fp_ex & ~FEX_busy_er)    // FP Instruction decoded and FEX busy
             |  (ID_FEX_hazard & ID_FEX_ctrl_FPIntCvtReg[1]); // FP writes Int register used in Int execution

endmodule
