// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!
// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.
package decode_tasks_pkg;

task automatic check_LDCR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00001111001101101100110000000111;
	$display ("time %t : Inst LDCR Rs 25 Value %h Rt 25 Value %h Imm16 1100110000000111 Imm26 00010000000100100010010100", $time, rf_tb[25], rf_tb[25]);
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
	inst_i = 'b00100010000000101011001111001110;
	$display ("time %t : Inst ADDI Rs 16 Value %h Rt 1 Value %h Imm16 1011001111001110 Imm26 00000001110100110100101011", $time, rf_tb[16], rf_tb[1]);
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
	inst_i = 'b00100110111000011010000000001100;
	$display ("time %t : Inst SUBI Rs 23 Value %h Rt 18 Value %h Imm16 1010000000001100 Imm26 01100111000110000100101000", $time, rf_tb[23], rf_tb[18]);
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
	inst_i = 'b00101010001111000100000101101000;
	$display ("time %t : Inst XORI Rs 17 Value %h Rt 28 Value %h Imm16 0100000101101000 Imm26 11010111101010111001011100", $time, rf_tb[17], rf_tb[28]);
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
	inst_i = 'b00101101001010000110001001110000;
	$display ("time %t : Inst ANDNI Rs 9 Value %h Rt 24 Value %h Imm16 0110001001110000 Imm26 11000000110011111101110000", $time, rf_tb[9], rf_tb[24]);
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
	inst_i = 'b01010011001100111011010000110001;
	$display ("time %t : Inst ROLI Rs 25 Value %h Rt 10 Value %h Imm16 1011010000110001 Imm26 00100000001101001010111110", $time, rf_tb[25], rf_tb[10]);
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
	inst_i = 'b01010100101101001000010000011111;
	$display ("time %t : Inst SLLI Rs 5 Value %h Rt 13 Value %h Imm16 1000010000011111 Imm26 00011001100010001001000001", $time, rf_tb[5], rf_tb[13]);
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
	inst_i = 'b01011001110111000001000000101110;
	$display ("time %t : Inst RORI Rs 14 Value %h Rt 13 Value %h Imm16 0001000000101110 Imm26 11000011001101100110010001", $time, rf_tb[14], rf_tb[13]);
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
	inst_i = 'b01011101011000001000011101110111;
	$display ("time %t : Inst SRLI Rs 11 Value %h Rt 8 Value %h Imm16 1000011101110111 Imm26 00011100001111111011011010", $time, rf_tb[11], rf_tb[8]);
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
	inst_i = 'b01000000000110010110111101011001;
	$display ("time %t : Inst ST Rs 0 Value %h Rt 19 Value %h Imm16 0110111101011001 Imm26 11010110011000010110000100", $time, rf_tb[0], rf_tb[19]);
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
	inst_i = 'b01000101100110010011110011100011;
	$display ("time %t : Inst LD Rs 12 Value %h Rt 26 Value %h Imm16 0011110011100011 Imm26 00101011010100011100100101", $time, rf_tb[12], rf_tb[26]);
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
	inst_i = 'b01001100001011101101010011111010;
	$display ("time %t : Inst STU Rs 1 Value %h Rt 19 Value %h Imm16 1101010011111010 Imm26 01001111110001111100010100", $time, rf_tb[1], rf_tb[19]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_BTR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01100100100100011000100000000000;
	$display ("time %t : Inst BTR Rs 4 Value %h Rt 17 Value %h Imm16 0010101101001100 Imm26 10100000111110100011110101", $time, rf_tb[4], rf_tb[17]);
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
	inst_i = 'b01101101111011101101000000000000;
	$display ("time %t : Inst ADD Rs 15 Value %h Rt 14 Value %h Imm16 1000010101000111 Imm26 11011100011000111000010110", $time, rf_tb[15], rf_tb[14]);
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
	inst_i = 'b01101100010100101011100000000001;
	$display ("time %t : Inst SUB Rs 2 Value %h Rt 18 Value %h Imm16 1010001001100010 Imm26 00101011111110011010010111", $time, rf_tb[2], rf_tb[18]);
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
	inst_i = 'b01101111010001110011000000000010;
	$display ("time %t : Inst XOR Rs 26 Value %h Rt 7 Value %h Imm16 0111110001000111 Imm26 11101001101111001010111011", $time, rf_tb[26], rf_tb[7]);
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
	inst_i = 'b01101101111110110011000000000011;
	$display ("time %t : Inst ANDN Rs 15 Value %h Rt 27 Value %h Imm16 1001000100010110 Imm26 10101110011110100100111001", $time, rf_tb[15], rf_tb[27]);
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
	inst_i = 'b01101010000100010001000000000000;
	$display ("time %t : Inst ROL Rs 16 Value %h Rt 17 Value %h Imm16 0001100101001101 Imm26 10000001110000000001001010", $time, rf_tb[16], rf_tb[17]);
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
	inst_i = 'b01101010100000000000000000000001;
	$display ("time %t : Inst SLL Rs 20 Value %h Rt 0 Value %h Imm16 0011001111011000 Imm26 01101000011110011100000000", $time, rf_tb[20], rf_tb[0]);
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
	inst_i = 'b01101000100101111010000000000010;
	$display ("time %t : Inst ROR Rs 4 Value %h Rt 23 Value %h Imm16 0000011001101100 Imm26 11001100100010011111001101", $time, rf_tb[4], rf_tb[23]);
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
	inst_i = 'b01101000001110111001100000000011;
	$display ("time %t : Inst SRL Rs 1 Value %h Rt 27 Value %h Imm16 1111101010110111 Imm26 00101101110111111010111111", $time, rf_tb[1], rf_tb[27]);
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
	inst_i = 'b01110001000100100100000000000000;
	$display ("time %t : Inst SEQ Rs 8 Value %h Rt 18 Value %h Imm16 0101001101100111 Imm26 10011101110001011001000010", $time, rf_tb[8], rf_tb[18]);
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
	inst_i = 'b01110101101101000001000000000000;
	$display ("time %t : Inst SLT Rs 13 Value %h Rt 20 Value %h Imm16 1101110100100001 Imm26 11010000101001001011010000", $time, rf_tb[13], rf_tb[20]);
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
	inst_i = 'b01111001011010011101000000000000;
	$display ("time %t : Inst SLE Rs 11 Value %h Rt 9 Value %h Imm16 1011011110100011 Imm26 01110100000001111100001111", $time, rf_tb[11], rf_tb[9]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_SCO (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111111001100001100000000000000;
	$display ("time %t : Inst SCO Rs 25 Value %h Rt 16 Value %h Imm16 1110100011011010 Imm26 10010010001000111010111110", $time, rf_tb[25], rf_tb[16]);
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
	inst_i = 'b01100001110001000001001101010111;
	$display ("time %t : Inst LBI Rs 14 Value %h Rt 1 Value %h Imm16 0001001101010111 Imm26 01110011101000010001111011", $time, rf_tb[14], rf_tb[1]);
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
	inst_i = 'b01001000100101010011000110100101;
	$display ("time %t : Inst SLBI Rs 4 Value %h Rt 14 Value %h Imm16 0011000110100101 Imm26 01011000111100110110100110", $time, rf_tb[4], rf_tb[14]);
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
	inst_i = 'b11101101100011010100100000000000;
	$display ("time %t : Inst FADD Rs 12 Value %h Rt 13 Value %h Imm16 0001101110101011 Imm26 11100111010001101001111111", $time, rf_tb[12], rf_tb[13]);
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
	inst_i = 'b11101101001011110000100000000001;
	$display ("time %t : Inst FSUB Rs 9 Value %h Rt 15 Value %h Imm16 0101000101000100 Imm26 01001110000001010000001111", $time, rf_tb[9], rf_tb[15]);
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
	inst_i = 'b11101111010010000111100000000010;
	$display ("time %t : Inst FMUL Rs 26 Value %h Rt 8 Value %h Imm16 1101010010110111 Imm26 00100110101111000001001111", $time, rf_tb[26], rf_tb[8]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_FDIV (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101110100101110100100000000011;
	$display ("time %t : Inst FDIV Rs 20 Value %h Rt 23 Value %h Imm16 0110100101110111 Imm26 00110111100110010110010001", $time, rf_tb[20], rf_tb[23]);
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
	inst_i = 'b11110011000100100011100000000000;
	$display ("time %t : Inst FEQ Rs 24 Value %h Rt 18 Value %h Imm16 0010100011110100 Imm26 00011001001111000000101101", $time, rf_tb[24], rf_tb[18]);
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
	inst_i = 'b11111011101001010111000000000000;
	$display ("time %t : Inst FLE Rs 29 Value %h Rt 5 Value %h Imm16 0000111011111000 Imm26 11000101001101101111001001", $time, rf_tb[29], rf_tb[5]);
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
	inst_i = 'b11111101010100011110000000000000;
	$display ("time %t : Inst FLT Rs 10 Value %h Rt 17 Value %h Imm16 1111111110110101 Imm26 01101110111101101000001010", $time, rf_tb[10], rf_tb[17]);
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
	inst_i = 'b10000101101000011010100000000000;
	$display ("time %t : Inst FCVTI Rs 13 Value %h Rt 1 Value %h Imm16 0111011001000010 Imm26 00000100011111011101000101", $time, rf_tb[13], rf_tb[1]);
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
	inst_i = 'b10000000111100100001000000000000;
	$display ("time %t : Inst ICVTF Rs 7 Value %h Rt 18 Value %h Imm16 0110101110101001 Imm26 00010011101001100111110001", $time, rf_tb[7], rf_tb[18]);
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
	inst_i = 'b10001110011010100101100000000000;
	$display ("time %t : Inst FMOVI Rs 19 Value %h Rt 10 Value %h Imm16 1111010110111010 Imm26 11101001100000110100011100", $time, rf_tb[19], rf_tb[10]);
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
	inst_i = 'b10001001100100000001000000000000;
	$display ("time %t : Inst IMOVF Rs 12 Value %h Rt 16 Value %h Imm16 0101110010000111 Imm26 11001111100010111000110100", $time, rf_tb[12], rf_tb[16]);
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
	inst_i = 'b11000000000000011111011000110000;
	$display ("time %t : Inst FST Rs 0 Value %h Rt 4 Value %h Imm16 1111011000110000 Imm26 11000111100011001010101111", $time, rf_tb[0], rf_tb[4]);
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
	inst_i = 'b11000110110001011100101100010100;
	$display ("time %t : Inst FLD Rs 22 Value %h Rt 9 Value %h Imm16 1100101100010100 Imm26 11000000001110001000111101", $time, rf_tb[22], rf_tb[9]);
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
	inst_i = 'b10010000100100100110100000000000;
	$display ("time %t : Inst FCLASS Rs 4 Value %h Rt 18 Value %h Imm16 0111110111000110 Imm26 00001101001011101001011111", $time, rf_tb[4], rf_tb[18]);
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