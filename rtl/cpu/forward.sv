module forward 
import wi23_defs::*;
(    
     // Inputs
     input logic [REGFILE_DEPTH-1:0] EX_MEM_regw, 
     input logic [REGFILE_DEPTH-1:0] MEM_WB_regw, 
     input logic [REGFILE_DEPTH-1:0] FEX_WB_regw, 
     input logic [REGFILE_DEPTH-1:0] IF_ID_reg1, 
     input logic [REGFILE_DEPTH-1:0] IF_ID_reg2, 
     input logic [REGFILE_DEPTH-1:0] ID_EX_reg1, 
     input logic [REGFILE_DEPTH-1:0] ID_EX_reg2, 
     input logic [REGFILE_DEPTH-1:0] ID_FEX_reg1, 
     input logic [REGFILE_DEPTH-1:0] ID_FEX_reg2,
     input logic EX_MEM_ctrl_regw, 
     input logic MEM_WB_ctrl_regw, 
     input logic FEX_WB_ctrl_regw,
     input logic ID_EX_ctrl_FpInst, 
     input logic ID_FEX_ctrl_FpInst, 
     input logic EX_MEM_ctrl_FpInst, 
     input logic MEM_WB_ctrl_FpInst,
     input logic FEX_WB_ctrl_FpInst,
     input logic FEX_WB_ctrl_MemRead,
     input logic [1:0] FEX_WB_ctrl_FPIntCvtReg,
     input logic [1:0] ID_FEX_ctrl_FPIntCvtReg,
     input logic [1:0] IF_ID_ctrl_FPIntCvtReg,

     // Outputs
     output logic frwrd_MEM_EX_opA, 
     output logic frwrd_MEM_EX_opB, 
     output logic frwrd_WB_EX_opA, 
     output logic frwrd_WB_EX_opB, 
     output logic frwrd_EX_ID_opA, 
     output logic frwrd_WB_FEX_opA, 
     output logic frwrd_WB_FEX_opB, 
     output logic frwrd_fp_WB_EX_opA, 
     output logic frwrd_fp_WB_EX_opB, 
     output logic frwrd_int_WB_EX_opA, 
     output logic frwrd_int_WB_EX_opB, 
     output logic frwrd_MEM_FEX_opA,
     output logic frwrd_MEM_FEX_opB,
     output logic bypass_reg1, 
     output logic bypass_reg2,
     output logic fp_bypass_reg1, 
     output logic fp_bypass_reg2,
     output logic fp_int_bypass_reg1, 
     output logic fp_int_bypass_reg2
);

// EX to EX forwarding
assign frwrd_MEM_EX_opA = (EX_MEM_ctrl_regw & ~ID_EX_ctrl_FpInst) & (EX_MEM_regw == ID_EX_reg1);
assign frwrd_MEM_EX_opB = (EX_MEM_ctrl_regw & ~ID_EX_ctrl_FpInst) & (EX_MEM_regw == ID_EX_reg2);

// EX to FEX forwarding
assign frwrd_MEM_FEX_opA = (EX_MEM_ctrl_regw & ID_FEX_ctrl_FPIntCvtReg[0]) & (EX_MEM_regw == ID_FEX_reg1);
assign frwrd_MEM_FEX_opB = (EX_MEM_ctrl_regw & ID_FEX_ctrl_FPIntCvtReg[0]) & (EX_MEM_regw == ID_FEX_reg2);

// FEX to EX forwarding
assign frwrd_fp_WB_EX_opA = (FEX_WB_ctrl_regw & FEX_WB_ctrl_FPIntCvtReg[1]) & (FEX_WB_regw == ID_EX_reg1);
assign frwrd_fp_WB_EX_opB = (FEX_WB_ctrl_regw & FEX_WB_ctrl_FPIntCvtReg[1]) & (FEX_WB_regw == ID_EX_reg2);

// FEX to FEX forwarding
assign frwrd_WB_FEX_opA = (FEX_WB_ctrl_regw & ~FEX_WB_ctrl_MemRead & ID_FEX_ctrl_FpInst) & (FEX_WB_regw == ID_FEX_reg1);
assign frwrd_WB_FEX_opB = (FEX_WB_ctrl_regw & ~FEX_WB_ctrl_MemRead & ID_FEX_ctrl_FpInst) & (FEX_WB_regw == ID_FEX_reg2);

// MEM to EX forwarding
// 1. Integer Instructions: Only forward if a) Integer Instruction in both WB and EX b) Reg Indexes Match
// 2. FP Instructions: Only forward if a) FP Instruction in both WB and EX b) Reg Indexes Match
assign frwrd_WB_EX_opA = ((MEM_WB_ctrl_regw & ~MEM_WB_ctrl_FpInst & ~ID_EX_ctrl_FpInst) | 
                         (~MEM_WB_ctrl_regw & MEM_WB_ctrl_FpInst & ID_EX_ctrl_FpInst)) & (MEM_WB_regw == ID_EX_reg1);
assign frwrd_WB_EX_opB = ((MEM_WB_ctrl_regw & ~MEM_WB_ctrl_FpInst & ~ID_EX_ctrl_FpInst) | 
                         (~MEM_WB_ctrl_regw & MEM_WB_ctrl_FpInst & ID_EX_ctrl_FpInst)) & (MEM_WB_regw == ID_EX_reg2);

// MEM to FEX forwarding
assign frwrd_int_WB_EX_opA = (~MEM_WB_ctrl_regw & MEM_WB_ctrl_FpInst & ID_FEX_ctrl_FpInst) & (MEM_WB_regw == ID_FEX_reg1);
assign frwrd_int_WB_EX_opB = (~MEM_WB_ctrl_regw & MEM_WB_ctrl_FpInst & ID_FEX_ctrl_FpInst) & (MEM_WB_regw == ID_FEX_reg2);

// Register bypass
assign bypass_reg1 = (MEM_WB_ctrl_regw & ~MEM_WB_ctrl_FpInst) & (MEM_WB_regw == IF_ID_reg1);
assign bypass_reg2 = (MEM_WB_ctrl_regw & ~MEM_WB_ctrl_FpInst) & (MEM_WB_regw == IF_ID_reg2);

// Register bypass for FP -> Int and Int -> Int for FP Mem Pipeline
assign fp_int_bypass_reg1 = (FEX_WB_ctrl_regw & FEX_WB_ctrl_FpInst) & (FEX_WB_regw == IF_ID_reg1);
assign fp_int_bypass_reg2 = (FEX_WB_ctrl_regw & FEX_WB_ctrl_FpInst) & (FEX_WB_regw == IF_ID_reg2);

// FP register bypass for FP -> FP and Int -> FP (Int -> FP is only for FP LD/ST which is taken care of by fp_write_in)
assign fp_bypass_reg1 = (FEX_WB_ctrl_regw) & (FEX_WB_regw == IF_ID_reg1);
assign fp_bypass_reg2 = (FEX_WB_ctrl_regw) & (FEX_WB_regw == IF_ID_reg2);

// EX to ID forwrding (for branch)
assign frwrd_EX_ID_opA = (EX_MEM_ctrl_regw & ~EX_MEM_ctrl_FpInst) & (EX_MEM_regw == IF_ID_reg1);

endmodule