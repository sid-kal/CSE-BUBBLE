#MIPS CODE FOR BUBBLE SORT

.data
arr: .word 2, 8, 4, 3, 1
n: .word 5

.text

.globl main

main:

lw $s0, n
la $s1, arr

# s2 for i, s3 for j, s4 for temp.
#t0 stores the integer 1 

addi $t0, $t0, 1
sub $t1, $s0, $t0

outer_loop:
beq $t1, $s2, end_outer_loop

sub $t2, $s0, $s2
sub $t3, $t2, $t0

li $s3, 0

inner_loop:

beq $s3, $t3, end_inner_loop

addi $t4, $s3, 0

sll $t4, $t4, 2

add $t4, $t4, $s1

addi $t5, $t4, 4

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



lw $t9, 0($s1)
li $v0, 1					
move $a0, $t9
syscall
addi, $s1, $s1, 4

lw $t9, 0($s1)
li $v0, 1					
move $a0, $t9
syscall
addi, $s1, $s1, 4

lw $t9, 0($s1)
li $v0, 1					
move $a0, $t9
syscall
addi, $s1, $s1, 4

lw $t9, 0($s1)
li $v0, 1					
move $a0, $t9
syscall
addi, $s1, $s1, 4

lw $t9, 0($s1)
li $v0, 1					
move $a0, $t9
syscall
addi, $s1, $s1, 4



li $v0, 10			
syscall