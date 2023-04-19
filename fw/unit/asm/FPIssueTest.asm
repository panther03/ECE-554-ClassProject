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
fadd f23,f1,f10
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
fadd f20,f1,f10
nop
fadd f23,f1,f10
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

.pass:
lbi r17,1
j .halt

.fail:
lbi r16,1
j .halt

.halt:
halt