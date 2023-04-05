// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!
// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.
package decode_tasks_pkg;

task automatic check_LDCR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00001101001010100011111111010000;
	$display ("time %t : Inst LDCR Rs 9 Value %h Rt 6 Value %h Imm16 0011111111010000 Imm26 11101011000100100100101101", $time, rf_tb[9], rf_tb[6]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_ADDI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00100011010000100000001000101100;
	$display ("time %t : Inst ADDI Rs 26 Value %h Rt 12 Value %h Imm16 0000001000101100 Imm26 10001001001100011011100100", $time, rf_tb[26], rf_tb[12]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SUBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00100101000100000011001000010111;
	$display ("time %t : Inst SUBI Rs 8 Value %h Rt 21 Value %h Imm16 0011001000010111 Imm26 00101100101000010110011000", $time, rf_tb[8], rf_tb[21]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_XORI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00101010111001100110001010001101;
	$display ("time %t : Inst XORI Rs 23 Value %h Rt 1 Value %h Imm16 0110001010001101 Imm26 10110010100110110001110101", $time, rf_tb[23], rf_tb[1]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_ANDNI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00101100100101001011111111001000;
	$display ("time %t : Inst ANDNI Rs 4 Value %h Rt 3 Value %h Imm16 1011111111001000 Imm26 01001011100000110100100000", $time, rf_tb[4], rf_tb[3]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_ROLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01010011000101101000111011101010;
	$display ("time %t : Inst ROLI Rs 24 Value %h Rt 21 Value %h Imm16 1000111011101010 Imm26 10001001100100001000001001", $time, rf_tb[24], rf_tb[21]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SLLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01010111010100001001000001000110;
	$display ("time %t : Inst SLLI Rs 26 Value %h Rt 3 Value %h Imm16 1001000001000110 Imm26 11101101000000001001100000", $time, rf_tb[26], rf_tb[3]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_RORI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01011000000101011101011010110011;
	$display ("time %t : Inst RORI Rs 0 Value %h Rt 18 Value %h Imm16 1101011010110011 Imm26 11000000011100010111011000", $time, rf_tb[0], rf_tb[18]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SRLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01011111100010101000010010001101;
	$display ("time %t : Inst SRLI Rs 28 Value %h Rt 20 Value %h Imm16 1000010010001101 Imm26 11000010110011001100110111", $time, rf_tb[28], rf_tb[20]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_ST (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01000010100001000100011111000010;
	$display ("time %t : Inst ST Rs 20 Value %h Rt 20 Value %h Imm16 0100011111000010 Imm26 11011011100101010101101001", $time, rf_tb[20], rf_tb[20]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_LD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01000100100001000111010110001110;
	$display ("time %t : Inst LD Rs 4 Value %h Rt 2 Value %h Imm16 0111010110001110 Imm26 11101111111111011000100001", $time, rf_tb[4], rf_tb[2]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_STU (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01001110110101001110111101000101;
	$display ("time %t : Inst STU Rs 22 Value %h Rt 6 Value %h Imm16 1110111101000101 Imm26 01101011101111001111101011", $time, rf_tb[22], rf_tb[6]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_ANDI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01100101110111000011110110111111;
	$display ("time %t : Inst ANDI Rs 14 Value %h Rt 10 Value %h Imm16 0011110110111111 Imm26 10110010010011010011010010", $time, rf_tb[14], rf_tb[10]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_ORI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11100110011101101100011110100110;
	$display ("time %t : Inst ORI Rs 19 Value %h Rt 5 Value %h Imm16 1100011110100110 Imm26 10000111010010010110011101", $time, rf_tb[19], rf_tb[5]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_AND (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111111100001011001101000010110;
	$display ("time %t : Inst AND Rs 28 Value %h Rt 26 Value %h Imm16 1001101000010110 Imm26 11001111110111111111110010", $time, rf_tb[28], rf_tb[26]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_OR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111111011111011110010000110011;
	$display ("time %t : Inst OR Rs 27 Value %h Rt 5 Value %h Imm16 1110010000110011 Imm26 11101011001001100110001011", $time, rf_tb[27], rf_tb[5]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_ADD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101100101101011101100000000000;
	$display ("time %t : Inst ADD Rs 5 Value %h Rt 21 Value %h Imm16 1101001010011101 Imm26 01010101111110001100011011", $time, rf_tb[5], rf_tb[21]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SUB (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101111000101010000000000000001;
	$display ("time %t : Inst SUB Rs 24 Value %h Rt 21 Value %h Imm16 0001110100001001 Imm26 00010000101111110011001110", $time, rf_tb[24], rf_tb[21]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_XOR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101101110001010010000000000010;
	$display ("time %t : Inst XOR Rs 14 Value %h Rt 5 Value %h Imm16 1101010110100101 Imm26 11100011011001100001000100", $time, rf_tb[14], rf_tb[5]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_ANDN (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101101101100001010000000000011;
	$display ("time %t : Inst ANDN Rs 13 Value %h Rt 16 Value %h Imm16 0100010011101011 Imm26 01101000010010101101011000", $time, rf_tb[13], rf_tb[16]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_ROL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101011000011010010000000000000;
	$display ("time %t : Inst ROL Rs 24 Value %h Rt 13 Value %h Imm16 0110001011100010 Imm26 10101111011010110110010001", $time, rf_tb[24], rf_tb[13]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SLL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101011011000010011000000000001;
	$display ("time %t : Inst SLL Rs 27 Value %h Rt 1 Value %h Imm16 0100010001010011 Imm26 00000011101110101100010000", $time, rf_tb[27], rf_tb[1]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_ROR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101000001001010101100000000010;
	$display ("time %t : Inst ROR Rs 1 Value %h Rt 5 Value %h Imm16 0001010000010001 Imm26 00011101000011010011011010", $time, rf_tb[1], rf_tb[5]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SRL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101000111010011011100000000011;
	$display ("time %t : Inst SRL Rs 7 Value %h Rt 9 Value %h Imm16 1101001001111110 Imm26 10100001011001001111111001", $time, rf_tb[7], rf_tb[9]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SEQ (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01110010010011110001100000000000;
	$display ("time %t : Inst SEQ Rs 18 Value %h Rt 15 Value %h Imm16 0100111101100011 Imm26 01010101011100001111001001", $time, rf_tb[18], rf_tb[15]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SLT (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01110100010011101101000000000000;
	$display ("time %t : Inst SLT Rs 2 Value %h Rt 14 Value %h Imm16 0001100100001110 Imm26 00101101101011010010100010", $time, rf_tb[2], rf_tb[14]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SLE (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111010101101010110100000000000;
	$display ("time %t : Inst SLE Rs 21 Value %h Rt 21 Value %h Imm16 1101111100000000 Imm26 11110010100011000000111101", $time, rf_tb[21], rf_tb[21]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SLTU (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01110100100000110001100000000000;
	$display ("time %t : Inst SLTU Rs 4 Value %h Rt 3 Value %h Imm16 1010110110100101 Imm26 10010001111101000010111110", $time, rf_tb[4], rf_tb[3]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SLEU (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111001100100001000100000000000;
	$display ("time %t : Inst SLEU Rs 12 Value %h Rt 16 Value %h Imm16 1011010111110001 Imm26 01110010101010101111101011", $time, rf_tb[12], rf_tb[16]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_LBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01100000000100001010100100011100;
	$display ("time %t : Inst LBI Rs 0 Value %h Rt 28 Value %h Imm16 1010100100011100 Imm26 11100100110111101101101001", $time, rf_tb[0], rf_tb[28]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SLBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01001011011101000111001101111011;
	$display ("time %t : Inst SLBI Rs 27 Value %h Rt 20 Value %h Imm16 0111001101111011 Imm26 10011101111011100100001101", $time, rf_tb[27], rf_tb[20]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FADD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101110000001001100000000000000;
	$display ("time %t : Inst FADD Rs 16 Value %h Rt 4 Value %h Imm16 1001000010011101 Imm26 01100000101111110010101001", $time, rf_tb[16], rf_tb[4]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FSUB (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101101011101111100100000000001;
	$display ("time %t : Inst FSUB Rs 11 Value %h Rt 23 Value %h Imm16 0100111111010001 Imm26 00100101000110000111110000", $time, rf_tb[11], rf_tb[23]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FMUL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101110111000101010000000000010;
	$display ("time %t : Inst FMUL Rs 23 Value %h Rt 2 Value %h Imm16 1101001100001001 Imm26 01010011001011101101000010", $time, rf_tb[23], rf_tb[2]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FEQ (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11110000011000000111100000000000;
	$display ("time %t : Inst FEQ Rs 3 Value %h Rt 0 Value %h Imm16 1101100100101000 Imm26 00000111001011101110011110", $time, rf_tb[3], rf_tb[0]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FLE (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11111000100011010011000000000000;
	$display ("time %t : Inst FLE Rs 4 Value %h Rt 13 Value %h Imm16 1100001110110000 Imm26 10101110101110011010001011", $time, rf_tb[4], rf_tb[13]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FLT (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11111100100001110111000000000000;
	$display ("time %t : Inst FLT Rs 4 Value %h Rt 7 Value %h Imm16 1100010001010010 Imm26 10110101100110010101111101", $time, rf_tb[4], rf_tb[7]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FCVTI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10000100000101001101100000000000;
	$display ("time %t : Inst FCVTI Rs 0 Value %h Rt 20 Value %h Imm16 1111110100001011 Imm26 11110111010010011110010101", $time, rf_tb[0], rf_tb[20]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_ICVTF (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10000011000110101100100000000000;
	$display ("time %t : Inst ICVTF Rs 24 Value %h Rt 26 Value %h Imm16 0111011100111101 Imm26 11000010111111000011011011", $time, rf_tb[24], rf_tb[26]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FMOVI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10001100110111011001100000000000;
	$display ("time %t : Inst FMOVI Rs 6 Value %h Rt 29 Value %h Imm16 0001110010010101 Imm26 01111011110011001001100110", $time, rf_tb[6], rf_tb[29]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_IMOVF (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10001001011110011011100000000000;
	$display ("time %t : Inst IMOVF Rs 11 Value %h Rt 25 Value %h Imm16 1111000111110100 Imm26 00101010010111011010011100", $time, rf_tb[11], rf_tb[25]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FST (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11000000010011100110000100001100;
	$display ("time %t : Inst FST Rs 2 Value %h Rt 9 Value %h Imm16 0110000100001100 Imm26 11010011111011101011001100", $time, rf_tb[2], rf_tb[9]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FLD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11000110000000001110011000011000;
	$display ("time %t : Inst FLD Rs 16 Value %h Rt 10 Value %h Imm16 1110011000011000 Imm26 11100111111110010001110100", $time, rf_tb[16], rf_tb[10]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FCLASS (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10010000101001111110100000000000;
	$display ("time %t : Inst FCLASS Rs 5 Value %h Rt 7 Value %h Imm16 0001011010001010 Imm26 11000100010000101101110011", $time, rf_tb[5], rf_tb[7]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_STB (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11001001110110110010100011110110;
	$display ("time %t : Inst STB Rs 14 Value %h Rt 27 Value %h Imm16 0010100011110110 Imm26 00101000000000100110110100", $time, rf_tb[14], rf_tb[27]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_LDB (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11001101111011100110000101000001;
	$display ("time %t : Inst LDB Rs 15 Value %h Rt 4 Value %h Imm16 0110000101000001 Imm26 11011110000001000000110111", $time, rf_tb[15], rf_tb[4]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_STH (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11010011101110110101011100110000;
	$display ("time %t : Inst STH Rs 29 Value %h Rt 5 Value %h Imm16 0101011100110000 Imm26 10011110100100010111010011", $time, rf_tb[29], rf_tb[5]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_LDH (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11010101000000100110011001111010;
	$display ("time %t : Inst LDH Rs 8 Value %h Rt 10 Value %h Imm16 0110011001111010 Imm26 11110111111110011100000011", $time, rf_tb[8], rf_tb[10]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_XORSI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10101011101001011111111010011110;
	$display ("time %t : Inst XORSI Rs 29 Value %h Rt 28 Value %h Imm16 1111111010011110 Imm26 10000000111000000000101000", $time, rf_tb[29], rf_tb[28]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SRAI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11011110000000011011001111111001;
	$display ("time %t : Inst SRAI Rs 16 Value %h Rt 6 Value %h Imm16 1011001111111001 Imm26 01110100000001101001010101", $time, rf_tb[16], rf_tb[6]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SRA (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101001010110100100100000000000;
	$display ("time %t : Inst SRA Rs 10 Value %h Rt 26 Value %h Imm16 0010101000010101 Imm26 11110110010100010010100110", $time, rf_tb[10], rf_tb[26]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
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
	check_ANDI(clk, inst_i, rf_tb);
	check_ORI(clk, inst_i, rf_tb);
	check_AND(clk, inst_i, rf_tb);
	check_OR(clk, inst_i, rf_tb);
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
	check_SLTU(clk, inst_i, rf_tb);
	check_SLEU(clk, inst_i, rf_tb);
	check_LBI(clk, inst_i, rf_tb);
	check_SLBI(clk, inst_i, rf_tb);
	check_FADD(clk, inst_i, fp_rf_tb);
	check_FSUB(clk, inst_i, fp_rf_tb);
	check_FMUL(clk, inst_i, fp_rf_tb);
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
	check_STB(clk, inst_i, rf_tb);
	check_LDB(clk, inst_i, rf_tb);
	check_STH(clk, inst_i, rf_tb);
	check_LDH(clk, inst_i, rf_tb);
	check_XORSI(clk, inst_i, rf_tb);
	check_SRAI(clk, inst_i, rf_tb);
	check_SRA(clk, inst_i, rf_tb);
endtask

endpackage