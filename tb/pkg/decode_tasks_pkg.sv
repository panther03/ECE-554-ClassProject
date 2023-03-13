// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!
// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.
package decode_tasks_pkg;

task automatic check_LDCR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00001101011101000001111111001111;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst LDCR Rs 11 Value %h Rt 15 Value %h Rd 20 Value %h Imm16 0001111111001111 Imm26 00111011011010001010010010", $time, rf_tb[11], rf_tb[15], rf_tb[20]);
	@ (posedge clk);
endtask

task automatic check_ADDI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00100001010110110111111101000100;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ADDI Rs 10 Value %h Rt 21 Value %h Rd 27 Value %h Imm16 0111111101000100 Imm26 10100100011110110000110010", $time, rf_tb[10], rf_tb[21], rf_tb[27]);
	@ (posedge clk);
endtask

task automatic check_SUBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00100110010101110101111001101000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SUBI Rs 18 Value %h Rt 5 Value %h Rd 23 Value %h Imm16 0101111001101000 Imm26 10111001010001001111100000", $time, rf_tb[18], rf_tb[5], rf_tb[23]);
	@ (posedge clk);
endtask

task automatic check_XORI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00101001001011101101001000010101;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst XORI Rs 9 Value %h Rt 5 Value %h Rd 14 Value %h Imm16 1101001000010101 Imm26 00001011000000001111010011", $time, rf_tb[9], rf_tb[5], rf_tb[14]);
	@ (posedge clk);
endtask

task automatic check_ANDNI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00101110100000010011011101001001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ANDNI Rs 20 Value %h Rt 13 Value %h Rd 1 Value %h Imm16 0011011101001001 Imm26 00111000101011100110000110", $time, rf_tb[20], rf_tb[13], rf_tb[1]);
	@ (posedge clk);
endtask

task automatic check_ROLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01010001010000001011011001000011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ROLI Rs 10 Value %h Rt 21 Value %h Rd 0 Value %h Imm16 1011011001000011 Imm26 01011100111010010010001110", $time, rf_tb[10], rf_tb[21], rf_tb[0]);
	@ (posedge clk);
endtask

task automatic check_SLLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01010111100010101010001001001011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLLI Rs 28 Value %h Rt 17 Value %h Rd 10 Value %h Imm16 1010001001001011 Imm26 10110010110010100110100111", $time, rf_tb[28], rf_tb[17], rf_tb[10]);
	@ (posedge clk);
endtask

task automatic check_RORI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01011011001100100001010001101100;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst RORI Rs 25 Value %h Rt 23 Value %h Rd 18 Value %h Imm16 0001010001101100 Imm26 11101011000101111100110000", $time, rf_tb[25], rf_tb[23], rf_tb[18]);
	@ (posedge clk);
endtask

task automatic check_SRLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01011111000100111011100110001010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SRLI Rs 24 Value %h Rt 17 Value %h Rd 19 Value %h Imm16 1011100110001010 Imm26 00101101011100011010011010", $time, rf_tb[24], rf_tb[17], rf_tb[19]);
	@ (posedge clk);
endtask

task automatic check_ST (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01000000101000011101100110001000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ST Rs 5 Value %h Rt 15 Value %h Rd 1 Value %h Imm16 1101100110001000 Imm26 01011000110010010011001100", $time, rf_tb[5], rf_tb[15], rf_tb[1]);
	@ (posedge clk);
endtask

task automatic check_LD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01000101000000000010110100000010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst LD Rs 8 Value %h Rt 0 Value %h Rd 0 Value %h Imm16 0010110100000010 Imm26 00100100001100111110011010", $time, rf_tb[8], rf_tb[0], rf_tb[0]);
	@ (posedge clk);
endtask

task automatic check_STU (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01001101100000001010010011010000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst STU Rs 12 Value %h Rt 16 Value %h Rd 0 Value %h Imm16 1010010011010000 Imm26 00001100001001001111001011", $time, rf_tb[12], rf_tb[16], rf_tb[0]);
	@ (posedge clk);
endtask

task automatic check_BTR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01100110111101110000100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst BTR Rs 23 Value %h Rt 23 Value %h Rd 1 Value %h Imm16 0001100010000010 Imm26 10001101001001111000111001", $time, rf_tb[23], rf_tb[23], rf_tb[1]);
	@ (posedge clk);
endtask

task automatic check_ADD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101100100000111000000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ADD Rs 4 Value %h Rt 3 Value %h Rd 16 Value %h Imm16 0001100111001110 Imm26 11110011110111001100010010", $time, rf_tb[4], rf_tb[3], rf_tb[16]);
	@ (posedge clk);
endtask

task automatic check_SUB (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101110100011010000000000000001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SUB Rs 20 Value %h Rt 13 Value %h Rd 0 Value %h Imm16 1100111000110110 Imm26 10010101001001000110111100", $time, rf_tb[20], rf_tb[13], rf_tb[0]);
	@ (posedge clk);
endtask

task automatic check_XOR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101100111110110010000000000010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst XOR Rs 7 Value %h Rt 27 Value %h Rd 4 Value %h Imm16 1111011011100110 Imm26 10110001111011110101011001", $time, rf_tb[7], rf_tb[27], rf_tb[4]);
	@ (posedge clk);
endtask

task automatic check_ANDN (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101110010000110001100000000011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ANDN Rs 18 Value %h Rt 3 Value %h Rd 3 Value %h Imm16 0110111101110111 Imm26 00010101100111110100001100", $time, rf_tb[18], rf_tb[3], rf_tb[3]);
	@ (posedge clk);
endtask

task automatic check_ROL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101011000001000100000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ROL Rs 24 Value %h Rt 4 Value %h Rd 8 Value %h Imm16 1110011011010010 Imm26 10010101110100101101001001", $time, rf_tb[24], rf_tb[4], rf_tb[8]);
	@ (posedge clk);
endtask

task automatic check_SLL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101001011001010001000000000001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLL Rs 11 Value %h Rt 5 Value %h Rd 2 Value %h Imm16 1010111100111000 Imm26 01101101010110111001111000", $time, rf_tb[11], rf_tb[5], rf_tb[2]);
	@ (posedge clk);
endtask

task automatic check_ROR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101000011110000001100000000010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ROR Rs 3 Value %h Rt 24 Value %h Rd 3 Value %h Imm16 1101101100100101 Imm26 00111111101011100111010100", $time, rf_tb[3], rf_tb[24], rf_tb[3]);
	@ (posedge clk);
endtask

task automatic check_SRL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101010100110000110100000000011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SRL Rs 20 Value %h Rt 24 Value %h Rd 13 Value %h Imm16 0001000010110110 Imm26 01110001011100000000001100", $time, rf_tb[20], rf_tb[24], rf_tb[13]);
	@ (posedge clk);
endtask

task automatic check_SEQ (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01110001010101000001100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SEQ Rs 10 Value %h Rt 20 Value %h Rd 3 Value %h Imm16 1100011101110011 Imm26 11010010000101110000100100", $time, rf_tb[10], rf_tb[20], rf_tb[3]);
	@ (posedge clk);
endtask

task automatic check_SLT (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01110111101010000001000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLT Rs 29 Value %h Rt 8 Value %h Rd 2 Value %h Imm16 0000101101110101 Imm26 00110111111100110100100101", $time, rf_tb[29], rf_tb[8], rf_tb[2]);
	@ (posedge clk);
endtask

task automatic check_SLE (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111000000011110101000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLE Rs 0 Value %h Rt 15 Value %h Rd 10 Value %h Imm16 1011001011001001 Imm26 11000100011001000100011010", $time, rf_tb[0], rf_tb[15], rf_tb[10]);
	@ (posedge clk);
endtask

task automatic check_SCO (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111100011010110101000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SCO Rs 3 Value %h Rt 11 Value %h Rd 10 Value %h Imm16 0101010010001001 Imm26 11100101111000000001101001", $time, rf_tb[3], rf_tb[11], rf_tb[10]);
	@ (posedge clk);
endtask

task automatic check_LBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01100001100000101011000111001001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst LBI Rs 12 Value %h Rt 28 Value %h Rd 2 Value %h Imm16 1011000111001001 Imm26 01011001110111000001101010", $time, rf_tb[12], rf_tb[28], rf_tb[2]);
	@ (posedge clk);
endtask

task automatic check_SLBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01001010110010000010111001011100;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLBI Rs 22 Value %h Rt 6 Value %h Rd 8 Value %h Imm16 0010111001011100 Imm26 00111100010010001111100011", $time, rf_tb[22], rf_tb[6], rf_tb[8]);
	@ (posedge clk);
endtask

task automatic check_FADD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101111011111000011000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FADD Rs 27 Value %h Rt 28 Value %h Rd 6 Value %h Imm16 0110001101100001 Imm26 01110000101110101111110001", $time, rf_tb[27], rf_tb[28], rf_tb[6]);
	@ (posedge clk);
endtask

task automatic check_FSUB (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101101000101001100000000000001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FSUB Rs 8 Value %h Rt 20 Value %h Rd 24 Value %h Imm16 0010100100010101 Imm26 00101001011011011100100110", $time, rf_tb[8], rf_tb[20], rf_tb[24]);
	@ (posedge clk);
endtask

task automatic check_FMUL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101111001001001000100000000010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FMUL Rs 25 Value %h Rt 4 Value %h Rd 17 Value %h Imm16 0000101011111110 Imm26 10000001011001110011010101", $time, rf_tb[25], rf_tb[4], rf_tb[17]);
	@ (posedge clk);
endtask

task automatic check_FDIV (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101101110101100011100000000011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FDIV Rs 14 Value %h Rt 22 Value %h Rd 7 Value %h Imm16 0111111010111111 Imm26 01101101111111111000110000", $time, rf_tb[14], rf_tb[22], rf_tb[7]);
	@ (posedge clk);
endtask

task automatic check_FEQ (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11110000110110010011000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FEQ Rs 6 Value %h Rt 25 Value %h Rd 6 Value %h Imm16 1101011100111101 Imm26 10000111101110101110101001", $time, rf_tb[6], rf_tb[25], rf_tb[6]);
	@ (posedge clk);
endtask

task automatic check_FLE (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11111001011001011011100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FLE Rs 11 Value %h Rt 5 Value %h Rd 23 Value %h Imm16 0001110010011110 Imm26 01010010101011100111001010", $time, rf_tb[11], rf_tb[5], rf_tb[23]);
	@ (posedge clk);
endtask

task automatic check_FLT (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11111110010010001010100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FLT Rs 18 Value %h Rt 8 Value %h Rd 21 Value %h Imm16 0110011001011000 Imm26 01001100111011000110011110", $time, rf_tb[18], rf_tb[8], rf_tb[21]);
	@ (posedge clk);
endtask

task automatic check_FCVTI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10000110001011101110100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FCVTI Rs 17 Value %h Rt 14 Value %h Rd 29 Value %h Imm16 0100100111001010 Imm26 11000100010000000111011010", $time, rf_tb[17], rf_tb[14], rf_tb[29]);
	@ (posedge clk);
endtask

task automatic check_ICVTF (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10000000011011101011100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ICVTF Rs 3 Value %h Rt 14 Value %h Rd 23 Value %h Imm16 1001101001000001 Imm26 00010111010001110101101011", $time, rf_tb[3], rf_tb[14], rf_tb[23]);
	@ (posedge clk);
endtask

task automatic check_FMOVI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10001100110011101011000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FMOVI Rs 6 Value %h Rt 14 Value %h Rd 22 Value %h Imm16 1110111011011000 Imm26 11111001101111010100111011", $time, rf_tb[6], rf_tb[14], rf_tb[22]);
	@ (posedge clk);
endtask

task automatic check_IMOVF (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10001001010001111000100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst IMOVF Rs 10 Value %h Rt 7 Value %h Rd 17 Value %h Imm16 1001001010110000 Imm26 10111101001000000011101011", $time, rf_tb[10], rf_tb[7], rf_tb[17]);
	@ (posedge clk);
endtask

task automatic check_FST (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11000000011101011000101011000110;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FST Rs 3 Value %h Rt 19 Value %h Rd 21 Value %h Imm16 1000101011000110 Imm26 01110111011101000111000111", $time, rf_tb[3], rf_tb[19], rf_tb[21]);
	@ (posedge clk);
endtask

task automatic check_FLD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11000101001010010001100010010100;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FLD Rs 9 Value %h Rt 19 Value %h Rd 9 Value %h Imm16 0001100010010100 Imm26 01001111011000101011000100", $time, rf_tb[9], rf_tb[19], rf_tb[9]);
	@ (posedge clk);
endtask

task automatic check_FCLASS (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10010011001110100000000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FCLASS Rs 25 Value %h Rt 26 Value %h Rd 0 Value %h Imm16 0010101110010100 Imm26 10000101010000101101010010", $time, rf_tb[25], rf_tb[26], rf_tb[0]);
	@ (posedge clk);
endtask



task automatic check_dec_inst (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32], ref logic [31:0] fp_rf_tb [32]);
	check_LDCR(clk, inst_i, rf_tb);
	check_ADDI(clk, inst_i, rf_tb);
	check_SUBI(clk, inst_i, rf_tb);
	check_XORI(clk, inst_i, rf_tb);
	check_ANDNI(clk, inst_i, rf_tb);
	check_ROLI(clk, inst_i, rf_tb);
	check_SLLI(clk, inst_i, rf_tb);
	check_RORI(clk, inst_i, rf_tb);
	check_SRLI(clk, inst_i, rf_tb);
	check_ST(clk, inst_i, rf_tb);
	check_LD(clk, inst_i, rf_tb);
	check_STU(clk, inst_i, rf_tb);
	check_BTR(clk, inst_i, rf_tb);
	check_ADD(clk, inst_i, rf_tb);
	check_SUB(clk, inst_i, rf_tb);
	check_XOR(clk, inst_i, rf_tb);
	check_ANDN(clk, inst_i, rf_tb);
	check_ROL(clk, inst_i, rf_tb);
	check_SLL(clk, inst_i, rf_tb);
	check_ROR(clk, inst_i, rf_tb);
	check_SRL(clk, inst_i, rf_tb);
	check_SEQ(clk, inst_i, rf_tb);
	check_SLT(clk, inst_i, rf_tb);
	check_SLE(clk, inst_i, rf_tb);
	check_SCO(clk, inst_i, rf_tb);
	check_LBI(clk, inst_i, rf_tb);
	check_SLBI(clk, inst_i, rf_tb);
	check_FADD(clk, inst_i, fp_rf_tb);
	check_FSUB(clk, inst_i, fp_rf_tb);
	check_FMUL(clk, inst_i, fp_rf_tb);
	check_FDIV(clk, inst_i, fp_rf_tb);
	check_FEQ(clk, inst_i, fp_rf_tb);
	check_FLE(clk, inst_i, fp_rf_tb);
	check_FLT(clk, inst_i, fp_rf_tb);
	check_FCVTI(clk, inst_i, fp_rf_tb);
	check_ICVTF(clk, inst_i, fp_rf_tb);
	check_FMOVI(clk, inst_i, fp_rf_tb);
	check_IMOVF(clk, inst_i, fp_rf_tb);
	check_FST(clk, inst_i, fp_rf_tb);
	check_FLD(clk, inst_i, fp_rf_tb);
	check_FCLASS(clk, inst_i, fp_rf_tb);
endtask

endpackage