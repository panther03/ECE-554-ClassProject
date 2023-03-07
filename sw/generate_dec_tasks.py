import random
import csv
import sys

def generate_pkg(pkg_file):
    pkg_str = "package decode_tasks_pkg;\n\n"
    pkg_file.write(pkg_str)

def end_pkg(pkg_file):
    # Print the end of the enum and package
    pkg_str = "endpackage"
    pkg_file.write(pkg_str)

#def generate_inst_task(row, names, pkg_file, inst_file, addr):
def generate_inst_task(row, names, pkg_file):
    ## Determine Instruction Type
    itype1 = False
    itype2 = False
    jtype = False
    rtype = False
    if (row[6] == "2'b00"):
        itype2 = True
    elif (row[6] == "2'b01"):
        itype1 = True
    elif (row[6] == "2'b10"):
        rtype = True
    else:
        jtype = True

    ## Determine FP
    fpinst = False
    if (row[16] == "1"):
        fpinst = True

    ## Don't check for NOP, HALT, Branch, J and IRQ
    no_check = False
    if (row[0] == "8'b000000" or row[0] == "8'b000001" or row[0] == "8'b000010" or jtype or row[11] != "2'b00"):
        no_check = True

    if (no_check):
        return
        
    ## Create the opcode
    rd_n = random.randint(0,29)
    rs_n = random.randint(0,29)
    rt_n = random.randint(0,29)
    rd_b = format(rd_n, '05b')
    rs_b = format(rs_n, '05b')
    rt_b = format(rt_n, '05b')
    imm16_n = random.getrandbits(16)
    imm16_n = random.getrandbits(16)
    imm16_b = format(imm16_n, '016b')
    imm26_n = random.getrandbits(26)
    imm26_b = format(imm26_n, '026b')
    opcode = row[0][2:]
    if(row[2] == "ANDN" or row[2] == "SRL" or row[2] == "FDIV"):
        alufn_n = 3
    elif(row[2] == "XOR" or row[2] == "ROR" or row[2] == "FMUL"):
        alufn_n = 2
    elif(row[2] == "SUB" or row[2] == "SLL" or row[2] == "FSUB"):
        alufn_n = 1
    else:
        alufn_n = 0
    alufn_b = format(alufn_n, '02b')
    if (itype2 or itype1):
        inst = opcode+rs_b+rd_b+imm16_b
    else:
        inst = opcode+rs_b+rt_b+rd_b+'000000000'+alufn_b

    # Write the hex file
    #inst_d = int(inst, 2)
    #inst_h = hex(inst_d)
    #addr_h = hex(addr)
    #out_l = f"@{addr_h} {inst_h} // {row[2]}\n"
    #inst_file.write(out_l)

    #@ Verilog binary format
    inst = "'b"+inst[1:]

    task_head = f"task automatic check_{row[2]} (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);\n"
    ## Clear RF at the start
    task_body = f"\t@ (negedge clk);\n\tinst_i = 'h04000000; // NOP\n"
    task_body += f"\tfor (int i = 0; i < 30; i++)\n\t\trf_tb[i] = $urandom();\n"
    ## Set instruction to test
    task_body += f"\t@ (negedge clk);\n\tinst_i = {inst};\n"
    ## Set instruction to NOP
    task_body += f"\t@ (negedge clk);\n\tinst_i = 'h04000000; // NOP\n"
    task_body += f"\trepeat (4) @ (posedge clk);\n"
    task_body += f"\t$display (\"time %t : Inst {row[2]} Rs {rs_n} Value %h Rt {rt_n} Value %h Rd {rd_n} Value %h Imm16 {imm16_b} Imm26 {imm26_b}\", $time, rf_tb[{rs_n}], rf_tb[{rt_n}], rf_tb[{rd_n}]);\n"
    task_body += f"\t@ (posedge clk);\n"
    task_tail = f"endtask\n\n"

    pkg_file.write(task_head)
    pkg_file.write(task_body)
    pkg_file.write(task_tail)

def generate_test_task(row, names, pkg_file):
    ## Determine Instruction Type
    itype1 = False
    itype2 = False
    jtype = False
    rtype = False
    if (row[6] == "2'b00"):
        itype2 = True
    elif (row[6] == "2'b01"):
        itype1 = True
    elif (row[6] == "2'b10"):
        rtype = True
    else:
        jtype = True

    ## Determine FP
    fpinst = False
    if (row[16] == "1"):
        fpinst = True

    ## Don't check for NOP, HALT, Branch, J and IRQ
    no_check = False
    if (row[0] == "8'b000000" or row[0] == "8'b000001" or row[0] == "8'b000010" or jtype or row[11] != "2'b00"):
        no_check = True

    if (no_check):
        return

    if (fpinst):
        task_body = f"\tcheck_{row[2]}(clk, inst_i, fp_rf_tb);\n"
    else:
        task_body = f"\tcheck_{row[2]}(clk, inst_i, rf_tb);\n"
    pkg_file.write(task_body)

def gen_dec_tasks(f) :
    csv_reader = csv.reader(f, delimiter=',')
    orders = list(csv_reader)
    names = []
    first = True
    # Print Verilog Module
    tb_tasks_file = open("decode_tasks_pkg.sv", 'w')
    #inst_file = open("out.hex", 'w')
    declaration = "// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!\n"
    declaration +="// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.\n"
    tb_tasks_file.write(declaration)
    #addr = 0
    for row in orders:
        if first:
            names = row
            first = False
            generate_pkg(tb_tasks_file)
        else:
            generate_inst_task(row,names, tb_tasks_file)#, inst_file, addr)
            #addr += 4
    # Generate top-level task to call all individual instruction tasks
    first = True
    task_head = f"\n\ntask automatic check_dec_inst (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32], ref logic [31:0] fp_rf_tb [32]);\n"
    tb_tasks_file.write(task_head)
    for row in orders:
        if first:
            names = row
            first = False
        else:
            generate_test_task(row,names, tb_tasks_file)
    task_tail = f"endtask\n\n" 
    tb_tasks_file.write(task_tail)
    end_pkg(tb_tasks_file)
    tb_tasks_file.close()
    #inst_file.close()
