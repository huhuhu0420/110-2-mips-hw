.data
	data: .word 0:100
	comma: .asciiz ","

.text
main:
	la $s0 data
	li $t0 1
	sw $t0 0($s0)
	sw $t0 4($s0)
	li $v0 5
	syscall
	move $s1 $v0  #s1 = n
	
	add $a0 $s1 $zero
	jal fib
	
	jal print
	li $v0 10
	syscall

fib:
	addi $t0 $a0 -1  #t0 = n - 1
	sll $t1 $t0 2
	add $t1 $t1 $s0
	lw $t1 0($t1)
	bgt $t1 $zero haveData
	j fib_rec
haveData:
	add $v0 $t1 $zero  #v0 = data[n]
	jr $ra

fib_rec:
	addi $sp $sp -12
	add $t0 $a0 $zero  #t0 = n
	sw $ra 8($sp)  #save address
	sw $t0 4($sp)  #save n
	
	addi $a0 $t0 -1  #n - 1
	jal fib
	
	sw $v0 0($sp)  #save f(n - 1)
	
	lw $t0 4($sp)
	addi $a0 $t0 -2  #n - 2
	jal fib
	
	lw $t2 0($sp)  #load t2 =  f(n - 1)
	lw $t0 4($sp)  #t0 = n
	addi $t1 $t0 -1  #t1 = n - 1
	sll $t1 $t1 2
	add $t1 $s0 $t1  #t1 = &data[n]
	add $t3 $t2 $v0  #t3 = f(n-1) + f(n-2)
	sw $t3 0($t1)
	lw $ra 8($sp)
	add $v0 $t3 $zero
	add $sp $sp 12
	
	jr $ra

print:
	li $t0 0  #t0 = i
print_j:
	beq $t0 $s1 print_break
	sll $t1 $t0 2
	add $t1 $t1 $s0
	lw $t1 0($t1)  #t1 = data[i]
	
	add $a0 $t1 $zero
	li $v0 1
	syscall
	la $a0 comma
	li $v0 4
	syscall
	
	addi $t0 $t0 1  #i++
	j print_j
print_break:
	jr $ra
