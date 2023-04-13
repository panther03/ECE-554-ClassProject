lbi r0, 0
lbi r1, 0xabcd
lbi r2, 0xabcd
lbi r11, 0xffff
slbi r11, 0x0000
st r1, r0, 0
ld r3, r0, 0
sub r4, r3, r2
bnez r4, .fail
ldb r5, r0, 0
subi r6, r5, 0x00ff
bnez r6, .fail
ldb r5, r0, 1
subi r6, r5, 0x00ff
bnez r6, .fail
ldb r5, r0, 2
subi r6, r5, 0x00ab
bnez r6, .fail
ldb r5, r0, 3
subi r6, r5, 0x00cd
bnez r6, .fail
ldh r5, r0, 0
xori r6, r5, 0xffff 
andn r7, r6, r11
bnez r7, .fail
ldh r5, r0, 2
xori r6, r5, 0xabcd 
andn r7, r6, r11
bnez r7, .fail
stb r1, r0, 0
ldb r5, r0, 0
subi r6, r5, 0x00cd
bnez r6, .fail
sth r1, r0, 0
ldh r5, r0, 0
xori r6, r5, 0xabcd
andn r7, r6, r11
bnez r7, .fail
stb r1, r0, 3
ldb r5, r0, 3
subi r6, r5, 0x00cd
bnez r6, .fail
sth r1, r0, 2
ldh r5, r0, 2
xori r6, r5, 0xabcd
andn r7, r6, r11
bnez r7, .fail

.pass:
lbi r25, 1
j .pass

.fail:
lbi r26, 1
j .fail

