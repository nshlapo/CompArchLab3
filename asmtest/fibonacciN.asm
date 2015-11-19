addi $sp, $zero, 0x3ffc

addi $t0, $zero, 10 # N
addi $t1, $zero, 1 # f_prev (starts at f_0)
addi $t2, $zero, 1 # f_curr (starts at f_1)
addi $t4, $zero, 2

BEGIN:
bne $t0, $t4, CONTINUE # need to start computing at f_2 -> already defined f_0 and f_1
j END

CONTINUE:
add $t3, $t2, $t1 # temporary sum of the previous two
add $t1, $zero, $t2 # the new f_prev is the old f_curr
add $t2, $zero, $t3 # the new f_curr is the sum of the previous two (from temporary)
addi $t0, $t0, -1
j BEGIN

END:
addi $v0, $t3, 0

trap:
j trap