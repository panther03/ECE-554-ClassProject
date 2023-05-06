// EX -> FEX
lbi r7, 0xFFFF
slbi r7, 0x0000
fmovi f7, r7
// EX -> FEX
lbi r0,4
fmovi f0,r0
// EX -> FEX
lbi r8,0xccdd
fmovi f8,r8
// EX -> FEX
lbi r1,0x4060
slbi r1,0x0000
fmovi f1,r1
// EX -> FEX
lbi r10,0x40e0
slbi r10,0x0000
fmovi f10,r10
// FEX -> FEX Stall and Forward
flt f6,f1,f10
// FEX -> EX
imovf r6,f6
beqz r6,.fail 
fst f1,r0,4
st r8,r0,0
// FEX -> FEX
fadd f23,f10,f1
fadd f24,f1,f10
fsub f25,f23,f24
// FEX -> EX
imovf r25,f25
bnez r25,.fail
// EX -> EX for FP LD
lbi r11, 0
slbi r11, 4
fld f1,r11,0
imovf r1,f1
sub r1,r1,r8
bnez r1,.fail
// FEX No Stall
fadd f20,f10,f1
nop
fmul f23,f7,f1
imovf r4,f23
lbi r4,4
lbi r2,8
fld f1,r0,0
// EX -> EX for FP ST
lbi r12, 0
slbi r12, 4
fst f1,r12,4
nop
// WB -> FEX Bypass
fld f1,r0,0
nop 
nop 
fadd f20,f1,f10
// WB -> EX Bypass
fadd f23,f1,f10
nop 
nop 
fst f23, r0, 0
nop 
// MEM -> EX Forward
lbi r13, 0
slbi r13, 4
fld f21, r12, 0
fst f23, r13, 0
// MEM -> EX Forward for FP LD/ST
fld f25, r12, 0
nop
fst f25, r13, 0
// MEM -> EX Stall and Forward for FP LD/ST
fld f26, r12, 0
fst f26, r13, 0
// WB -> EX Bypass for FP LD/ST
fld f27, r12, 0
nop
nop
fst f27, r13, 0
// MEM -> EX Bypass for Int -> FP LD/ST
lbi r17, 0
slbi r17, 4
nop
fld f21, r17, 0
fst f23, r17, 0
// WB -> EX Bypass from FP -> Int
fadd f9, f21, f25
fld f10, r17, 0
// MEM -> FEX forwarding
fadd f14, f10, f25
// FEX -> EX forwarding for FP LD/ST
fst f14, r13, 0 
// FEX WB -> EX bypass for FP ST
fadd f18, f10, f25
nop
fst f18, r13, 0
lbi r22, 0
// Bypass should not happen
fld f22, r17, 0
nop
addi r17, r22, 4 
// Bypass should happen
addi r18, r17, 4
nop
nop
addi r19, r18, 4
// Bypass should happen
fld f22, r17, 0
nop
fst f22, r17, 0
// MEM -> FEX Stall and Forward
lbi r8, 12
lbi r9, 8
st r9, r8, 0        // [12] - 8
ld r10, r8, 0       // r10 - 8
fcvti f10, r10      // f10 - 0x41000000
icvtf r10, f10      // r10 - 8
subi r11, r10, 8    // r11 - 0
bnez r11, .fail
// MEM -> FEX should not stall and forward
fst f10, r8, 4      // [16] - 0x41000000
ld r11, r8, 0       // r11 - 8
fld f11, r8, 4      // f11 - 0x41000000
fcvti f12, r11      // f12 - 0x41000000 
fsub f12, f11, f12  // f12 - 0
imovf r12, f12      // r12 - 0
bnez r12, .fail
// WB -> FEX bypass
ld r19, r8, 0       // r19 - 8
nop
fcvti f19, r19      // f19 - 0x41000000
icvtf r19, f19      // r10 - 8
subi r11, r19, 8    // r11 - 0
bnez r11, .fail
// WB -> FEX bypass
addi r20, r8, 0     // r20 - 12
nop
nop
fcvti f19, r20      // f19 - 0x41400000
icvtf r19, f19      // r19 - 12
subi r11, r19, 12   // r11 - 0
bnez r11, .fail
// WB -> EX bypass
icvtf r21, f19      // r21 - 12
nop
nop
addi r20, r21, 0    // r20 - 12
subi r11, r20, 12   // r11 - 0
bnez r11, .fail
// WB -> EX bypass
addi  r22, r21, 0   // r21 - 12
nop
nop
fcvti f20, r22      // f20 - 0x41400000
fsub f11, f20, f19  // f11 - 0
imovf r11, f11      // r11 - 0
bnez r11, .fail
// Branching cases test
// Set defualt to 1
lbi r20, 1
lbi r21, 1
lbi r22, 1
lbi r23, 1
lbi r24, 1
// Make all Int registers 0 using FP->Int convert, check for forwarding and bypass cases to branch
icvtf r20, f11      // r20 - 0
bnez r20, .fail
icvtf r21, f11      // r21 - 0
nop
bnez r21, .fail
icvtf r22, f11      // r22 - 0
nop
nop
bnez r22, .fail
icvtf r23, f11      // r23 - 0
nop
nop
nop
bnez r23, .fail
icvtf r24, f11      // r24 - 0
nop
nop
nop
nop
bnez r24, .fail

.pass:
lbi r17,1
j .halt

.fail:
lbi r16,1
j .halt

.halt:
halt