
# store some data

    li $t0, 0
    li $t1, 4
    li $t2, 2
    li $t3, 6
    li $t4, 1

    li $t1, 1 # initialize the counter to one

loop:
    beq $t1, $a1, exit # exit if we reach the end of the array
    addi $a0, $a0, 4 # increment the pointer by one word
    addi $t1, $t1, 1 # increment the loop counter
    lw $t2, 0($a0) # store the next array value into t2
    ble $t2, $t0, end_if
    move $t0, $t2 # found a new maximum, store it in t0

end_if:
    j loop # repeat the loop

exit:

