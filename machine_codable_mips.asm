#currently 0th location in memory stores the value 0

# $t0 stores 1
# $t10 stores 0
addi $t0, $t0, 1         
currently this instruction left

lw $s0, 0($t0),  si=16+i in our case 
currently this instruction left

addi $s1, $t0, 2
currently this instruction left


sub $t1, $s0, $t0
32'b000001_00001_10000_00000_00000_000000

outer_loop:


beq $t1, $s2, end_outer_loop
32'b001110_xxxxx_00001_10010_xxxxx_xxxxxx


sub $t2, $s0, $s2
32'b000001_00010_10000_10010_00000_000000

sub $t3, $t2, $t0
32'b000001_00011_00010_00000_00000_000000


lw $s3, 0($t10)
32'b001100_10011_01010_00000_00000_000000


inner_loop:


beq $s3, $t3, end_inner_loop
32'b001110_xxxxx_10011_00011_xxxxx_xxxxxx


addi $t4, $s3, 0
32'b000100_00100_10011_00000_00000_000000


add $t4, $t4, $s1
32'b000000_00100_00100_10001_00000_000000


addi $t5, $t4, 1
32'b000100_00101_00100_00000_00000_000001


lw $t6, 0($t4)
32'b001100_00110_00100_00000_00000_000000


lw $t7, 0($t5)
32'b001100_00111_00101_00000_00000_000000

ble $t6, $t7, endif
32'b010011_xxxxx_00110_00111_xxxxx_xxxxxx

addi $s4, $t6, 0
32'b000100_10100_00110_00000_00000_000000

sw $t7, 0($t4)
32'b001101_00000_00111_00100_00000_000000


sw $s4, 0($t5)
32'b001101_00000_10100_00101_00000_000000


endif:


addi $s3, $s3, 1
32'b000100_10011_10011_00000_00000_000001

j inner_loop
32'b010100_00000_00000_00000_00000_xxxxx


end_inner_loop:


addi $s2, $s2, 1
32'b000100_10010_10010_00000_00000_000001

j outer_loop
32'b010100_00000_00000_00000_00000_xxxxx

end_outer_loop:

