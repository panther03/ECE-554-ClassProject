// This file is auto generated using sw/generate_dec_tasks.py. DO NOT EDIT!
// This package contains tasks to assert decode and execute logic for all instructions. This module doesn't check for stall and flush conditions.
package decode_tasks_pkg;

task automatic check_ADDI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b0100001110001100101000011110111;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ADDI Rs 14 Value %h Rt 24 Value %h Rd 6 Value %h Imm16 0101000011110111 Imm26 11110011101110010101110110", $time, rf1[14], rf1[24], rf1[6]);
	@ (negedge clk);
endtask

task automatic check_SUBI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b0100111100011111011011100100111;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SUBI Rs 28 Value %h Rt 11 Value %h Rd 15 Value %h Imm16 1011011100100111 Imm26 01011000000110010110010001", $time, rf1[28], rf1[11], rf1[15]);
	@ (negedge clk);
endtask

task automatic check_XORI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b0101010011010011100100101100010;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst XORI Rs 19 Value %h Rt 14 Value %h Rd 9 Value %h Imm16 1100100101100010 Imm26 01011010010001001100110010", $time, rf1[19], rf1[14], rf1[9]);
	@ (negedge clk);
endtask

task automatic check_ANDNI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b0101110010100100111001001001001;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ANDNI Rs 18 Value %h Rt 6 Value %h Rd 18 Value %h Imm16 0111001001001001 Imm26 11111100100010100000100100", $time, rf1[18], rf1[6], rf1[18]);
	@ (negedge clk);
endtask

task automatic check_ROLI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1010000100101100110000011111100;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ROLI Rs 4 Value %h Rt 13 Value %h Rd 22 Value %h Imm16 0110000011111100 Imm26 00111100011110001101011110", $time, rf1[4], rf1[13], rf1[22]);
	@ (negedge clk);
endtask

task automatic check_SLLI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1010101010110010101011110111100;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SLLI Rs 10 Value %h Rt 5 Value %h Rd 25 Value %h Imm16 0101011110111100 Imm26 10010111100001100000111100", $time, rf1[10], rf1[5], rf1[25]);
	@ (negedge clk);
endtask

task automatic check_RORI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1011000101011011111100100111101;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst RORI Rs 5 Value %h Rt 22 Value %h Rd 13 Value %h Imm16 1111100100111101 Imm26 00011110111110110000111010", $time, rf1[5], rf1[22], rf1[13]);
	@ (negedge clk);
endtask

task automatic check_SRLI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1011110001011001111101110111101;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SRLI Rs 17 Value %h Rt 15 Value %h Rd 12 Value %h Imm16 1111101110111101 Imm26 10011010110010011100011000", $time, rf1[17], rf1[15], rf1[12]);
	@ (negedge clk);
endtask

task automatic check_ST (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1000000110010110010111011100000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ST Rs 6 Value %h Rt 23 Value %h Rd 11 Value %h Imm16 0010111011100000 Imm26 11110110011001000010000110", $time, rf1[6], rf1[23], rf1[11]);
	@ (negedge clk);
endtask

task automatic check_LD (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1000111000011010010011000010011;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst LD Rs 24 Value %h Rt 9 Value %h Rd 13 Value %h Imm16 0010011000010011 Imm26 00100101110010111010110110", $time, rf1[24], rf1[9], rf1[13]);
	@ (negedge clk);
endtask

task automatic check_STU (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1001110011101100010111111110001;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst STU Rs 19 Value %h Rt 0 Value %h Rd 22 Value %h Imm16 0010111111110001 Imm26 11111100100101000001000010", $time, rf1[19], rf1[0], rf1[22]);
	@ (negedge clk);
endtask

task automatic check_BTR (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1100111001100101011000000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst BTR Rs 25 Value %h Rt 18 Value %h Rd 22 Value %h Imm16 0111011001001100 Imm26 11110010010011101001001100", $time, rf1[25], rf1[18], rf1[22]);
	@ (negedge clk);
endtask

task automatic check_ADD (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101111100101011101000000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ADD Rs 28 Value %h Rt 21 Value %h Rd 26 Value %h Imm16 1111011010101110 Imm26 10010010101010001111111110", $time, rf1[28], rf1[21], rf1[26]);
	@ (negedge clk);
endtask

task automatic check_SUB (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101101110100100000000000000001;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SUB Rs 14 Value %h Rt 18 Value %h Rd 0 Value %h Imm16 1101111111000101 Imm26 01001000000011010111110000", $time, rf1[14], rf1[18], rf1[0]);
	@ (negedge clk);
endtask

task automatic check_XOR (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101110110110101101100000000010;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst XOR Rs 22 Value %h Rt 26 Value %h Rd 27 Value %h Imm16 0100100000110000 Imm26 10111001100101010010000011", $time, rf1[22], rf1[26], rf1[27]);
	@ (negedge clk);
endtask

task automatic check_ANDN (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101101000000111000100000000011;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ANDN Rs 8 Value %h Rt 3 Value %h Rd 17 Value %h Imm16 1100101010100011 Imm26 11111011000110101000000101", $time, rf1[8], rf1[3], rf1[17]);
	@ (negedge clk);
endtask

task automatic check_ROL (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101000000000110100100000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ROL Rs 0 Value %h Rt 3 Value %h Rd 9 Value %h Imm16 1000010011111110 Imm26 10110100100011111001111111", $time, rf1[0], rf1[3], rf1[9]);
	@ (negedge clk);
endtask

task automatic check_SLL (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101001111010011110000000000001;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SLL Rs 15 Value %h Rt 9 Value %h Rd 28 Value %h Imm16 1010100100111010 Imm26 00011000100000101011001101", $time, rf1[15], rf1[9], rf1[28]);
	@ (negedge clk);
endtask

task automatic check_ROR (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101001110011011100000000000010;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst ROR Rs 14 Value %h Rt 13 Value %h Rd 24 Value %h Imm16 1001011010111011 Imm26 01100111000100001101001110", $time, rf1[14], rf1[13], rf1[24]);
	@ (negedge clk);
endtask

task automatic check_SRL (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1101000001111010111000000000011;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SRL Rs 1 Value %h Rt 29 Value %h Rd 14 Value %h Imm16 0001000110100111 Imm26 11110001110000000110010011", $time, rf1[1], rf1[29], rf1[14]);
	@ (negedge clk);
endtask

task automatic check_SEQ (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1110011100011000100100000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SEQ Rs 28 Value %h Rt 12 Value %h Rd 9 Value %h Imm16 1110100110010100 Imm26 00101000000001010100101011", $time, rf1[28], rf1[12], rf1[9]);
	@ (negedge clk);
endtask

task automatic check_SLT (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1110111100110110010100000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SLT Rs 28 Value %h Rt 27 Value %h Rd 5 Value %h Imm16 0110111101111000 Imm26 11101100110100001110111000", $time, rf1[28], rf1[27], rf1[5]);
	@ (negedge clk);
endtask

task automatic check_SLE (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1111000000111010000100000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SLE Rs 0 Value %h Rt 29 Value %h Rd 1 Value %h Imm16 0010011111101010 Imm26 01110100111011011111111110", $time, rf1[0], rf1[29], rf1[1]);
	@ (negedge clk);
endtask

task automatic check_SCO (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1111100010001001110100000000000;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SCO Rs 2 Value %h Rt 4 Value %h Rd 29 Value %h Imm16 1111011010011000 Imm26 11001100100010101110010010", $time, rf1[2], rf1[4], rf1[29]);
	@ (negedge clk);
endtask

task automatic check_LBI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1100011100001011101101000110001;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst LBI Rs 28 Value %h Rt 28 Value %h Rd 5 Value %h Imm16 1101101000110001 Imm26 11011100010001110111010010", $time, rf1[28], rf1[28], rf1[5]);
	@ (negedge clk);
endtask

task automatic check_SLBI (ref logic clk, ref logic [31:0] IF_ID_inst_out, ref logic [31:0] rf1[32]);
@ (negedge clk);	for (int i = 0; i < 30; i++)
		rf1[i] = $urandom();
	@ (negedge clk);
	IF_ID_inst_out = 'b1001010001110100110101100000001;
	@ (negedge clk);
	IF_ID_inst_out = 'h04000000; // NOP
	repeat (4) @ (negedge clk);
	$display ("time %t : Inst SLBI Rs 17 Value %h Rt 19 Value %h Rd 26 Value %h Imm16 0110101100000001 Imm26 01011001101000010100100110", $time, rf1[17], rf1[19], rf1[26]);
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