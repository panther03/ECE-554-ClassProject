lbi r0,4
fmovi f0,r0
lbi r8,0xccdd
fmovi f8,r8
lbi r1,0xbbcc
slbi r1,0xbbcc
fmovi f1,r1
lbi r10,0xaabb
slbi r10,0xaabb
fmovi f10,r10
fst f1,r0,4
st r8,r0,0
fadd f23,f1,f10
fsub f23,f1,f10
fld f1,r0,0
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