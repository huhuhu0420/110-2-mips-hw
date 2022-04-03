.data

.text
main:
li $v0 5
syscall
move $a0 $v0
jal addN

move $a0 $v0
li $v0 1
syscall

li $v0 10
syscall

addN:
bgt $a0 1 addN_rec
move $v0 $a0
jr $ra

addN_rec:
addi $sp $sp -8
sw $ra 0($sp)  #save address
sw $a0 4($sp)  #save n
addi $a0 $a0 -1  #n - 1

jal addN

lw $s0 4($sp)  #s0 = n
add $v0 $v0 $s0
lw $ra 0($sp)
addi $sp $sp 8

jr $ra



