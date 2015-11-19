xori $sp, $zero, 0x3ffc

xori $t0, $zero, 5
xori $t1, $zero, 7

slt $t2, $t0, $t0 # 0
slt $t3, $t1, $t0 # 0
slt $t4, $t0, $t1 # 1