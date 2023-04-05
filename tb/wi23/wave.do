onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /wi23_tb/WI23/PROC/clk
add wave -noupdate /wi23_tb/WI23/PROC/rst_n
add wave -noupdate -divider IF
add wave -noupdate /wi23_tb/WI23/PROC/inst_i
add wave -noupdate /wi23_tb/WI23/PROC/IF_ID_inst_in
add wave -noupdate -divider ID
add wave -noupdate /wi23_tb/WI23/PROC/iDECODE/inst
add wave -noupdate /wi23_tb/WI23/PROC/iCONTROL/Op
add wave -noupdate -radix unsigned /wi23_tb/WI23/PROC/iDECODE/reg1sel
add wave -noupdate -radix unsigned /wi23_tb/WI23/PROC/iDECODE/reg2sel
add wave -noupdate /wi23_tb/WI23/PROC/iDECODE/iRF/rf1
add wave -noupdate /wi23_tb/WI23/PROC/iDECODE/iRF/rf2
add wave -noupdate -radix unsigned /wi23_tb/WI23/PROC/iDECODE/fp_reg1sel
add wave -noupdate -radix unsigned /wi23_tb/WI23/PROC/iDECODE/fp_reg2sel
add wave -noupdate /wi23_tb/WI23/PROC/iDECODE/iFPRF/rf1
add wave -noupdate /wi23_tb/WI23/PROC/iDECODE/iFPRF/rf2
add wave -noupdate -divider EX
add wave -noupdate /wi23_tb/WI23/PROC/ID_EX_ctrl_Op_out
add wave -noupdate /wi23_tb/WI23/PROC/iEXECUTE/AluOp
add wave -noupdate /wi23_tb/WI23/PROC/iEXECUTE/reg1
add wave -noupdate /wi23_tb/WI23/PROC/iEXECUTE/reg2
add wave -noupdate /wi23_tb/WI23/PROC/iEXECUTE/alu_out
add wave -noupdate -divider FEX
add wave -noupdate /wi23_tb/WI23/PROC/ID_FEX_ctrl_Op_out
add wave -noupdate /wi23_tb/WI23/PROC/iFPEXECUTE/reg1
add wave -noupdate /wi23_tb/WI23/PROC/iFPEXECUTE/reg2
add wave -noupdate /wi23_tb/WI23/PROC/iFPEXECUTE/imm
add wave -noupdate /wi23_tb/WI23/PROC/iFPEXECUTE/alu_out
add wave -noupdate -divider MEM
add wave -noupdate /wi23_tb/WI23/PROC/EX_MEM_ctrl_Op_out
add wave -noupdate /wi23_tb/WI23/PROC/MEM_WB_writesel_in
add wave -noupdate /wi23_tb/WI23/PROC/MEM_WB_mem_out_in
add wave -noupdate -divider WB
add wave -noupdate /wi23_tb/WI23/PROC/MEM_WB_ctrl_Op_out
add wave -noupdate /wi23_tb/WI23/PROC/MEM_WB_ctrl_RegWrite_out
add wave -noupdate /wi23_tb/WI23/PROC/FEX_WB_ctrl_Op_out
add wave -noupdate /wi23_tb/WI23/PROC/FEX_WB_ctrl_RegWrite_out
add wave -noupdate /wi23_tb/WI23/PROC/iDECODE/write_in
add wave -noupdate -radix unsigned /wi23_tb/WI23/PROC/iDECODE/writesel
add wave -noupdate /wi23_tb/WI23/PROC/iDECODE/fp_write_in
add wave -noupdate -radix unsigned /wi23_tb/WI23/PROC/iDECODE/fp_writesel
add wave -noupdate -divider Stall
add wave -noupdate /wi23_tb/WI23/PROC/iHAZARD/stall
add wave -noupdate -divider Forward
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_MEM_EX_opA
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_MEM_EX_opB
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_WB_EX_opA
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_WB_EX_opB
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_EX_ID_opA
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_WB_FEX_opA
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_WB_FEX_opB
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_fp_WB_EX_opA
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_fp_WB_EX_opB
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_int_WB_EX_opA
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_int_WB_EX_opB
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_MEM_FEX_opA
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/frwrd_MEM_FEX_opB
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/bypass_reg1
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/bypass_reg2
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/fp_bypass_reg1
add wave -noupdate /wi23_tb/WI23/PROC/iFORWARD/fp_bypass_reg2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11200 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 219
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 2
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {53600 ps}
