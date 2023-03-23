// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!
// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.
package decode_tasks_pkg;

task automatic check_LDCR (ref logic clk, ref logic [31:0] inst_i, ref logic [31:0] rf_tb [32]);
	@ (negedge clk);
	inst_i = 'h04000000; // NOP
	for (int i = 0; i < 30; i++)
		rf_tb[i] = $urandom();
	@ (negedge clk);
	inst_i = 'b00001100001001110100000001100000;
	$display ("time %t : Inst LDCR Rs 1 Value %h Rt 8 Value %h Imm16 0100000001100000 Imm26 11100101100011011100100011", $time, rf_tb[1], rf_tb[8]);
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
	inst_i = 'b00100010010100111101000110100000;
	$display ("time %t : Inst ADDI Rs 18 Value %h Rt 29 Value %h Imm16 1101000110100000 Imm26 01000000000001010000001000", $time, rf_tb[18], rf_tb[29]);
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
	inst_i = 'b00100101101011011010111100101010;
	$display ("time %t : Inst SUBI Rs 13 Value %h Rt 2 Value %h Imm16 1010111100101010 Imm26 00011111110100010010001101", $time, rf_tb[13], rf_tb[2]);
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
	inst_i = 'b00101001101000110110110111111010;
	$display ("time %t : Inst XORI Rs 13 Value %h Rt 14 Value %h Imm16 0110110111111010 Imm26 01000001100101111001011011", $time, rf_tb[13], rf_tb[14]);
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
	inst_i = 'b00101100101101001010101111011010;
	$display ("time %t : Inst ANDNI Rs 5 Value %h Rt 7 Value %h Imm16 1010101111011010 Imm26 11111100010101011110101000", $time, rf_tb[5], rf_tb[7]);
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
	inst_i = 'b01010011010000010010010000101000;
	$display ("time %t : Inst ROLI Rs 26 Value %h Rt 13 Value %h Imm16 0010010000101000 Imm26 00001100110000000001000110", $time, rf_tb[26], rf_tb[13]);
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
	inst_i = 'b01010101010001011110100000110010;
	$display ("time %t : Inst SLLI Rs 10 Value %h Rt 15 Value %h Imm16 1110100000110010 Imm26 01110001100011000001100010", $time, rf_tb[10], rf_tb[15]);
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
	inst_i = 'b01011000011000001101011111111110;
	$display ("time %t : Inst RORI Rs 3 Value %h Rt 25 Value %h Imm16 1101011111111110 Imm26 10100101100010011101001000", $time, rf_tb[3], rf_tb[25]);
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
	inst_i = 'b01011111010001101000110011010100;
	$display ("time %t : Inst SRLI Rs 26 Value %h Rt 9 Value %h Imm16 1000110011010100 Imm26 00100000101100000111111010", $time, rf_tb[26], rf_tb[9]);
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
	inst_i = 'b01000010111000111101001000000011;
	$display ("time %t : Inst ST Rs 23 Value %h Rt 0 Value %h Imm16 1101001000000011 Imm26 10101111100010011011001000", $time, rf_tb[23], rf_tb[0]);
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
	inst_i = 'b01000101110110010000110111110000;
	$display ("time %t : Inst LD Rs 14 Value %h Rt 5 Value %h Imm16 0000110111110000 Imm26 01110100010000110000000000", $time, rf_tb[14], rf_tb[5]);
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
	inst_i = 'b01001110000101000110010110101110;
	$display ("time %t : Inst STU Rs 16 Value %h Rt 0 Value %h Imm16 0110010110101110 Imm26 10000000011110011011110110", $time, rf_tb[16], rf_tb[0]);
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
	inst_i = 'b01100110011100101110000000000000;
	$display ("time %t : Inst BTR Rs 19 Value %h Rt 18 Value %h Imm16 1100110100010101 Imm26 11000001110110001011010001", $time, rf_tb[19], rf_tb[18]);
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
	inst_i = 'b01101110111110001100000000000000;
	$display ("time %t : Inst ADD Rs 23 Value %h Rt 24 Value %h Imm16 0011111101011001 Imm26 11101010110011001100110010", $time, rf_tb[23], rf_tb[24]);
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
	inst_i = 'b01101100000111000011100000000001;
	$display ("time %t : Inst SUB Rs 0 Value %h Rt 28 Value %h Imm16 1101111101010011 Imm26 00011001110010101100111100", $time, rf_tb[0], rf_tb[28]);
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
	inst_i = 'b01101101001100101110000000000010;
	$display ("time %t : Inst XOR Rs 9 Value %h Rt 18 Value %h Imm16 0000100011110110 Imm26 11000000001101011011011101", $time, rf_tb[9], rf_tb[18]);
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
	inst_i = 'b01101101100011000100100000000011;
	$display ("time %t : Inst ANDN Rs 12 Value %h Rt 12 Value %h Imm16 1111101100110010 Imm26 01010001110000001100011110", $time, rf_tb[12], rf_tb[12]);
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
	inst_i = 'b01101010001010111100000000000000;
	$display ("time %t : Inst ROL Rs 17 Value %h Rt 11 Value %h Imm16 1111010011111001 Imm26 10101001111111001000101011", $time, rf_tb[17], rf_tb[11]);
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
	inst_i = 'b01101001101101011110100000000001;
	$display ("time %t : Inst SLL Rs 13 Value %h Rt 21 Value %h Imm16 0101010101000001 Imm26 01101001010000100000101001", $time, rf_tb[13], rf_tb[21]);
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
	inst_i = 'b01101000101001100010000000000010;
	$display ("time %t : Inst ROR Rs 5 Value %h Rt 6 Value %h Imm16 1000110111100100 Imm26 11001110010111000101001010", $time, rf_tb[5], rf_tb[6]);
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
	inst_i = 'b01101010110110010010000000000011;
	$display ("time %t : Inst SRL Rs 22 Value %h Rt 25 Value %h Imm16 1101110101011001 Imm26 01110100100000010000001010", $time, rf_tb[22], rf_tb[25]);
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
	inst_i = 'b01110010000111001001100000000000;
	$display ("time %t : Inst SEQ Rs 16 Value %h Rt 28 Value %h Imm16 1011100111011001 Imm26 11110000001101100010000001", $time, rf_tb[16], rf_tb[28]);
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
	inst_i = 'b01110101011100111101000000000000;
	$display ("time %t : Inst SLT Rs 11 Value %h Rt 19 Value %h Imm16 0101000000101101 Imm26 10110001111010110000011000", $time, rf_tb[11], rf_tb[19]);
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
	inst_i = 'b01111000001110010111100000000000;
	$display ("time %t : Inst SLE Rs 1 Value %h Rt 25 Value %h Imm16 0100010011011111 Imm26 01110110001101010010101010", $time, rf_tb[1], rf_tb[25]);
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
	inst_i = 'b01111110101001110001100000000000;
	$display ("time %t : Inst SCO Rs 21 Value %h Rt 7 Value %h Imm16 0010001001101000 Imm26 00111101111101101010101101", $time, rf_tb[21], rf_tb[7]);
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
	inst_i = 'b01100010001001110010000111111101;
	$display ("time %t : Inst LBI Rs 17 Value %h Rt 2 Value %h Imm16 0010000111111101 Imm26 01110110000001001101101100", $time, rf_tb[17], rf_tb[2]);
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
	inst_i = 'b01001001100011010000100101010111;
	$display ("time %t : Inst SLBI Rs 12 Value %h Rt 15 Value %h Imm16 0000100101010111 Imm26 01110001010110001111001010", $time, rf_tb[12], rf_tb[15]);
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
	inst_i = 'b11101110111100001001100000000000;
	$display ("time %t : Inst FADD Rs 23 Value %h Rt 16 Value %h Imm16 0010101100110101 Imm26 00100100110110111101101111", $time, rf_tb[23], rf_tb[16]);
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
	inst_i = 'b11101101100011111011100000000001;
	$display ("time %t : Inst FSUB Rs 12 Value %h Rt 15 Value %h Imm16 1011000111101100 Imm26 00111001011011011011001010", $time, rf_tb[12], rf_tb[15]);
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
	inst_i = 'b11101101111010010111000000000010;
	$display ("time %t : Inst FMUL Rs 15 Value %h Rt 9 Value %h Imm16 0101000111100011 Imm26 01110100010100111000001111", $time, rf_tb[15], rf_tb[9]);
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
	inst_i = 'b11101100000110010101100000000011;
	$display ("time %t : Inst FDIV Rs 0 Value %h Rt 25 Value %h Imm16 0010101110111111 Imm26 11011111111100101000001110", $time, rf_tb[0], rf_tb[25]);
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
	inst_i = 'b11110010101000101011100000000000;
	$display ("time %t : Inst FEQ Rs 21 Value %h Rt 2 Value %h Imm16 0011000011110011 Imm26 11011101001110101001011010", $time, rf_tb[21], rf_tb[2]);
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
	inst_i = 'b11111010001000100101100000000000;
	$display ("time %t : Inst FLE Rs 17 Value %h Rt 2 Value %h Imm16 1001001100111001 Imm26 10000010110000000000001000", $time, rf_tb[17], rf_tb[2]);
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
	inst_i = 'b11111110110000010010100000000000;
	$display ("time %t : Inst FLT Rs 22 Value %h Rt 1 Value %h Imm16 0101010011110001 Imm26 01001001011111100010000100", $time, rf_tb[22], rf_tb[1]);
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
	inst_i = 'b10000101110011111011100000000000;
	$display ("time %t : Inst FCVTI Rs 14 Value %h Rt 15 Value %h Imm16 0001101110001110 Imm26 11110000001011101100010011", $time, rf_tb[14], rf_tb[15]);
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
	inst_i = 'b10000001010001110100100000000000;
	$display ("time %t : Inst ICVTF Rs 10 Value %h Rt 7 Value %h Imm16 1100100010111100 Imm26 01000000011001000101111010", $time, rf_tb[10], rf_tb[7]);
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
	inst_i = 'b10001110100101000111000000000000;
	$display ("time %t : Inst FMOVI Rs 20 Value %h Rt 20 Value %h Imm16 0000110011100110 Imm26 00101011111001111110101001", $time, rf_tb[20], rf_tb[20]);
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
	inst_i = 'b10001000001101111101100000000000;
	$display ("time %t : Inst IMOVF Rs 1 Value %h Rt 23 Value %h Imm16 1111100010110001 Imm26 00000101011110000111001001", $time, rf_tb[1], rf_tb[23]);
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
	inst_i = 'b11000000000011111101110010001101;
	$display ("time %t : Inst FST Rs 0 Value %h Rt 1 Value %h Imm16 1101110010001101 Imm26 01110101110010011100100011", $time, rf_tb[0], rf_tb[1]);
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
	inst_i = 'b11000111100001001101011010101000;
	$display ("time %t : Inst FLD Rs 28 Value %h Rt 5 Value %h Imm16 1101011010101000 Imm26 01010110010111100110100001", $time, rf_tb[28], rf_tb[5]);
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
	inst_i = 'b10010000000001010111100000000000;
	$display ("time %t : Inst FCLASS Rs 0 Value %h Rt 5 Value %h Imm16 1001101000111010 Imm26 10111011101100010101000111", $time, rf_tb[0], rf_tb[5]);
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