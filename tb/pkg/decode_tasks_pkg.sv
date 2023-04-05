// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!
// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.
package decode_tasks_pkg;

task automatic check_LDCR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00001110011001110011001001000111;
	$display ("time %t : Inst LDCR Rs 19 Value %h Rt 18 Value %h Imm16 0011001001000111 Imm26 11000100100101101110100111", $time, rf_tb[19], rf_tb[18]);
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
	inst_i = 'b00100001110011101100001100101110;
	$display ("time %t : Inst ADDI Rs 14 Value %h Rt 4 Value %h Imm16 1100001100101110 Imm26 01110111110101101111000100", $time, rf_tb[14], rf_tb[4]);
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
	inst_i = 'b00100101010110001001100101101000;
	$display ("time %t : Inst SUBI Rs 10 Value %h Rt 14 Value %h Imm16 1001100101101000 Imm26 11100101111100100101111101", $time, rf_tb[10], rf_tb[14]);
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
	inst_i = 'b00101011100010100111110110101010;
	$display ("time %t : Inst XORI Rs 28 Value %h Rt 25 Value %h Imm16 0111110110101010 Imm26 11111000001000000001101001", $time, rf_tb[28], rf_tb[25]);
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
	inst_i = 'b00101101000000010010110000001010;
	$display ("time %t : Inst ANDNI Rs 8 Value %h Rt 26 Value %h Imm16 0010110000001010 Imm26 00000000010101011011001010", $time, rf_tb[8], rf_tb[26]);
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
	inst_i = 'b01010010100111011000100010111000;
	$display ("time %t : Inst ROLI Rs 20 Value %h Rt 16 Value %h Imm16 1000100010111000 Imm26 11011100001011010000100110", $time, rf_tb[20], rf_tb[16]);
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
	inst_i = 'b01010100000000101111000000110000;
	$display ("time %t : Inst SLLI Rs 0 Value %h Rt 13 Value %h Imm16 1111000000110000 Imm26 10000001001101111111001001", $time, rf_tb[0], rf_tb[13]);
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
	inst_i = 'b01011011011011101110110110110000;
	$display ("time %t : Inst RORI Rs 27 Value %h Rt 24 Value %h Imm16 1110110110110000 Imm26 10100100010000110000100001", $time, rf_tb[27], rf_tb[24]);
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
	inst_i = 'b01011100111000111111011001010101;
	$display ("time %t : Inst SRLI Rs 7 Value %h Rt 6 Value %h Imm16 1111011001010101 Imm26 10111011000111000110000001", $time, rf_tb[7], rf_tb[6]);
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
	inst_i = 'b01000001110000010100100010101001;
	$display ("time %t : Inst ST Rs 14 Value %h Rt 9 Value %h Imm16 0100100010101001 Imm26 00111111110010101111000000", $time, rf_tb[14], rf_tb[9]);
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
	inst_i = 'b01000111101010100101100000011101;
	$display ("time %t : Inst LD Rs 29 Value %h Rt 29 Value %h Imm16 0101100000011101 Imm26 01000001011110101101011101", $time, rf_tb[29], rf_tb[29]);
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
	inst_i = 'b01001110101100101110000111111111;
	$display ("time %t : Inst STU Rs 21 Value %h Rt 8 Value %h Imm16 1110000111111111 Imm26 11100100001010110110111101", $time, rf_tb[21], rf_tb[8]);
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
	inst_i = 'b01100110111111001100101011001010;
	$display ("time %t : Inst ANDI Rs 23 Value %h Rt 7 Value %h Imm16 1100101011001010 Imm26 00001000011011010011100101", $time, rf_tb[23], rf_tb[7]);
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
	inst_i = 'b11100111101100000110000010110011;
	$display ("time %t : Inst ORI Rs 29 Value %h Rt 7 Value %h Imm16 0110000010110011 Imm26 00010001011101101011111011", $time, rf_tb[29], rf_tb[7]);
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
	inst_i = 'b01111111011101010101001010111000;
	$display ("time %t : Inst AND Rs 27 Value %h Rt 1 Value %h Imm16 0101001010111000 Imm26 11100111111110110111110010", $time, rf_tb[27], rf_tb[1]);
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
	inst_i = 'b01111101110110110011101010010011;
	$display ("time %t : Inst OR Rs 14 Value %h Rt 15 Value %h Imm16 0011101010010011 Imm26 01111110001110000100100100", $time, rf_tb[14], rf_tb[15]);
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
	inst_i = 'b01101101000011010001000000000000;
	$display ("time %t : Inst ADD Rs 8 Value %h Rt 13 Value %h Imm16 1110110101100000 Imm26 10110101111110110111001110", $time, rf_tb[8], rf_tb[13]);
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
	inst_i = 'b01101110011000111010100000000001;
	$display ("time %t : Inst SUB Rs 19 Value %h Rt 3 Value %h Imm16 1100000100010110 Imm26 01101001010110101000000101", $time, rf_tb[19], rf_tb[3]);
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
	inst_i = 'b01101111001101000000000000000010;
	$display ("time %t : Inst XOR Rs 25 Value %h Rt 20 Value %h Imm16 0011000111010111 Imm26 01001011110110001000110110", $time, rf_tb[25], rf_tb[20]);
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
	inst_i = 'b01101100001100110110000000000011;
	$display ("time %t : Inst ANDN Rs 1 Value %h Rt 19 Value %h Imm16 0010110011011010 Imm26 01000011011100011111011101", $time, rf_tb[1], rf_tb[19]);
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
	inst_i = 'b01101011100100101100100000000000;
	$display ("time %t : Inst ROL Rs 28 Value %h Rt 18 Value %h Imm16 0110111111000011 Imm26 00101001101101000000111110", $time, rf_tb[28], rf_tb[18]);
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
	inst_i = 'b01101010111011010010100000000001;
	$display ("time %t : Inst SLL Rs 23 Value %h Rt 13 Value %h Imm16 0010110101001101 Imm26 00101110010011111111111001", $time, rf_tb[23], rf_tb[13]);
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
	inst_i = 'b01101011010001001011100000000010;
	$display ("time %t : Inst ROR Rs 26 Value %h Rt 4 Value %h Imm16 1001000000101100 Imm26 10111101111110101101101111", $time, rf_tb[26], rf_tb[4]);
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
	inst_i = 'b01101001110101011010100000000011;
	$display ("time %t : Inst SRL Rs 14 Value %h Rt 21 Value %h Imm16 1100011010110101 Imm26 00101100101101010100001100", $time, rf_tb[14], rf_tb[21]);
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
	inst_i = 'b01110010110000110001100000000000;
	$display ("time %t : Inst SEQ Rs 22 Value %h Rt 3 Value %h Imm16 0001010110110011 Imm26 01111101011100101001100100", $time, rf_tb[22], rf_tb[3]);
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
	inst_i = 'b01110110000101010111100000000000;
	$display ("time %t : Inst SLT Rs 16 Value %h Rt 21 Value %h Imm16 0011101101100100 Imm26 01000100000011001101110001", $time, rf_tb[16], rf_tb[21]);
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
	inst_i = 'b01111001011000010101000000000000;
	$display ("time %t : Inst SLE Rs 11 Value %h Rt 1 Value %h Imm16 1000100001111100 Imm26 01000111111101111101111000", $time, rf_tb[11], rf_tb[1]);
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
	inst_i = 'b01110101000110000101000000000000;
	$display ("time %t : Inst SLTU Rs 8 Value %h Rt 24 Value %h Imm16 1111000111101000 Imm26 00001010001000000101110111", $time, rf_tb[8], rf_tb[24]);
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
	inst_i = 'b01111011001101000110000000000000;
	$display ("time %t : Inst SLEU Rs 25 Value %h Rt 20 Value %h Imm16 0111101100111111 Imm26 01100010011101101000101011", $time, rf_tb[25], rf_tb[20]);
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
	inst_i = 'b01100010000011001101011101111111;
	$display ("time %t : Inst LBI Rs 16 Value %h Rt 6 Value %h Imm16 1101011101111111 Imm26 10000111110011110101001000", $time, rf_tb[16], rf_tb[6]);
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
	inst_i = 'b01001010100001001101101000011110;
	$display ("time %t : Inst SLBI Rs 20 Value %h Rt 5 Value %h Imm16 1101101000011110 Imm26 10111101001001100111100100", $time, rf_tb[20], rf_tb[5]);
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
	inst_i = 'b11101100010111010111000000000000;
	$display ("time %t : Inst FADD Rs 2 Value %h Rt 29 Value %h Imm16 1011111100010100 Imm26 01001011001101010101110101", $time, rf_tb[2], rf_tb[29]);
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
	inst_i = 'b11101101111011101000100000000001;
	$display ("time %t : Inst FSUB Rs 15 Value %h Rt 14 Value %h Imm16 0110010000010000 Imm26 00100111011011100101110001", $time, rf_tb[15], rf_tb[14]);
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
	inst_i = 'b11101110011101101110000000000010;
	$display ("time %t : Inst FMUL Rs 19 Value %h Rt 22 Value %h Imm16 0000100100000010 Imm26 10110001011101101011111100", $time, rf_tb[19], rf_tb[22]);
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
	inst_i = 'b11110001001100110000100000000000;
	$display ("time %t : Inst FEQ Rs 9 Value %h Rt 19 Value %h Imm16 1101101001101000 Imm26 10101100000001011110100111", $time, rf_tb[9], rf_tb[19]);
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
	inst_i = 'b11111000010100110011000000000000;
	$display ("time %t : Inst FLE Rs 2 Value %h Rt 19 Value %h Imm16 1001001100110111 Imm26 10101110010011001110001001", $time, rf_tb[2], rf_tb[19]);
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
	inst_i = 'b11111110010100011100100000000000;
	$display ("time %t : Inst FLT Rs 18 Value %h Rt 17 Value %h Imm16 0001110000101000 Imm26 00000011110000011100101100", $time, rf_tb[18], rf_tb[17]);
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
	inst_i = 'b10000101101000001110000000000000;
	$display ("time %t : Inst FCVTI Rs 13 Value %h Rt 0 Value %h Imm16 0010111101010111 Imm26 01000001000001001110001111", $time, rf_tb[13], rf_tb[0]);
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
	inst_i = 'b10000000101101110101100000000000;
	$display ("time %t : Inst ICVTF Rs 5 Value %h Rt 23 Value %h Imm16 1101110000101001 Imm26 01010110011110010001010101", $time, rf_tb[5], rf_tb[23]);
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
	inst_i = 'b10001110010000010010000000000000;
	$display ("time %t : Inst FMOVI Rs 18 Value %h Rt 1 Value %h Imm16 0100101110100110 Imm26 00001110001001010010001001", $time, rf_tb[18], rf_tb[1]);
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
	inst_i = 'b10001010101101001001100000000000;
	$display ("time %t : Inst IMOVF Rs 21 Value %h Rt 20 Value %h Imm16 1010100111010110 Imm26 00000101001001100111110100", $time, rf_tb[21], rf_tb[20]);
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
	inst_i = 'b11000000101100010001000010100110;
	$display ("time %t : Inst FST Rs 5 Value %h Rt 9 Value %h Imm16 0001000010100110 Imm26 10101100100110100101010101", $time, rf_tb[5], rf_tb[9]);
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
	inst_i = 'b11000100010001011001111000110101;
	$display ("time %t : Inst FLD Rs 2 Value %h Rt 3 Value %h Imm16 1001111000110101 Imm26 10100100110101000101110101", $time, rf_tb[2], rf_tb[3]);
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
	inst_i = 'b10010001110001000101100000000000;
	$display ("time %t : Inst FCLASS Rs 14 Value %h Rt 4 Value %h Imm16 0111101011001100 Imm26 10110011001011110101100000", $time, rf_tb[14], rf_tb[4]);
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
	inst_i = 'b11001001011111001010011000011000;
	$display ("time %t : Inst STB Rs 11 Value %h Rt 1 Value %h Imm16 1010011000011000 Imm26 11010100000111010110111111", $time, rf_tb[11], rf_tb[1]);
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
	inst_i = 'b11001100101011010011001010100001;
	$display ("time %t : Inst LDB Rs 5 Value %h Rt 19 Value %h Imm16 0011001010100001 Imm26 01010010111111001011010000", $time, rf_tb[5], rf_tb[19]);
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
	inst_i = 'b11010000110011100010111110011001;
	$display ("time %t : Inst STH Rs 6 Value %h Rt 21 Value %h Imm16 0010111110011001 Imm26 00001010000010110001010000", $time, rf_tb[6], rf_tb[21]);
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
	inst_i = 'b11010100101010011111100101011000;
	$display ("time %t : Inst LDH Rs 5 Value %h Rt 2 Value %h Imm16 1111100101011000 Imm26 00101010110110110100110111", $time, rf_tb[5], rf_tb[2]);
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
	inst_i = 'b10101001001110111100001111010110;
	$display ("time %t : Inst XORSI Rs 9 Value %h Rt 22 Value %h Imm16 1100001111010110 Imm26 00111000000001000111001000", $time, rf_tb[9], rf_tb[22]);
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
	inst_i = 'b11011111001101100100011010001110;
	$display ("time %t : Inst SRAI Rs 25 Value %h Rt 13 Value %h Imm16 0100011010001110 Imm26 10010001000010110001011001", $time, rf_tb[25], rf_tb[13]);
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
	inst_i = 'b11101010111010111101100000000000;
	$display ("time %t : Inst SRA Rs 23 Value %h Rt 11 Value %h Imm16 1110001001000101 Imm26 01011001111011011011000101", $time, rf_tb[23], rf_tb[11]);
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