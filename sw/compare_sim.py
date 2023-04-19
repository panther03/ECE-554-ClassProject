import filecmp
import os
import sys
import difflib
import re

def sim_compare (f1, f2):
    result_file = open("sim_trace_compare.log", 'w')

    sv_trace = f1
    sim_trace = f2
    
    sv_trace_lines = sv_trace.readlines()
    sim_trace_lines = sim_trace.readlines()

    halt_cnt = 0
    sv_trace_lines1 = []
    for line in sv_trace_lines:
        if (re.search('Inst: HALT', line)):
            halt_cnt = halt_cnt + 1
        if (halt_cnt <= 1):
            sv_trace_lines1.append(line)

    halt_cnt = 0
    sim_trace_lines1 = []
    for line in sim_trace_lines:
        if (re.search('Inst: HALT', line) or re.search('program stopped with signal 5', line)): # HALT output from simulator    
            halt_cnt = halt_cnt + 1
        if (halt_cnt <= 1):
            sim_trace_lines1.append(line)
    
    diff_lines = difflib.unified_diff(sv_trace_lines1, sim_trace_lines1, fromfile='wi23_tb_trace.log', tofile='wi23_sim_trace.log', lineterm='')

    diff = False
    for line in diff_lines:
        result_file.write(line+'\n')
        diff = True

    result_file.write("\n---------- Simulation trace ended ----------\n")
    if (diff) :
        result_file.write("FAILED! Simulation trace difference detected!")
    else :
        result_file.write("PASSED! Simulation trace the same!")
    
    result_file.close()
