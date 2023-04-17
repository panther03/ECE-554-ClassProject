lbi r0, 0 // make 0
lbi r1, 0x3f80 // 1
slbi r1, 0x0000 // 1
fmovi f0, r1
lbi r1, 0x4120 // 10
slbi r1, 0x0000 // 10
fmovi f1, r1
slbi r1, 0x0005 // make 5

.LOOP:
seq r3, r0, r1
bnez r3, .DONE

fmul f0, f0, f1
addi r0, r0, 1
j .LOOP

.DONE:
icvtf r2, f0
halt

