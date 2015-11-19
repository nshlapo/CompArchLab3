addi $sp, $zero, 0x3ffc
addi $t0, $zero, 8 # the address of the line after trap

trap:
addi $t2, $zero, 0x173
jr $t0

addi $t2, $zero, 0x100