// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!
// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.
package decode_tasks_pkg;

task automatic check_LDCR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00001100110100101101011101011110;
	$display ("time %t : Inst LDCR Rs 6 Value %h Rt 9 Value %h Imm16 1101011101011110 Imm26 00110110101110111000110111", $time, rf_tb[6], rf_tb[9]);
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
	inst_i = 'b00100010000000011101010001110101;
	$display ("time %t : Inst ADDI Rs 16 Value %h Rt 1 Value %h Imm16 1101010001110101 Imm26 00010001110101010011000000", $time, rf_tb[16], rf_tb[1]);
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
	inst_i = 'b00100110111001111100101111000010;
	$display ("time %t : Inst SUBI Rs 23 Value %h Rt 14 Value %h Imm16 1100101111000010 Imm26 10010011000100110000010011", $time, rf_tb[23], rf_tb[14]);
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
	inst_i = 'b00101001000001110011110111111111;
	$display ("time %t : Inst XORI Rs 8 Value %h Rt 6 Value %h Imm16 0011110111111111 Imm26 01011101010000101011000100", $time, rf_tb[8], rf_tb[6]);
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
	inst_i = 'b00101101100000000100111100111101;
	$display ("time %t : Inst ANDNI Rs 12 Value %h Rt 22 Value %h Imm16 0100111100111101 Imm26 10100001101000010010010101", $time, rf_tb[12], rf_tb[22]);
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
	inst_i = 'b01010000011010111001100010101110;
	$display ("time %t : Inst ROLI Rs 3 Value %h Rt 27 Value %h Imm16 1001100010101110 Imm26 01111101111001000100011111", $time, rf_tb[3], rf_tb[27]);
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
	inst_i = 'b01010101111011011000111011101011;
	$display ("time %t : Inst SLLI Rs 15 Value %h Rt 26 Value %h Imm16 1000111011101011 Imm26 00100111001110011100001111", $time, rf_tb[15], rf_tb[26]);
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
	inst_i = 'b01011001001011111010110011101000;
	$display ("time %t : Inst RORI Rs 9 Value %h Rt 21 Value %h Imm16 1010110011101000 Imm26 00110100010001010001010100", $time, rf_tb[9], rf_tb[21]);
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
	inst_i = 'b01011100001101011011001011000101;
	$display ("time %t : Inst SRLI Rs 1 Value %h Rt 17 Value %h Imm16 1011001011000101 Imm26 00100010010000011111111001", $time, rf_tb[1], rf_tb[17]);
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
	inst_i = 'b01000011101110001000110010110001;
	$display ("time %t : Inst ST Rs 29 Value %h Rt 10 Value %h Imm16 1000110010110001 Imm26 00000111000011000111000111", $time, rf_tb[29], rf_tb[10]);
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
	inst_i = 'b01000101010000110001101101101010;
	$display ("time %t : Inst LD Rs 10 Value %h Rt 10 Value %h Imm16 0001101101101010 Imm26 00010011100011110001111111", $time, rf_tb[10], rf_tb[10]);
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
	inst_i = 'b01001111010001000001010010010110;
	$display ("time %t : Inst STU Rs 26 Value %h Rt 20 Value %h Imm16 0001010010010110 Imm26 10101001001000111000011010", $time, rf_tb[26], rf_tb[20]);
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
	inst_i = 'b01100100011001111101110011111100;
	$display ("time %t : Inst ANDI Rs 3 Value %h Rt 9 Value %h Imm16 1101110011111100 Imm26 11110000111010001100110110", $time, rf_tb[3], rf_tb[9]);
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
	inst_i = 'b11100101010010110000111100110100;
	$display ("time %t : Inst ORI Rs 10 Value %h Rt 10 Value %h Imm16 0000111100110100 Imm26 11110000110000101110011100", $time, rf_tb[10], rf_tb[10]);
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
	inst_i = 'b01111111100100011111111011001101;
	$display ("time %t : Inst AND Rs 28 Value %h Rt 4 Value %h Imm16 1111111011001101 Imm26 01111101000100110110011000", $time, rf_tb[28], rf_tb[4]);
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
	inst_i = 'b01111110001011100111110101001110;
	$display ("time %t : Inst OR Rs 17 Value %h Rt 19 Value %h Imm16 0111110101001110 Imm26 10101001111010101001010111", $time, rf_tb[17], rf_tb[19]);
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
	inst_i = 'b01101100111100011010000000000000;
	$display ("time %t : Inst ADD Rs 7 Value %h Rt 17 Value %h Imm16 0111101110111011 Imm26 11111001101101101000001010", $time, rf_tb[7], rf_tb[17]);
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
	inst_i = 'b01101101010001110100000000000001;
	$display ("time %t : Inst SUB Rs 10 Value %h Rt 7 Value %h Imm16 0100110101011010 Imm26 10010101000010111011001110", $time, rf_tb[10], rf_tb[7]);
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
	inst_i = 'b01101101101101000001100000000010;
	$display ("time %t : Inst XOR Rs 13 Value %h Rt 20 Value %h Imm16 0001100010100011 Imm26 11011001001100100010011110", $time, rf_tb[13], rf_tb[20]);
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
	inst_i = 'b01101110011101100101000000000011;
	$display ("time %t : Inst ANDN Rs 19 Value %h Rt 22 Value %h Imm16 1101100100011000 Imm26 11010101101011001000001110", $time, rf_tb[19], rf_tb[22]);
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
	inst_i = 'b01101001111111000010000000000000;
	$display ("time %t : Inst ROL Rs 15 Value %h Rt 28 Value %h Imm16 0010111100011100 Imm26 10010011011011100001100000", $time, rf_tb[15], rf_tb[28]);
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
	inst_i = 'b01101011000100101001100000000001;
	$display ("time %t : Inst SLL Rs 24 Value %h Rt 18 Value %h Imm16 0011101110010001 Imm26 00101101000010100101011000", $time, rf_tb[24], rf_tb[18]);
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
	inst_i = 'b01101010011001111001100000000010;
	$display ("time %t : Inst ROR Rs 19 Value %h Rt 7 Value %h Imm16 1011100001011111 Imm26 01001011111000001011100010", $time, rf_tb[19], rf_tb[7]);
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
	inst_i = 'b01101010101010101011100000000011;
	$display ("time %t : Inst SRL Rs 21 Value %h Rt 10 Value %h Imm16 1110101110100111 Imm26 11100111010011110110101001", $time, rf_tb[21], rf_tb[10]);
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
	inst_i = 'b01110000000110110001000000000000;
	$display ("time %t : Inst SEQ Rs 0 Value %h Rt 27 Value %h Imm16 1111101001001110 Imm26 10101001010001111110100001", $time, rf_tb[0], rf_tb[27]);
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
	inst_i = 'b01110101110000101011000000000000;
	$display ("time %t : Inst SLT Rs 14 Value %h Rt 2 Value %h Imm16 0000011010001011 Imm26 11011010110110101100000101", $time, rf_tb[14], rf_tb[2]);
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
	inst_i = 'b01111010101010001100000000000000;
	$display ("time %t : Inst SLE Rs 21 Value %h Rt 8 Value %h Imm16 1111000010101000 Imm26 10000010111010010111111100", $time, rf_tb[21], rf_tb[8]);
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
	inst_i = 'b01110111011100000110100000000000;
	$display ("time %t : Inst SLTU Rs 27 Value %h Rt 16 Value %h Imm16 0010000110001000 Imm26 11010110001110011111111100", $time, rf_tb[27], rf_tb[16]);
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
	inst_i = 'b01111000110111000010000000000000;
	$display ("time %t : Inst SLEU Rs 6 Value %h Rt 28 Value %h Imm16 1110101101011000 Imm26 00010110101000000111110000", $time, rf_tb[6], rf_tb[28]);
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
	inst_i = 'b01100011101001110000111100101110;
	$display ("time %t : Inst LBI Rs 29 Value %h Rt 18 Value %h Imm16 0000111100101110 Imm26 01100101101011000110010001", $time, rf_tb[29], rf_tb[18]);
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
	inst_i = 'b01001010111101100010110101100001;
	$display ("time %t : Inst SLBI Rs 23 Value %h Rt 13 Value %h Imm16 0010110101100001 Imm26 01000001110100100110101010", $time, rf_tb[23], rf_tb[13]);
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
	inst_i = 'b11101100000100100000100000000000;
	$display ("time %t : Inst FADD Rs 0 Value %h Rt 18 Value %h Imm16 1110110111011101 Imm26 11100011001000001101111100", $time, rf_tb[0], rf_tb[18]);
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
	inst_i = 'b11101100010000000111000000000001;
	$display ("time %t : Inst FSUB Rs 2 Value %h Rt 0 Value %h Imm16 0010000110100110 Imm26 00001110001110000111000010", $time, rf_tb[2], rf_tb[0]);
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
	inst_i = 'b11101110001101010101000000000010;
	$display ("time %t : Inst FMUL Rs 17 Value %h Rt 21 Value %h Imm16 1010110110111110 Imm26 11110000111001111110101010", $time, rf_tb[17], rf_tb[21]);
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
	inst_i = 'b11110000010110110011000000000000;
	$display ("time %t : Inst FEQ Rs 2 Value %h Rt 27 Value %h Imm16 1011010110101100 Imm26 10110111010001110101000001", $time, rf_tb[2], rf_tb[27]);
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
	inst_i = 'b11111011101110000110000000000000;
	$display ("time %t : Inst FLE Rs 29 Value %h Rt 24 Value %h Imm16 1001001010011011 Imm26 10011000000010101010010010", $time, rf_tb[29], rf_tb[24]);
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
	inst_i = 'b11111110100001011000100000000000;
	$display ("time %t : Inst FLT Rs 20 Value %h Rt 5 Value %h Imm16 0001110100110111 Imm26 00111000111011000001000101", $time, rf_tb[20], rf_tb[5]);
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
	inst_i = 'b10000101100101000101100000000000;
	$display ("time %t : Inst FCVTI Rs 12 Value %h Rt 20 Value %h Imm16 0100001011101010 Imm26 01111110100000011011010011", $time, rf_tb[12], rf_tb[20]);
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
	inst_i = 'b10000001101001010001100000000000;
	$display ("time %t : Inst ICVTF Rs 13 Value %h Rt 5 Value %h Imm16 0111000110101100 Imm26 10011101101010101000010111", $time, rf_tb[13], rf_tb[5]);
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
	inst_i = 'b10001101010010111000000000000000;
	$display ("time %t : Inst FMOVI Rs 10 Value %h Rt 11 Value %h Imm16 1011111001010000 Imm26 00010100000000100001011001", $time, rf_tb[10], rf_tb[11]);
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
	inst_i = 'b10001000000000110001000000000000;
	$display ("time %t : Inst IMOVF Rs 0 Value %h Rt 3 Value %h Imm16 0111111111101100 Imm26 11110101110011001110000111", $time, rf_tb[0], rf_tb[3]);
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
	inst_i = 'b11000011011100010110110101000000;
	$display ("time %t : Inst FST Rs 27 Value %h Rt 3 Value %h Imm16 0110110101000000 Imm26 11111110101010110111110001", $time, rf_tb[27], rf_tb[3]);
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
	inst_i = 'b11000101111100100110001101000001;
	$display ("time %t : Inst FLD Rs 15 Value %h Rt 9 Value %h Imm16 0110001101000001 Imm26 11001110011001111100011010", $time, rf_tb[15], rf_tb[9]);
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
	inst_i = 'b10010000101010101001100000000000;
	$display ("time %t : Inst FCLASS Rs 5 Value %h Rt 10 Value %h Imm16 0011111011011110 Imm26 10101101100100110000011001", $time, rf_tb[5], rf_tb[10]);
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
	inst_i = 'b11001011100010111000011000001001;
	$display ("time %t : Inst STB Rs 28 Value %h Rt 0 Value %h Imm16 1000011000001001 Imm26 10010010001101011110001111", $time, rf_tb[28], rf_tb[0]);
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
	inst_i = 'b11001101000010010100111011010111;
	$display ("time %t : Inst LDB Rs 8 Value %h Rt 29 Value %h Imm16 0100111011010111 Imm26 01100000111111110100110000", $time, rf_tb[8], rf_tb[29]);
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
	inst_i = 'b11010000011100001011110110101100;
	$display ("time %t : Inst STH Rs 3 Value %h Rt 10 Value %h Imm16 1011110110101100 Imm26 10001001111010011100000110", $time, rf_tb[3], rf_tb[10]);
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
	inst_i = 'b11010101010010001000010110110011;
	$display ("time %t : Inst LDH Rs 10 Value %h Rt 7 Value %h Imm16 1000010110110011 Imm26 01011010001100000111010010", $time, rf_tb[10], rf_tb[7]);
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
	inst_i = 'b10101010110111000010011101000001;
	$display ("time %t : Inst XORSI Rs 22 Value %h Rt 10 Value %h Imm16 0010011101000001 Imm26 11000100000001101101110011", $time, rf_tb[22], rf_tb[10]);
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
	inst_i = 'b11011101001000000110100101101100;
	$display ("time %t : Inst SRAI Rs 9 Value %h Rt 14 Value %h Imm16 0110100101101100 Imm26 11101010010110010010101000", $time, rf_tb[9], rf_tb[14]);
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
	inst_i = 'b11101001000011000000100000000000;
	$display ("time %t : Inst SRA Rs 8 Value %h Rt 12 Value %h Imm16 0110101011011011 Imm26 11110000110001010001101011", $time, rf_tb[8], rf_tb[12]);
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