nop
nop
lbi r3, 0x0400
slbi r3, 0x0000
lbi r1,0
ldcr r2,r1,0
sub r4, r2, r3
beqz r4, .PASS
nop
.FAIL:
lbi r10, 1
.PASS:
lbi r11, 1