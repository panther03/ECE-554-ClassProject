// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!
// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.
package decode_tasks_pkg;

task automatic check_LDCR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00001110001111011011000110101010;
	$display ("time %t : Inst LDCR Rs 17 Value %h Rt 4 Value %h Imm16 1011000110101010 Imm26 11101111101100101011001101", $time, rf_tb[17], rf_tb[4]);
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
	inst_i = 'b00100011010010010011100010101011;
	$display ("time %t : Inst ADDI Rs 26 Value %h Rt 28 Value %h Imm16 0011100010101011 Imm26 11011111110001101011100010", $time, rf_tb[26], rf_tb[28]);
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
	inst_i = 'b00100100001101110000101110110011;
	$display ("time %t : Inst SUBI Rs 1 Value %h Rt 10 Value %h Imm16 0000101110110011 Imm26 00100011010100111100101000", $time, rf_tb[1], rf_tb[10]);
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
	inst_i = 'b00101000100101110101101111100010;
	$display ("time %t : Inst XORI Rs 4 Value %h Rt 19 Value %h Imm16 0101101111100010 Imm26 00101010100111101000100001", $time, rf_tb[4], rf_tb[19]);
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
	inst_i = 'b00101100010100001110101100110010;
	$display ("time %t : Inst ANDNI Rs 2 Value %h Rt 18 Value %h Imm16 1110101100110010 Imm26 00000000100100001111110111", $time, rf_tb[2], rf_tb[18]);
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
	inst_i = 'b01010001010010001010001010111000;
	$display ("time %t : Inst ROLI Rs 10 Value %h Rt 5 Value %h Imm16 1010001010111000 Imm26 10010101010011010010100100", $time, rf_tb[10], rf_tb[5]);
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
	inst_i = 'b01010110011110100011001001111010;
	$display ("time %t : Inst SLLI Rs 19 Value %h Rt 16 Value %h Imm16 0011001001111010 Imm26 00100100100011100010010100", $time, rf_tb[19], rf_tb[16]);
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
	inst_i = 'b01011011001010111111110101101010;
	$display ("time %t : Inst RORI Rs 25 Value %h Rt 3 Value %h Imm16 1111110101101010 Imm26 00111101001110000100011101", $time, rf_tb[25], rf_tb[3]);
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
	inst_i = 'b01011100010000001001101110010110;
	$display ("time %t : Inst SRLI Rs 2 Value %h Rt 8 Value %h Imm16 1001101110010110 Imm26 10100110111010000001100000", $time, rf_tb[2], rf_tb[8]);
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
	inst_i = 'b01000011101110001001100101000011;
	$display ("time %t : Inst ST Rs 29 Value %h Rt 2 Value %h Imm16 1001100101000011 Imm26 11001001000101011100001001", $time, rf_tb[29], rf_tb[2]);
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
	inst_i = 'b01000111101011001001110011111000;
	$display ("time %t : Inst LD Rs 29 Value %h Rt 3 Value %h Imm16 1001110011111000 Imm26 11110001011000100101101001", $time, rf_tb[29], rf_tb[3]);
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
	inst_i = 'b01001111100110100101000111001100;
	$display ("time %t : Inst STU Rs 28 Value %h Rt 24 Value %h Imm16 0101000111001100 Imm26 10010010111001001100001000", $time, rf_tb[28], rf_tb[24]);
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
	inst_i = 'b01100101101110000110111100010111;
	$display ("time %t : Inst ANDI Rs 13 Value %h Rt 8 Value %h Imm16 0110111100010111 Imm26 00000000010000100011001010", $time, rf_tb[13], rf_tb[8]);
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
	inst_i = 'b11100101000001001010110110110011;
	$display ("time %t : Inst ORI Rs 8 Value %h Rt 16 Value %h Imm16 1010110110110011 Imm26 01110010000000011101001000", $time, rf_tb[8], rf_tb[16]);
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
	inst_i = 'b01111100100111011011010010011101;
	$display ("time %t : Inst AND Rs 4 Value %h Rt 13 Value %h Imm16 1011010010011101 Imm26 00011011011000101010011110", $time, rf_tb[4], rf_tb[13]);
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
	inst_i = 'b01111111101001101000110110110000;
	$display ("time %t : Inst OR Rs 29 Value %h Rt 5 Value %h Imm16 1000110110110000 Imm26 00111010110011100100011011", $time, rf_tb[29], rf_tb[5]);
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
	inst_i = 'b01101101011001101000100000000000;
	$display ("time %t : Inst ADD Rs 11 Value %h Rt 6 Value %h Imm16 0000011101100000 Imm26 10111100111000001111111100", $time, rf_tb[11], rf_tb[6]);
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
	inst_i = 'b01101110100100111010100000000001;
	$display ("time %t : Inst SUB Rs 20 Value %h Rt 19 Value %h Imm16 1000001000110001 Imm26 00100100000110010111101111", $time, rf_tb[20], rf_tb[19]);
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
	inst_i = 'b01101111100110011100000000000010;
	$display ("time %t : Inst XOR Rs 28 Value %h Rt 25 Value %h Imm16 1101000110010110 Imm26 00111001110110101001010000", $time, rf_tb[28], rf_tb[25]);
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
	inst_i = 'b01101110001100111110100000000011;
	$display ("time %t : Inst ANDN Rs 17 Value %h Rt 19 Value %h Imm16 0000010001001010 Imm26 01100011111010100000100001", $time, rf_tb[17], rf_tb[19]);
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
	inst_i = 'b01101011001110111011000000000000;
	$display ("time %t : Inst ROL Rs 25 Value %h Rt 27 Value %h Imm16 0010001100000011 Imm26 11101101111011100000110100", $time, rf_tb[25], rf_tb[27]);
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
	inst_i = 'b01101010100100000101100000000001;
	$display ("time %t : Inst SLL Rs 20 Value %h Rt 16 Value %h Imm16 1010010101000001 Imm26 11010000010111110001100100", $time, rf_tb[20], rf_tb[16]);
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
	inst_i = 'b01101001101101100011100000000010;
	$display ("time %t : Inst ROR Rs 13 Value %h Rt 22 Value %h Imm16 1000000101010111 Imm26 01010100000111111001100100", $time, rf_tb[13], rf_tb[22]);
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
	inst_i = 'b01101011011001010101100000000011;
	$display ("time %t : Inst SRL Rs 27 Value %h Rt 5 Value %h Imm16 1010110110111010 Imm26 10101001011011010011000101", $time, rf_tb[27], rf_tb[5]);
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
	inst_i = 'b01110000101101101010000000000000;
	$display ("time %t : Inst SEQ Rs 5 Value %h Rt 22 Value %h Imm16 1010001000000010 Imm26 01100000100000010101010111", $time, rf_tb[5], rf_tb[22]);
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
	inst_i = 'b01110100001110000111000000000000;
	$display ("time %t : Inst SLT Rs 1 Value %h Rt 24 Value %h Imm16 0100011101101000 Imm26 01100011001010100101101111", $time, rf_tb[1], rf_tb[24]);
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
	inst_i = 'b01111010001010110101100000000000;
	$display ("time %t : Inst SLE Rs 17 Value %h Rt 11 Value %h Imm16 0101100001001111 Imm26 00000110000000010011001000", $time, rf_tb[17], rf_tb[11]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_USLT (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01110111000000110110000000000000;
	$display ("time %t : Inst USLT Rs 24 Value %h Rt 3 Value %h Imm16 1100001010111000 Imm26 01111100010011000000010010", $time, rf_tb[24], rf_tb[3]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
endtask

task automatic check_USLE (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111011100010011000000000000000;
	$display ("time %t : Inst USLE Rs 28 Value %h Rt 9 Value %h Imm16 1000101011110001 Imm26 11100111010011010101000100", $time, rf_tb[28], rf_tb[9]);
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
	inst_i = 'b01100001000001001111010010111110;
	$display ("time %t : Inst LBI Rs 8 Value %h Rt 13 Value %h Imm16 1111010010111110 Imm26 01101000011101010011110010", $time, rf_tb[8], rf_tb[13]);
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
	inst_i = 'b01001000011010110111011000100011;
	$display ("time %t : Inst SLBI Rs 3 Value %h Rt 5 Value %h Imm16 0111011000100011 Imm26 11101101001111101010111100", $time, rf_tb[3], rf_tb[5]);
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
	inst_i = 'b11101100111010110101100000000000;
	$display ("time %t : Inst FADD Rs 7 Value %h Rt 11 Value %h Imm16 0000011100101111 Imm26 00101100111001101001000100", $time, rf_tb[7], rf_tb[11]);
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
	inst_i = 'b11101111001001011001000000000001;
	$display ("time %t : Inst FSUB Rs 25 Value %h Rt 5 Value %h Imm16 1001111001111000 Imm26 01000001101110100101010010", $time, rf_tb[25], rf_tb[5]);
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
	inst_i = 'b11101101111100000100000000000010;
	$display ("time %t : Inst FMUL Rs 15 Value %h Rt 16 Value %h Imm16 0111001101111101 Imm26 00011001111010011110111001", $time, rf_tb[15], rf_tb[16]);
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
	inst_i = 'b11110011001110101010000000000000;
	$display ("time %t : Inst FEQ Rs 25 Value %h Rt 26 Value %h Imm16 0001010000010010 Imm26 00110010111001101000100100", $time, rf_tb[25], rf_tb[26]);
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
	inst_i = 'b11111001011001111001000000000000;
	$display ("time %t : Inst FLE Rs 11 Value %h Rt 7 Value %h Imm16 1101100101111101 Imm26 00101000010000110011100010", $time, rf_tb[11], rf_tb[7]);
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
	inst_i = 'b11111101000010001110000000000000;
	$display ("time %t : Inst FLT Rs 8 Value %h Rt 8 Value %h Imm16 0000001110101111 Imm26 10111101001000000100111001", $time, rf_tb[8], rf_tb[8]);
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
	inst_i = 'b10000100011011000011100000000000;
	$display ("time %t : Inst FCVTI Rs 3 Value %h Rt 12 Value %h Imm16 0110001110100111 Imm26 10011010110011000110011111", $time, rf_tb[3], rf_tb[12]);
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
	inst_i = 'b10000001101100001011000000000000;
	$display ("time %t : Inst ICVTF Rs 13 Value %h Rt 16 Value %h Imm16 0101100100010101 Imm26 11011011001001101111010001", $time, rf_tb[13], rf_tb[16]);
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
	inst_i = 'b10001100101111001010100000000000;
	$display ("time %t : Inst FMOVI Rs 5 Value %h Rt 28 Value %h Imm16 1111011110001010 Imm26 10001100010111010111001101", $time, rf_tb[5], rf_tb[28]);
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
	inst_i = 'b10001000011101001011100000000000;
	$display ("time %t : Inst IMOVF Rs 3 Value %h Rt 20 Value %h Imm16 1101101010001100 Imm26 10101101110010010010001000", $time, rf_tb[3], rf_tb[20]);
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
	inst_i = 'b11000001111011111111010110000101;
	$display ("time %t : Inst FST Rs 15 Value %h Rt 21 Value %h Imm16 1111010110000101 Imm26 11001000111111110011111100", $time, rf_tb[15], rf_tb[21]);
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
	inst_i = 'b11000110000100000000101010011111;
	$display ("time %t : Inst FLD Rs 16 Value %h Rt 15 Value %h Imm16 0000101010011111 Imm26 11101010000010000001001010", $time, rf_tb[16], rf_tb[15]);
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
	inst_i = 'b10010010010001100011000000000000;
	$display ("time %t : Inst FCLASS Rs 18 Value %h Rt 6 Value %h Imm16 1100000010010001 Imm26 01000101100000110101011001", $time, rf_tb[18], rf_tb[6]);
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
	inst_i = 'b11001000010111001000010000001100;
	$display ("time %t : Inst STB Rs 2 Value %h Rt 1 Value %h Imm16 1000010000001100 Imm26 11110000101011110101100011", $time, rf_tb[2], rf_tb[1]);
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
	inst_i = 'b11001111001111011110001111110000;
	$display ("time %t : Inst LDB Rs 25 Value %h Rt 19 Value %h Imm16 1110001111110000 Imm26 01001010101011001101011100", $time, rf_tb[25], rf_tb[19]);
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
	inst_i = 'b11010011001111010011001111101010;
	$display ("time %t : Inst STH Rs 25 Value %h Rt 15 Value %h Imm16 0011001111101010 Imm26 10001011111111001011001101", $time, rf_tb[25], rf_tb[15]);
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
	inst_i = 'b11010100110001110010011011101111;
	$display ("time %t : Inst LDH Rs 6 Value %h Rt 1 Value %h Imm16 0010011011101111 Imm26 00001111110010110011101010", $time, rf_tb[6], rf_tb[1]);
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
	inst_i = 'b10101001101010001110100110000101;
	$display ("time %t : Inst XORSI Rs 13 Value %h Rt 15 Value %h Imm16 1110100110000101 Imm26 11000011001101011001111010", $time, rf_tb[13], rf_tb[15]);
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
	inst_i = 'b11011111001011100000010000110100;
	$display ("time %t : Inst SRAI Rs 25 Value %h Rt 8 Value %h Imm16 0000010000110100 Imm26 10101100000001010101010001", $time, rf_tb[25], rf_tb[8]);
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
	inst_i = 'b11101000011101000111100000000000;
	$display ("time %t : Inst SRA Rs 3 Value %h Rt 20 Value %h Imm16 1011100001110010 Imm26 11010011011101000010111000", $time, rf_tb[3], rf_tb[20]);
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
	check_USLT(clk, inst_i, rf_tb);
	check_USLE(clk, inst_i, rf_tb);
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