// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!
// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.
package decode_tasks_pkg;

task automatic check_ADDI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b0100001000000110001101100111011;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ADDI Rs 8 Value %h Rt 29 Value %h Rd 3 Value %h Imm16 0001101100111011 Imm26 01011110101011111010011011", $time, rf1[8], rf1[29], rf1[3]);
	@ (negedge clk);
endtask

task automatic check_SUBI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b0100100010011101011011110010100;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SUBI Rs 2 Value %h Rt 8 Value %h Rd 14 Value %h Imm16 1011011110010100 Imm26 00100101001010001100010001", $time, rf1[2], rf1[8], rf1[14]);
	@ (negedge clk);
endtask

task automatic check_XORI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b0101001100100111000010110110100;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst XORI Rs 12 Value %h Rt 5 Value %h Rd 19 Value %h Imm16 1000010110110100 Imm26 10010100101011100101101011", $time, rf1[12], rf1[5], rf1[19]);
	@ (negedge clk);
endtask

task automatic check_ANDNI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b0101101100011000100111000101001;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ANDNI Rs 12 Value %h Rt 21 Value %h Rd 12 Value %h Imm16 0100111000101001 Imm26 11111100111100000010001110", $time, rf1[12], rf1[21], rf1[12]);
	@ (negedge clk);
endtask

task automatic check_ROLI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1010011100001000111110111101011;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ROLI Rs 28 Value %h Rt 1 Value %h Rd 4 Value %h Imm16 0111110111101011 Imm26 00011101100101000110100101", $time, rf1[28], rf1[1], rf1[4]);
	@ (negedge clk);
endtask

task automatic check_SLLI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1010110100100011000111100100101;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SLLI Rs 20 Value %h Rt 2 Value %h Rd 17 Value %h Imm16 1000111100100101 Imm26 10000001011010011011010110", $time, rf1[20], rf1[2], rf1[17]);
	@ (negedge clk);
endtask

task automatic check_RORI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1011010110111001100101000111001;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst RORI Rs 22 Value %h Rt 4 Value %h Rd 28 Value %h Imm16 1100101000111001 Imm26 00000010010000110100110100", $time, rf1[22], rf1[4], rf1[28]);
	@ (negedge clk);
endtask

task automatic check_SRLI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1011110111001100001000101110101;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SRLI Rs 23 Value %h Rt 25 Value %h Rd 6 Value %h Imm16 0001000101110101 Imm26 01101001101110011001111101", $time, rf1[23], rf1[25], rf1[6]);
	@ (negedge clk);
endtask

task automatic check_ST (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1000011101101110010100000101101;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ST Rs 29 Value %h Rt 7 Value %h Rd 23 Value %h Imm16 0010100000101101 Imm26 10100011001001100001101010", $time, rf1[29], rf1[7], rf1[23]);
	@ (negedge clk);
endtask

task automatic check_LD (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1000101101000110001111100100101;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst LD Rs 13 Value %h Rt 5 Value %h Rd 3 Value %h Imm16 0001111100100101 Imm26 01011000110011111110011101", $time, rf1[13], rf1[5], rf1[3]);
	@ (negedge clk);
endtask

task automatic check_STU (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1001100110010001111011010101000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst STU Rs 6 Value %h Rt 24 Value %h Rd 8 Value %h Imm16 1111011010101000 Imm26 01111001000001100001101001", $time, rf1[6], rf1[24], rf1[8]);
	@ (negedge clk);
endtask

task automatic check_BTR (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1100101111000110101100000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst BTR Rs 15 Value %h Rt 3 Value %h Rd 11 Value %h Imm16 0111110110000010 Imm26 10101010100110001110001110", $time, rf1[15], rf1[3], rf1[11]);
	@ (negedge clk);
endtask

task automatic check_ADD (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101111000001000101100000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ADD Rs 24 Value %h Rt 4 Value %h Rd 11 Value %h Imm16 0000100001010001 Imm26 10101001101000011000000011", $time, rf1[24], rf1[4], rf1[11]);
	@ (negedge clk);
endtask

task automatic check_SUB (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101100001011110001100000000001;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SUB Rs 1 Value %h Rt 15 Value %h Rd 3 Value %h Imm16 1111101010000111 Imm26 01110111011100101100100100", $time, rf1[1], rf1[15], rf1[3]);
	@ (negedge clk);
endtask

task automatic check_XOR (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101101100001001100000000000010;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst XOR Rs 12 Value %h Rt 4 Value %h Rd 24 Value %h Imm16 1010000100011110 Imm26 11000100010111110100101110", $time, rf1[12], rf1[4], rf1[24]);
	@ (negedge clk);
endtask

task automatic check_ANDN (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101110010010111010000000000011;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ANDN Rs 18 Value %h Rt 11 Value %h Rd 20 Value %h Imm16 1110010110001111 Imm26 01011010111011010110100011", $time, rf1[18], rf1[11], rf1[20]);
	@ (negedge clk);
endtask

task automatic check_ROL (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101011000010111110000000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ROL Rs 24 Value %h Rt 11 Value %h Rd 28 Value %h Imm16 0001100101011110 Imm26 00010001010001011011010000", $time, rf1[24], rf1[11], rf1[28]);
	@ (negedge clk);
endtask

task automatic check_SLL (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101010111001011101100000000001;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SLL Rs 23 Value %h Rt 5 Value %h Rd 27 Value %h Imm16 0110010000001111 Imm26 11010101110011111110101110", $time, rf1[23], rf1[5], rf1[27]);
	@ (negedge clk);
endtask

task automatic check_ROR (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101011010111001001000000000010;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ROR Rs 26 Value %h Rt 28 Value %h Rd 18 Value %h Imm16 0011001111010110 Imm26 00010101011110101000011011", $time, rf1[26], rf1[28], rf1[18]);
	@ (negedge clk);
endtask

task automatic check_SRL (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101000010011111101000000000011;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SRL Rs 2 Value %h Rt 15 Value %h Rd 26 Value %h Imm16 0101110100110010 Imm26 00011000000011011111111000", $time, rf1[2], rf1[15], rf1[26]);
	@ (negedge clk);
endtask

task automatic check_SEQ (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1110001011100111010100000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SEQ Rs 11 Value %h Rt 19 Value %h Rd 21 Value %h Imm16 1010111110100000 Imm26 10101011000101101100101011", $time, rf1[11], rf1[19], rf1[21]);
	@ (negedge clk);
endtask

task automatic check_SLT (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1110100010010010000100000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SLT Rs 2 Value %h Rt 9 Value %h Rd 1 Value %h Imm16 1111101101111100 Imm26 10111001001100000100101000", $time, rf1[2], rf1[9], rf1[1]);
	@ (negedge clk);
endtask

task automatic check_SLE (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1111001100001001000000000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SLE Rs 12 Value %h Rt 4 Value %h Rd 16 Value %h Imm16 0110011011001010 Imm26 00010011000100000000001000", $time, rf1[12], rf1[4], rf1[16]);
	@ (negedge clk);
endtask

task automatic check_SCO (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1111100110111000101000000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SCO Rs 6 Value %h Rt 28 Value %h Rd 10 Value %h Imm16 0101111110111101 Imm26 00011111001100101101000110", $time, rf1[6], rf1[28], rf1[10]);
	@ (negedge clk);
endtask

task automatic check_LBI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1100001111000101111001100111111;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst LBI Rs 15 Value %h Rt 9 Value %h Rd 2 Value %h Imm16 1111001100111111 Imm26 10000110010001010010000111", $time, rf1[15], rf1[9], rf1[2]);
	@ (negedge clk);
endtask

task automatic check_SLBI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1001010100101100001010101101001;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SLBI Rs 20 Value %h Rt 16 Value %h Rd 22 Value %h Imm16 0001010101101001 Imm26 01100001101101111111010011", $time, rf1[20], rf1[16], rf1[22]);
	@ (negedge clk);
endtask



task automatic check_dec_inst (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
	check_ADDI(clk, IF_ID_inst_out, rf1);
	check_SUBI(clk, IF_ID_inst_out, rf1);
	check_XORI(clk, IF_ID_inst_out, rf1);
	check_ANDNI(clk, IF_ID_inst_out, rf1);
	check_ROLI(clk, IF_ID_inst_out, rf1);
	check_SLLI(clk, IF_ID_inst_out, rf1);
	check_RORI(clk, IF_ID_inst_out, rf1);
	check_SRLI(clk, IF_ID_inst_out, rf1);
	check_ST(clk, IF_ID_inst_out, rf1);
	check_LD(clk, IF_ID_inst_out, rf1);
	check_STU(clk, IF_ID_inst_out, rf1);
	check_BTR(clk, IF_ID_inst_out, rf1);
	check_ADD(clk, IF_ID_inst_out, rf1);
	check_SUB(clk, IF_ID_inst_out, rf1);
	check_XOR(clk, IF_ID_inst_out, rf1);
	check_ANDN(clk, IF_ID_inst_out, rf1);
	check_ROL(clk, IF_ID_inst_out, rf1);
	check_SLL(clk, IF_ID_inst_out, rf1);
	check_ROR(clk, IF_ID_inst_out, rf1);
	check_SRL(clk, IF_ID_inst_out, rf1);
	check_SEQ(clk, IF_ID_inst_out, rf1);
	check_SLT(clk, IF_ID_inst_out, rf1);
	check_SLE(clk, IF_ID_inst_out, rf1);
	check_SCO(clk, IF_ID_inst_out, rf1);
	check_LBI(clk, IF_ID_inst_out, rf1);
	check_SLBI(clk, IF_ID_inst_out, rf1);
endtask

endpackage