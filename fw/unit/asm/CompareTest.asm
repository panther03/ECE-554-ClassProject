// SLTU, SLEU, SLT test
lbi r1, 0xFFFF
lbi r2, 0x0001
sltu r3, r2, r1
beqz r3, .fail
sleu r3, r2, r1
beqz r3, .fail
lbi r4, 0xC000
lbi r5, 0xC000
sleu r6, r4, r5
beqz r4, .fail
slt r3, r2, r1
bnez r3, .fail
slt r3, r1, r2
beqz r3, .fail
sltu r3, r1, r2
bnez r3, .fail
// XORSI, SRA, SRAI test
lbi r16, 0xFFFF
xorsi r17, r16, 0xFFFF
bnez r17, .fail
xorsi r17, r16, 0x7FFF
srai r18, r17, 31
sra r18, r18, r2
xorsi r19, r18, 0xFFFF
bnez r19, .fail
lbi r16, 0x7FFF
xorsi r17, r16, 0x7FFF
bnez r17, .fail
srai r18, r17, 14
sra r18, r18, r2
xorsi r19, r18, 0x0000
bnez r19, .fail
// SRL, SRLI test
lbi r16, 0xFFFF
srli r17, r16, 16
xori r17, r17, 0xFFFF
bnez r17, .fail
lbi r16, 0xFFFF
lbi r18, 16
srl r17, r16, r18
xori r17, r17, 0xFFFF
bnez r17, .fail

.pass:
lbi r11, 1
j .halt

.fail:
lbi r10, 1
j .halt

.halt:
halt