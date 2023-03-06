onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /wi23_tb/WI23/PROC/clk
add wave -noupdate /wi23_tb/WI23/PROC/rst_n
add wave -noupdate -divider IF
add wave -noupdate /wi23_tb/WI23/PROC/inst_i
add wave -noupdate /wi23_tb/WI23/PROC/IF_ID_inst_in
add wave -noupdate -divider ID
add wave -noupdate /wi23_tb/WI23/PROC/IF_ID_inst_out
add wave -noupdate /wi23_tb/WI23/PROC/ID_EX_Op_in
add wave -noupdate -divider EX
add wave -noupdate /wi23_tb/WI23/PROC/ID_EX_Op_out
add wave -noupdate /wi23_tb/WI23/PROC/EX_MEM_Op_in
add wave -noupdate -divider MEM
add wave -noupdate /wi23_tb/WI23/PROC/EX_MEM_Op_out
add wave -noupdate /wi23_tb/WI23/PROC/MEM_WB_Op_in
add wave -noupdate -divider WB
add wave -noupdate /wi23_tb/WI23/PROC/MEM_WB_Op_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {111000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {436800 ps}
