// load address of tx/rx buffer into r0
lbi r0, 0xc0
slbi r0, 0x04

// assume queue starts out empty
// clear screen
// esc
lbi r1, 0x1b
st r1, r0, 0x0

// [
lbi r1, 0x5b
st r1, r0, 0x0

// 2
lbi r1, 0x32
st r1, r0, 0x0

// j
lbi r1, 0x4a
st r1, r0, 0x0

// move cursor to 35, 12 so that hello world is printed in the center

// esc
lbi r1, 0x1b
st r1, r0, 0x0

// [
lbi r1, 0x5b
st r1, r0, 0x0

// cursor y - 1
lbi r1, 0x31
st r1, r0, 0x0

// cursor y - 2
lbi r1, 0x32
st r1, r0, 0x0

// wait for tx buffer to clear
jal .waitforspacetx

// ;
lbi r1, 0x3b
st r1, r0, 0x0

// cursor x - 3
lbi r1, 0x33
st r1, r0, 0x0

// cursor x - 5
lbi r1, 0x35
st r1, r0, 0x0

// h
lbi r1, 0x66
st r1, r0, 0x0

// wait for tx buffer to clear
jal .waitforspacetx

// print hello world (48 65 6c 6c 6f 20 57 6f 72 6c 64)
// h
lbi r1, 0x48
st r1, r0, 0x0

// e
lbi r1, 0x65
st r1, r0, 0x0

// l
lbi r1, 0x6c
st r1, r0, 0x0

// l
lbi r1, 0x6c
st r1, r0, 0x0

// o
lbi r1, 0x6f
st r1, r0, 0x0

// wait for tx buffer to clear
jal .waitforspacetx

// [space]
lbi r1, 0x20
st r1, r0, 0x0

// w
lbi r1, 0x57
st r1, r0, 0x0

// o
lbi r1, 0x6f
st r1, r0, 0x0

// r
lbi r1, 0x72
st r1, r0, 0x0

// l
lbi r1, 0x6c
st r1, r0, 0x0

// d
lbi r1, 0x64
st r1, r0, 0x0

// cr
lbi r1, 0x0d
st r1, r0, 0x0

// lf
lbi r1, 0x0a
st r1, r0, 0x0

.prog_start:
// wait for tx buffer to clear
jal .waitforspacetx


// name: [4e 61 6d 65 3a 20]
// n
lbi r1, 0x4e
st r1, r0, 0x0

// a
lbi r1, 0x61
st r1, r0, 0x0

// m
lbi r1, 0x6d
st r1, r0, 0x0

// e
lbi r1, 0x65
st r1, r0, 0x0

// :
lbi r1, 0x3a
st r1, r0, 0x0

// [space]
lbi r1, 0x20
st r1, r0, 0x0


// wait for tx buffer to clear
jal .waitforspacetx


// beginning of array to store name
lbi r5, 0x00
slbi r5, 0x00

// current index of array
lbi r6, 0x00
slbi r6, 0x00


.inputloop:
// wait for there to be a character in the queue
jal .waitforrx
// read from rx queue
ld r1, r0, 0
// spit it back out
st r1, r0, 0x0
// store it in our name array
st r1, r6, 0x0
addi r6, r6, 0x1
// test if user put in a cr
addi r1, r1, -13 // negative 0xd (cr)
bnez r1, .inputloop

// null terminator
// we store this so our print section knows when to end
lbi r3, 0x00
st r3, r6, 0x0

// wait for tx buffer to clear
jal .waitforspacetx

// print hello

// cr
lbi r1, 0x0d
st r1, r0, 0x0

// lf
lbi r1, 0x0a
st r1, r0, 0x0

// h
lbi r1, 0x48
st r1, r0, 0x0

// e
lbi r1, 0x65
st r1, r0, 0x0

// l
lbi r1, 0x6c
st r1, r0, 0x0

// l
lbi r1, 0x6c
st r1, r0, 0x0

// o
lbi r1, 0x6f
st r1, r0, 0x0

// [space]
lbi r1, 0x20
st r1, r0, 0x0

// current index of array
lbi r6, 0x00
slbi r6, 0x00

.outputloop:
// wait for tx buffer to clear
jal .waitforspacetx

// r1 holds the character we are printing out
// read it from the array
ld r1, r6, 0x0
// print it out
st r1, r0, 0
// increment array pointer
addi r6, r6, 1
bnez r1, .outputloop

// add a newline sequence after printing out the name

// cr
lbi r1, 0x0d
st r1, r0, 0x0

// lf
lbi r1, 0x0a
st r1, r0, 0x0

// start over
j .prog_start

// this subroutine waits until the tx queue is totally empty.
.waitforspacetx:
// load status register into r3
ld r3, r0, 0x1
// all this nonsense is to check if top 4 bits of r3 is 8
srli r3, r3, 4
addi r3, r3, -8
bnez r3, .waitforspacetx
jr r7, 0

// this subroutine waits until the rx queue has a character.
.waitforrx:
ld r3, r0, 0x1
// this checks that the bottom 4 bits are 0
// we don't have an and instruction so this is to clear out the top 4 bits
// since there are 8 more bits we need to do an extra 8 bits of shifting
slli r3, r3, 12
srli r3, r3, 12
beqz r3, .waitforrx
jr r7, 0
