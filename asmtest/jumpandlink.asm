addi $sp, $zero, 0x3ffc

jal someFunction # function always returns 10
add $t0, $v0, $zero

someFunction:
addi $v0, $zero, 0x314
jr $ra