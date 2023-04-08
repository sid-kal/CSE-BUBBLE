#currently 0th location in memory stores the value 0

# $t0 stores 1
# $t10 stores 0
addi $t0, $t0, 1

lw $s0, 0($t0)
addi $s1, $t0, 2
sub $t1, $s0, $t0
outer_loop:
beq $t1, $s2, end_outer_loop
sub $t2, $s0, $s2
sub $t3, $t2, $t0
lw $s3, 0($t10)
inner_loop:
beq $s3, $t3, end_inner_loop
add $t4, $s3, 0
add $t4, $t4, $s1
addi $t5, $t4, 1
lw $t6, 0($t4)
lw $t7, 0($t5)
ble $t6, $t7, endif
addi $s4, $t6, 0
sw $t7, 0($t4)
sw $s4, 0($t5)
endif:
addi $s3, $s3, 1
j inner_loop
end_inner_loop:
addi $s2, $s2, 1
j outer_loop
end_outer_loop: