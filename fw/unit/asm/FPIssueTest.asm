lbi r0,4
fmovi f0,r0
lbi r8,0xccdd
fmovi f8,r8
lbi r1,0x4060
slbi r1,0x0000
fmovi f1,r1
lbi r10,0x40e0
slbi r10,0x0000
fmovi f10,r10
flt f6,f1,f10
imovf r6,f6
// beqz r6,.FAIL 
fst f1,r0,4
st r8,r0,0
fadd f23,f1,f10
fadd f24,f1,f10
fsub f25,f23,f24
imovf r25,f25
//bnez r25,.FAIL
fld f1,r0,0
imovf r1,f1
sub r1,r1,r8
//bnez r1,.FAIL
fadd f20,f1,f10
nop
fadd f23,f1,f10
imovf r4,f23
lbi r4,4
lbi r2,8
fld f1,r0,0
fst f1,r0,4
nop
fld f1,r0,0
nop 
nop 
fadd f20,f1,f10
fadd f23,f1,f10
nop 
nop 
fst f23, r0, 0
nop 
nop 

.FAIL:
lbi r16,1

.PASS:
lbi r17,1