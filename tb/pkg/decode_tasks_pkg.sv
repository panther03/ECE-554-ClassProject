// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!
// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.
package decode_tasks_pkg;

task automatic check_LDCR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00001101010001010000110000101100;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst LDCR Rs 10 Value %h Rt 14 Value %h Rd 5 Value %h Imm16 0000110000101100 Imm26 11110001100010010001110011", $time, rf_tb[10], rf_tb[14], rf_tb[5]);
	@ (posedge clk);
endtask

task automatic check_ADDI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00100000001101100111001000110000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ADDI Rs 1 Value %h Rt 17 Value %h Rd 22 Value %h Imm16 0111001000110000 Imm26 10100011110110010011001000", $time, rf_tb[1], rf_tb[17], rf_tb[22]);
	@ (posedge clk);
endtask

task automatic check_SUBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00100110110101011101100110001000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SUBI Rs 22 Value %h Rt 6 Value %h Rd 21 Value %h Imm16 1101100110001000 Imm26 10110100001110001001010110", $time, rf_tb[22], rf_tb[6], rf_tb[21]);
	@ (posedge clk);
endtask

task automatic check_XORI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00101001111111000111000101110010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst XORI Rs 15 Value %h Rt 26 Value %h Rd 28 Value %h Imm16 0111000101110010 Imm26 00110100001001011000110011", $time, rf_tb[15], rf_tb[26], rf_tb[28]);
	@ (posedge clk);
endtask

task automatic check_ANDNI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00101101101001010011110101111101;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ANDNI Rs 13 Value %h Rt 2 Value %h Rd 5 Value %h Imm16 0011110101111101 Imm26 01010101001011011100000011", $time, rf_tb[13], rf_tb[2], rf_tb[5]);
	@ (posedge clk);
endtask

task automatic check_ROLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01010010011110000000100111101001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ROLI Rs 19 Value %h Rt 9 Value %h Rd 24 Value %h Imm16 0000100111101001 Imm26 11011010001100010001100101", $time, rf_tb[19], rf_tb[9], rf_tb[24]);
	@ (posedge clk);
endtask

task automatic check_SLLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01010100010100000100100110000100;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLLI Rs 2 Value %h Rt 5 Value %h Rd 16 Value %h Imm16 0100100110000100 Imm26 11100011111101001111110001", $time, rf_tb[2], rf_tb[5], rf_tb[16]);
	@ (posedge clk);
endtask

task automatic check_RORI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01011000111110110101110100100111;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst RORI Rs 7 Value %h Rt 27 Value %h Rd 27 Value %h Imm16 0101110100100111 Imm26 00011101100110000011011000", $time, rf_tb[7], rf_tb[27], rf_tb[27]);
	@ (posedge clk);
endtask

task automatic check_SRLI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01011111001110011101001011100111;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SRLI Rs 25 Value %h Rt 0 Value %h Rd 25 Value %h Imm16 1101001011100111 Imm26 01100010000000101111010110", $time, rf_tb[25], rf_tb[0], rf_tb[25]);
	@ (posedge clk);
endtask

task automatic check_ST (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01000001010001001100001011111010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ST Rs 10 Value %h Rt 18 Value %h Rd 4 Value %h Imm16 1100001011111010 Imm26 10000111000010001111011010", $time, rf_tb[10], rf_tb[18], rf_tb[4]);
	@ (posedge clk);
endtask

task automatic check_LD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01000101001010111110101100000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst LD Rs 9 Value %h Rt 29 Value %h Rd 11 Value %h Imm16 1110101100000000 Imm26 00001000111001110111111101", $time, rf_tb[9], rf_tb[29], rf_tb[11]);
	@ (posedge clk);
endtask

task automatic check_STU (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01001110001001110010010001001101;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst STU Rs 17 Value %h Rt 9 Value %h Rd 7 Value %h Imm16 0010010001001101 Imm26 10000001000110000000111010", $time, rf_tb[17], rf_tb[9], rf_tb[7]);
	@ (posedge clk);
endtask

task automatic check_BTR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01100101011101011001000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst BTR Rs 11 Value %h Rt 21 Value %h Rd 18 Value %h Imm16 0000101111111001 Imm26 11001000101110101001010001", $time, rf_tb[11], rf_tb[21], rf_tb[18]);
	@ (posedge clk);
endtask

task automatic check_ADD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101110111000111011100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ADD Rs 23 Value %h Rt 3 Value %h Rd 23 Value %h Imm16 0111100111101100 Imm26 01101001000001010010101100", $time, rf_tb[23], rf_tb[3], rf_tb[23]);
	@ (posedge clk);
endtask

task automatic check_SUB (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101111001101010100000000000001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SUB Rs 25 Value %h Rt 21 Value %h Rd 8 Value %h Imm16 0011001001000111 Imm26 00101000000101000010000101", $time, rf_tb[25], rf_tb[21], rf_tb[8]);
	@ (posedge clk);
endtask

task automatic check_XOR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101101001101110100100000000010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst XOR Rs 9 Value %h Rt 23 Value %h Rd 9 Value %h Imm16 1011010011010101 Imm26 11000000010001011010111100", $time, rf_tb[9], rf_tb[23], rf_tb[9]);
	@ (posedge clk);
endtask

task automatic check_ANDN (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101110110101011011100000000011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ANDN Rs 22 Value %h Rt 21 Value %h Rd 23 Value %h Imm16 1010000010101001 Imm26 11110011111110110011010111", $time, rf_tb[22], rf_tb[21], rf_tb[23]);
	@ (posedge clk);
endtask

task automatic check_ROL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101001100000110101100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ROL Rs 12 Value %h Rt 3 Value %h Rd 11 Value %h Imm16 0111110011000000 Imm26 10001001000000111010011010", $time, rf_tb[12], rf_tb[3], rf_tb[11]);
	@ (posedge clk);
endtask

task automatic check_SLL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101010000011110000100000000001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLL Rs 16 Value %h Rt 15 Value %h Rd 1 Value %h Imm16 0100001111101001 Imm26 10110110010001100111001101", $time, rf_tb[16], rf_tb[15], rf_tb[1]);
	@ (posedge clk);
endtask

task automatic check_ROR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101011100010100001000000000010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ROR Rs 28 Value %h Rt 10 Value %h Rd 2 Value %h Imm16 0011100011000010 Imm26 10110110001101011001001010", $time, rf_tb[28], rf_tb[10], rf_tb[2]);
	@ (posedge clk);
endtask

task automatic check_SRL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01101001100101001110100000000011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SRL Rs 12 Value %h Rt 20 Value %h Rd 29 Value %h Imm16 0000011000111000 Imm26 11001011111011111001111000", $time, rf_tb[12], rf_tb[20], rf_tb[29]);
	@ (posedge clk);
endtask

task automatic check_SEQ (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01110000000110100100100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SEQ Rs 0 Value %h Rt 26 Value %h Rd 9 Value %h Imm16 1011011011010000 Imm26 11011011100001010000101010", $time, rf_tb[0], rf_tb[26], rf_tb[9]);
	@ (posedge clk);
endtask

task automatic check_SLT (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01110111011101000101000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLT Rs 27 Value %h Rt 20 Value %h Rd 10 Value %h Imm16 1110110000111111 Imm26 01101101111010110010101001", $time, rf_tb[27], rf_tb[20], rf_tb[10]);
	@ (posedge clk);
endtask

task automatic check_SLE (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111010010100001100100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLE Rs 18 Value %h Rt 16 Value %h Rd 25 Value %h Imm16 0101100010001010 Imm26 01111000000000010101111101", $time, rf_tb[18], rf_tb[16], rf_tb[25]);
	@ (posedge clk);
endtask

task automatic check_SCO (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01111111100010100111000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SCO Rs 28 Value %h Rt 10 Value %h Rd 14 Value %h Imm16 1101111000110000 Imm26 00101000010011001111001011", $time, rf_tb[28], rf_tb[10], rf_tb[14]);
	@ (posedge clk);
endtask

task automatic check_LBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01100010101100001011000011110101;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst LBI Rs 21 Value %h Rt 21 Value %h Rd 16 Value %h Imm16 1011000011110101 Imm26 01010110011000111010011110", $time, rf_tb[21], rf_tb[21], rf_tb[16]);
	@ (posedge clk);
endtask

task automatic check_SLBI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b01001010011001111000101101000100;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst SLBI Rs 19 Value %h Rt 21 Value %h Rd 7 Value %h Imm16 1000101101000100 Imm26 11010011011001101110101101", $time, rf_tb[19], rf_tb[21], rf_tb[7]);
	@ (posedge clk);
endtask

task automatic check_FADD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101101110011011110100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FADD Rs 14 Value %h Rt 13 Value %h Rd 29 Value %h Imm16 0001001110111110 Imm26 01111001101101101100100010", $time, rf_tb[14], rf_tb[13], rf_tb[29]);
	@ (posedge clk);
endtask

task automatic check_FSUB (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101110110110001001100000000001;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FSUB Rs 22 Value %h Rt 24 Value %h Rd 19 Value %h Imm16 0010100111011110 Imm26 10110111101101000011000110", $time, rf_tb[22], rf_tb[24], rf_tb[19]);
	@ (posedge clk);
endtask

task automatic check_FMUL (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101110111101100101000000000010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FMUL Rs 23 Value %h Rt 22 Value %h Rd 10 Value %h Imm16 1010000011110101 Imm26 11001000001010110001100100", $time, rf_tb[23], rf_tb[22], rf_tb[10]);
	@ (posedge clk);
endtask

task automatic check_FDIV (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11101110101110100000000000000011;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FDIV Rs 21 Value %h Rt 26 Value %h Rd 0 Value %h Imm16 1101011101110010 Imm26 01000001011100000011110011", $time, rf_tb[21], rf_tb[26], rf_tb[0]);
	@ (posedge clk);
endtask

task automatic check_FEQ (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11110000011011010000000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FEQ Rs 3 Value %h Rt 13 Value %h Rd 0 Value %h Imm16 1110010011101111 Imm26 10011101111010001001000000", $time, rf_tb[3], rf_tb[13], rf_tb[0]);
	@ (posedge clk);
endtask

task automatic check_FLE (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11111000101110000001100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FLE Rs 5 Value %h Rt 24 Value %h Rd 3 Value %h Imm16 1001010011110001 Imm26 01001001101100001101011110", $time, rf_tb[5], rf_tb[24], rf_tb[3]);
	@ (posedge clk);
endtask

task automatic check_FLT (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11111110000101101001100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FLT Rs 16 Value %h Rt 22 Value %h Rd 19 Value %h Imm16 0011000110010000 Imm26 00101100010111000111000010", $time, rf_tb[16], rf_tb[22], rf_tb[19]);
	@ (posedge clk);
endtask

task automatic check_FCVTI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10000110000101011110100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FCVTI Rs 16 Value %h Rt 21 Value %h Rd 29 Value %h Imm16 0011100110100110 Imm26 01010111101110110010110010", $time, rf_tb[16], rf_tb[21], rf_tb[29]);
	@ (posedge clk);
endtask

task automatic check_ICVTF (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10000001000101001001100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst ICVTF Rs 8 Value %h Rt 20 Value %h Rd 19 Value %h Imm16 0100011011000000 Imm26 01000100101000101100100111", $time, rf_tb[8], rf_tb[20], rf_tb[19]);
	@ (posedge clk);
endtask

task automatic check_FMOVI (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10001111100000011100000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FMOVI Rs 28 Value %h Rt 1 Value %h Rd 24 Value %h Imm16 0000000101110001 Imm26 00101010110000101110010101", $time, rf_tb[28], rf_tb[1], rf_tb[24]);
	@ (posedge clk);
endtask

task automatic check_IMOVF (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10001001011011100110000000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst IMOVF Rs 11 Value %h Rt 14 Value %h Rd 12 Value %h Imm16 1010100111100011 Imm26 00011010111100000001111110", $time, rf_tb[11], rf_tb[14], rf_tb[12]);
	@ (posedge clk);
endtask

task automatic check_FST (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11000010110010011001101101001010;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FST Rs 22 Value %h Rt 5 Value %h Rd 9 Value %h Imm16 1001101101001010 Imm26 10000101010000011011111010", $time, rf_tb[22], rf_tb[5], rf_tb[9]);
	@ (posedge clk);
endtask

task automatic check_FLD (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b11000100000011101111100101101101;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FLD Rs 0 Value %h Rt 2 Value %h Rd 14 Value %h Imm16 1111100101101101 Imm26 01001101001010101101111000", $time, rf_tb[0], rf_tb[2], rf_tb[14]);
	@ (posedge clk);
endtask

task automatic check_FCLASS (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b10010010001000010111100000000000;
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	repeat (4) @ (posedge clk);
	$display ("time %t : Inst FCLASS Rs 17 Value %h Rt 1 Value %h Rd 15 Value %h Imm16 1111101100110000 Imm26 10100000000001100001010100", $time, rf_tb[17], rf_tb[1], rf_tb[15]);
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