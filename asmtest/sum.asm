addi $sp, $zero, 0x3ffc

# store constants to registers $t0 through $t3
addi $t0, $zero, 14
addi $t1, $zero, 9
addi $t2, $zero, 7
addi $t3, $zero, 6

# compute average
# ...compute sum
add $t4, $t0, $t1
add $t4, $t4, $t2
add $t4, $t4, $t3

end:
j end