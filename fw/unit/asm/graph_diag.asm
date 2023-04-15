lbi r0, 0xfffe       //start addr
slbi r0, 0xd400

lbi r1, 0x0000 // loop var
lbi r2, 0x00f0 // loop limit
lbi r5, 0x0140 // mult val
lbi r8, 0x0002 // val to write to mem

.LOOP:
seq r3, r1, r2
bnez r3, .DONE

add r7, r0, r1
j .MULT
.WRITEMEM:
st r8, r7, 0

addi r1, r1, 1
j .LOOP

.MULT:
lbi r4, 0x0000
.MULTLOOP:
seq r3, r4, r1
bnez r3, .WRITEMEM
add r7, r7, r5
addi r4, r4, 1
j .MULTLOOP


.DONE:
j .DONE
