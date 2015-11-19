addi $sp, $zero, 0x3ffc
addi $t0, $zero, 0x100
addi $t1, $zero, 0x200

sub $sp, $sp, 4
sw $t0, 4($sp)
sw $t1, 0($sp)

addi $t0, $zero, 0
addi $t1, $zero, 0

lw $t0, 4($sp)
lw $t1, 0($sp)
add $sp, $sp, 4

trap:
j trap


.data