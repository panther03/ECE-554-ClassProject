module hazard 
import wi23_defs::*;
(
  // Inputs
  input logic clk,
  input logic [REGFILE_DEPTH-1:0] IF_ID_reg1,
  input logic [REGFILE_DEPTH-1:0] IF_ID_reg2,
  input logic IF_ID_is_branch,
  input logic IF_ID_is_fp_store, 
  input logic IF_ID_is_fp_ex, 
  input logic ID_EX_is_load, 
  input logic ID_EX_ctrl_regw,
  input logic ID_FEX_ctrl_regw,
  input logic ID_FEX2_ctrl_regw,
  input logic EX_MEM_ctrl_regw, 
  input logic [REGFILE_DEPTH-1:0] ID_EX_regw,
  input logic [REGFILE_DEPTH-1:0] ID_FEX_regw,
  input logic [REGFILE_DEPTH-1:0] ID_FEX2_regw,
  input logic [REGFILE_DEPTH-1:0] EX_MEM_regw, 
  input logic ID_FEX_ctrl_FpInst,
  input logic [1:0] ID_FEX_ctrl_FPIntCvtReg,
  input logic ID_FEX2_ctrl_FpInst,
  input logic [1:0] ID_FEX2_ctrl_FPIntCvtReg,
  input logic FEX_busy, 
  input logic FEX_busy_er,
      
  // Outputs
  output logic stall
);

// Check for four stall cases:
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
assign ID_FEX_hazard = ID_FEX_ctrl_regw & ID_FEX_ctrl_FpInst & ((IF_ID_reg1 == ID_FEX_regw)
                                    | (IF_ID_reg2 == ID_FEX_regw));

logic ID_FEX2_hazard;
assign ID_FEX2_hazard = ID_FEX2_ctrl_regw & ID_FEX2_ctrl_FpInst & ((IF_ID_reg1 == ID_FEX2_regw)
                                    | (IF_ID_reg2 == ID_FEX2_regw));

logic IF_FEX_hazard;
assign IF_FEX_hazard = (ID_EX_ctrl_regw | ID_FEX_ctrl_FpInst) & ((IF_ID_reg1 == ID_EX_regw)
                                    | (IF_ID_reg2 == ID_EX_regw));

assign stall =  (IF_ID_is_branch & (IF_EX_hazard | IF_MEM_hazard | ((ID_FEX_hazard & ID_FEX_ctrl_FPIntCvtReg[1] | ID_FEX2_hazard & ID_FEX2_ctrl_FPIntCvtReg[1]))))
             |  (ID_EX_is_load & (IF_EX_hazard | IF_FEX_hazard))  // Load to EX and Load to FEX hazard
             |  (FEX_busy & IF_ID_is_fp_ex & ~FEX_busy_er)    // FP Instruction decoded and FEX busy
             |  (ID_FEX_hazard & ID_FEX_ctrl_FPIntCvtReg[1])  // FP writes Int register used in Int execution
             |  (ID_FEX_hazard & IF_ID_is_fp_store);          // FP FEX writes a register which is being used in FP store

endmodule
