import filecmp
import os
import sys
import difflib

def sim_compare (f1, f2):
    result_file = open("sim_trace_compare.log", 'w')

    sv_trace = f1;
    sim_trace = f2;
    
    sv_trace_lines = sv_trace.readlines()
    sim_trace_lines = sim_trace.readlines()
    
    diff = False
    for line in difflib.unified_diff(sv_trace_lines, sim_trace_lines, fromfile='f1', tofile='f2', lineterm=''):
        result_file.write(line)
        diff = True

    result_file.write("\n---------- Simulation trace ended ----------\n")
    if (diff) :
        result_file.write("FAILED! Simulation trace difference detected!")
    else :
        result_file.write("PASSED! Simulation trace the same!")
    
    result_file.close()
