// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!
// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.
package decode_tasks_pkg;

task automatic check_LDCR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00001101110011000011110010000101;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst LDCR Rs 14 Value %h Rt 17 Value %h Rd 12 Value %h Imm16 0011110010000101 Imm26 01000001110001100011010101", $time, rf_tb[14], rf_tb[17], rf_tb[12]);
	@ (posedge clk);
endtask

task automatic check_ADDI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00100000001110101000100111110001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ADDI Rs 1 Value %h Rt 21 Value %h Rd 26 Value %h Imm16 1000100111110001 Imm26 11001001111001011010100010", $time, rf_tb[1], rf_tb[21], rf_tb[26]);
	@ (posedge clk);
endtask

task automatic check_SUBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00100100110011000000010011001101;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SUBI Rs 6 Value %h Rt 22 Value %h Rd 12 Value %h Imm16 0000010011001101 Imm26 10110010011100110110001010", $time, rf_tb[6], rf_tb[22], rf_tb[12]);
	@ (posedge clk);
endtask

task automatic check_XORI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00101010111101011111001011111010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst XORI Rs 23 Value %h Rt 16 Value %h Rd 21 Value %h Imm16 1111001011111010 Imm26 10010111000000101000010110", $time, rf_tb[23], rf_tb[16], rf_tb[21]);
	@ (posedge clk);
endtask

task automatic check_ANDNI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00101100111000110001000101010100;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ANDNI Rs 7 Value %h Rt 9 Value %h Rd 3 Value %h Imm16 0001000101010100 Imm26 10011000100001111101001101", $time, rf_tb[7], rf_tb[9], rf_tb[3]);
	@ (posedge clk);
endtask

task automatic check_ROLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01010010000110101110001000111101;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ROLI Rs 16 Value %h Rt 11 Value %h Rd 26 Value %h Imm16 1110001000111101 Imm26 10010010101010001111110110", $time, rf_tb[16], rf_tb[11], rf_tb[26]);
	@ (posedge clk);
endtask

task automatic check_SLLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01010100100010010111010010100000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLLI Rs 4 Value %h Rt 5 Value %h Rd 9 Value %h Imm16 0111010010100000 Imm26 00101100101000111110010110", $time, rf_tb[4], rf_tb[5], rf_tb[9]);
	@ (posedge clk);
endtask

task automatic check_RORI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01011011010010000110100100010101;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst RORI Rs 26 Value %h Rt 20 Value %h Rd 8 Value %h Imm16 0110100100010101 Imm26 10010011011011101101101101", $time, rf_tb[26], rf_tb[20], rf_tb[8]);
	@ (posedge clk);
endtask

task automatic check_SRLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01011110011001001100000110001000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SRLI Rs 19 Value %h Rt 7 Value %h Rd 4 Value %h Imm16 1100000110001000 Imm26 00000001110000010100010101", $time, rf_tb[19], rf_tb[7], rf_tb[4]);
	@ (posedge clk);
endtask

task automatic check_ST (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01000001000111000010000110111110;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ST Rs 8 Value %h Rt 9 Value %h Rd 28 Value %h Imm16 0010000110111110 Imm26 01101110110110010010011001", $time, rf_tb[8], rf_tb[9], rf_tb[28]);
	@ (posedge clk);
endtask

task automatic check_LD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01000110100110111010001000010011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst LD Rs 20 Value %h Rt 26 Value %h Rd 27 Value %h Imm16 1010001000010011 Imm26 11100001011011111001111110", $time, rf_tb[20], rf_tb[26], rf_tb[27]);
	@ (posedge clk);
endtask

task automatic check_STU (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01001110010101001111111011100011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst STU Rs 18 Value %h Rt 19 Value %h Rd 20 Value %h Imm16 1111111011100011 Imm26 01000001011100110111110011", $time, rf_tb[18], rf_tb[19], rf_tb[20]);
	@ (posedge clk);
endtask

task automatic check_BTR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01100101111110111000000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst BTR Rs 15 Value %h Rt 27 Value %h Rd 16 Value %h Imm16 1001001011100111 Imm26 01111100101100101110110000", $time, rf_tb[15], rf_tb[27], rf_tb[16]);
	@ (posedge clk);
endtask

task automatic check_ADD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101101100110110001100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ADD Rs 12 Value %h Rt 27 Value %h Rd 3 Value %h Imm16 0101111110001001 Imm26 00111000111001111011101010", $time, rf_tb[12], rf_tb[27], rf_tb[3]);
	@ (posedge clk);
endtask

task automatic check_SUB (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101111000110100110100000000001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SUB Rs 24 Value %h Rt 26 Value %h Rd 13 Value %h Imm16 0101101100010001 Imm26 11111111000110011010000100", $time, rf_tb[24], rf_tb[26], rf_tb[13]);
	@ (posedge clk);
endtask

task automatic check_XOR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101111011001111001000000000010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst XOR Rs 27 Value %h Rt 7 Value %h Rd 18 Value %h Imm16 1001101001101011 Imm26 10001011001001000100010100", $time, rf_tb[27], rf_tb[7], rf_tb[18]);
	@ (posedge clk);
endtask

task automatic check_ANDN (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101100000010010101000000000011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ANDN Rs 0 Value %h Rt 9 Value %h Rd 10 Value %h Imm16 1100000111111100 Imm26 00001101010110011111101100", $time, rf_tb[0], rf_tb[9], rf_tb[10]);
	@ (posedge clk);
endtask

task automatic check_ROL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101000011011100010100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ROL Rs 3 Value %h Rt 14 Value %h Rd 5 Value %h Imm16 1001101001101010 Imm26 11111011110111100110001110", $time, rf_tb[3], rf_tb[14], rf_tb[5]);
	@ (posedge clk);
endtask

task automatic check_SLL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101000101100111001100000000001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLL Rs 5 Value %h Rt 19 Value %h Rd 19 Value %h Imm16 0100010010101100 Imm26 10010001110000111111011100", $time, rf_tb[5], rf_tb[19], rf_tb[19]);
	@ (posedge clk);
endtask

task automatic check_ROR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101011100101110111000000000010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ROR Rs 28 Value %h Rt 23 Value %h Rd 14 Value %h Imm16 1100011111000010 Imm26 10011010001001111110010001", $time, rf_tb[28], rf_tb[23], rf_tb[14]);
	@ (posedge clk);
endtask

task automatic check_SRL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101010110000011101000000000011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SRL Rs 22 Value %h Rt 1 Value %h Rd 26 Value %h Imm16 0010111001010011 Imm26 10001000110111101000111000", $time, rf_tb[22], rf_tb[1], rf_tb[26]);
	@ (posedge clk);
endtask

task automatic check_SEQ (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01110001111100100111000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SEQ Rs 15 Value %h Rt 18 Value %h Rd 14 Value %h Imm16 0000110010100100 Imm26 01011000011011100001001110", $time, rf_tb[15], rf_tb[18], rf_tb[14]);
	@ (posedge clk);
endtask

task automatic check_SLT (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01110101000001010100100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLT Rs 8 Value %h Rt 5 Value %h Rd 9 Value %h Imm16 1011101111010111 Imm26 11011001001001000010101110", $time, rf_tb[8], rf_tb[5], rf_tb[9]);
	@ (posedge clk);
endtask

task automatic check_SLE (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111011001100101000100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLE Rs 25 Value %h Rt 18 Value %h Rd 17 Value %h Imm16 1101111000000101 Imm26 01011001111011100001111011", $time, rf_tb[25], rf_tb[18], rf_tb[17]);
	@ (posedge clk);
endtask

task automatic check_SCO (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111101011010010000000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SCO Rs 11 Value %h Rt 9 Value %h Rd 0 Value %h Imm16 0110110000110110 Imm26 01100101101111000101001110", $time, rf_tb[11], rf_tb[9], rf_tb[0]);
	@ (posedge clk);
endtask

task automatic check_LBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01100010101000110111000001100100;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst LBI Rs 21 Value %h Rt 18 Value %h Rd 3 Value %h Imm16 0111000001100100 Imm26 01100111111110001101111100", $time, rf_tb[21], rf_tb[18], rf_tb[3]);
	@ (posedge clk);
endtask

task automatic check_SLBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01001010011011000110011101110001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLBI Rs 19 Value %h Rt 11 Value %h Rd 12 Value %h Imm16 0110011101110001 Imm26 11100101111101110010111101", $time, rf_tb[19], rf_tb[11], rf_tb[12]);
	@ (posedge clk);
endtask

task automatic check_FADD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101110100010111000100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FADD Rs 20 Value %h Rt 11 Value %h Rd 17 Value %h Imm16 0010011111111010 Imm26 00110110101110010001001100", $time, rf_tb[20], rf_tb[11], rf_tb[17]);
	@ (posedge clk);
endtask

task automatic check_FSUB (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101100110010100110100000000001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FSUB Rs 6 Value %h Rt 10 Value %h Rd 13 Value %h Imm16 1011111110100000 Imm26 11001110110110011111100100", $time, rf_tb[6], rf_tb[10], rf_tb[13]);
	@ (posedge clk);
endtask

task automatic check_FMUL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101111001001010100000000000010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FMUL Rs 25 Value %h Rt 5 Value %h Rd 8 Value %h Imm16 1101000011010110 Imm26 01101000101001100011100000", $time, rf_tb[25], rf_tb[5], rf_tb[8]);
	@ (posedge clk);
endtask

task automatic check_FDIV (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101100111011111001100000000011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FDIV Rs 7 Value %h Rt 15 Value %h Rd 19 Value %h Imm16 1000011100010001 Imm26 00010100111101100000110110", $time, rf_tb[7], rf_tb[15], rf_tb[19]);
	@ (posedge clk);
endtask

task automatic check_FEQ (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11110001111001000011000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FEQ Rs 15 Value %h Rt 4 Value %h Rd 6 Value %h Imm16 0001100111101111 Imm26 00100001101110100001100110", $time, rf_tb[15], rf_tb[4], rf_tb[6]);
	@ (posedge clk);
endtask

task automatic check_FLE (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11111000110000000100100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FLE Rs 6 Value %h Rt 0 Value %h Rd 9 Value %h Imm16 1110101101101000 Imm26 00100001101100011110110000", $time, rf_tb[6], rf_tb[0], rf_tb[9]);
	@ (posedge clk);
endtask

task automatic check_FLT (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11111111100000011100100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FLT Rs 28 Value %h Rt 1 Value %h Rd 25 Value %h Imm16 1000100010101010 Imm26 00001000010101100001010100", $time, rf_tb[28], rf_tb[1], rf_tb[25]);
	@ (posedge clk);
endtask

task automatic check_FCVTI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10000110100001001010000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FCVTI Rs 20 Value %h Rt 4 Value %h Rd 20 Value %h Imm16 1110110000101100 Imm26 10100100000010000000110100", $time, rf_tb[20], rf_tb[4], rf_tb[20]);
	@ (posedge clk);
endtask

task automatic check_ICVTF (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10000011101111010111000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ICVTF Rs 29 Value %h Rt 29 Value %h Rd 14 Value %h Imm16 1000100001010010 Imm26 10100010011101110110000011", $time, rf_tb[29], rf_tb[29], rf_tb[14]);
	@ (posedge clk);
endtask

task automatic check_FMOVI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10001101010000001100000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FMOVI Rs 10 Value %h Rt 0 Value %h Rd 24 Value %h Imm16 0010110111110110 Imm26 11011110111100110001101100", $time, rf_tb[10], rf_tb[0], rf_tb[24]);
	@ (posedge clk);
endtask

task automatic check_IMOVF (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10001000011110111001000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst IMOVF Rs 3 Value %h Rt 27 Value %h Rd 18 Value %h Imm16 1011100101000101 Imm26 01010010101010010010100000", $time, rf_tb[3], rf_tb[27], rf_tb[18]);
	@ (posedge clk);
endtask

task automatic check_FST (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11000010001100111000010010000001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FST Rs 17 Value %h Rt 16 Value %h Rd 19 Value %h Imm16 1000010010000001 Imm26 00001101001000100111000100", $time, rf_tb[17], rf_tb[16], rf_tb[19]);
	@ (posedge clk);
endtask

task automatic check_FLD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11000100111111010110110001110110;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FLD Rs 7 Value %h Rt 9 Value %h Rd 29 Value %h Imm16 0110110001110110 Imm26 10111000010011100100100000", $time, rf_tb[7], rf_tb[9], rf_tb[29]);
	@ (posedge clk);
endtask

task automatic check_FCLASS (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10010000000100100110000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FCLASS Rs 0 Value %h Rt 18 Value %h Rd 12 Value %h Imm16 0110001000101101 Imm26 11010000010000111100100010", $time, rf_tb[0], rf_tb[18], rf_tb[12]);
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