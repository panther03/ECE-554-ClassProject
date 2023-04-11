// load address of led into r0
lbi r0, 0xc000

// check with all the switches off
ld r1, r0, 0x1
bnez r1, .fail


// wait for switch 1
nop
nop
.check1:
nop
ld r1, r0, 0x1
subi r1, r1, 0x0001
bnez r1, .fail

// wait for switch 2
nop
nop
.check2:
nop
ld r1, r0, 0x1
subi r1, r1, 0x0002
bnez r1, .fail


// wait for switch 3
nop
nop
.check3:
nop
ld r1, r0, 0x1
subi r1, r1, 0x0003
bnez r1, .fail


// turn on led 0 and wait for tb to check
lbi r1, 0x0001
st r1, r0, 0x0
nop
nop
nop
.check4:
nop

// turn on led 2 and wait for tb to check
lbi r1, 0x0002
st r1, r0, 0x0
nop
nop
nop
.check5:
nop

halt

.fail:
j .fail

