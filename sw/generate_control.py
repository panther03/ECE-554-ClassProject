import csv
import sys
import os

def generate_module(row, names, control_file):
    module_interface = "module control\nimport control_defs_pkg::*;\n(\n    //Inputs\n    input logic [7:0]  op_word,\n\n    //Outputs\n"
    # Find Signal Width and print the output interface signals
    for i in range(len(row)-3):
        signal_name = names[i+3]
        if (signal_name == "InstFmt" or signal_name == "CondOp" or signal_name == "JType" or signal_name == "FPIntCvtReg") :
            signal_width = 2
        elif (signal_name == "AluOp") :
            signal_width = 4
        else :
            signal_width = 1
        module_interface += "    output logic [" + str(signal_width-1) +":0]  "+signal_name+",\n" 
    module_interface += "    output logic [0:0]  ctrl_err,\n    output op_word_t Op\n);\n\n" 
    control_file.write(module_interface)
    case_start = "/*\n    7 bit opcode word comprised of the 5-bit opcode,\n    and the 2 LSBs of the instruction to indicate ALU\n    operation in the R-type case (in that order.)\n*/\n"
    case_start +="always_comb begin\n    case (op_word) inside\n"
    control_file.write(case_start)

def end_module(control_file):
    ## Default Case Statement
    control_file.write("        default: begin RegWrite = 0; MemWrite = 0; MemRead = 0; InstFmt = 2'b00; MemToReg = 0; AluSrc = 0; AluOp = 4'b0000; CondOp = 2'b00; JType = 2'b00; XtendSel = 0; Exc = 1; Halt = 0; FPInst = 0; FPIntCvtReg = 2'b00; InstMemRead = 0; ctrl_err = 1; Op = NOP; end // error case (default)\n")
    control_file.write("    endcase\nend")
    control_file.write("\n\nendmodule")

def generate_pkg(pkg_file):
    pkg_str = "// This file is auto generated using sw/generate_control.py. DO NOT EDIT!\n"
    pkg_str += "package control_defs_pkg;\n\n"
    pkg_str += "////////////////////////////\n//// Instruction Decode ////\n////////////////////////////\n\n"
    pkg_str += "typedef enum logic [6:0] {\n"
    pkg_file.write(pkg_str)

def end_pkg(pkg_file):
    # Remove the last "," printed
    pkg_file = open("control_defs_pkg.sv", 'rb+')
    pkg_file.seek(-2, 2)
    pkg_file.truncate()
    pkg_file.close()
    # Print the end of the enum and package
    pkg_file = open("control_defs_pkg.sv", 'a')
    pkg_str = "\n} op_word_t;\n\n"
    pkg_str += "endpackage"
    pkg_file.write(pkg_str)
    pkg_file.close()

def generate_row(row, names, control_file, pkg_file):
    # Print Case Statements
    enum_item = f"    {row[2]},\n"
    case_string = f"        {row[0]}_{row[1]} : begin "
    for i in range(len(row)-3):
        signal_name = names[i+3]
        signal_val = row[i+3]
        case_string += f"{signal_name} = {signal_val}; "
    case_string += f"ctrl_err = 0; Op = {row[2]}; end // {row[2]}\n"
    control_file.write(case_string)
    pkg_file.write(enum_item)

def gen_control(f) :
    csv_reader = csv.reader(f, delimiter=',')
    names = []
    first = True
    # Print Verilog Module
    control_file = open("control.sv", 'w')
    pkg_file = open("control_defs_pkg.sv", 'w')
    declaration = "// This file is auto generated using sw/generate_control.py. DO NOT EDIT!\n"
    declaration +="// This module outputs the decode control signals.\n"
    control_file.write(declaration)
    for row in csv_reader:
        if first:
            names = row
            first = False
            generate_module(row, names, control_file)
            generate_pkg(pkg_file)
        else:
            generate_row(row,names, control_file, pkg_file)
    end_module(control_file)
    pkg_file.close()
    end_pkg(pkg_file)
    control_file.close()
