.data

.text
main:

	li $v0 5
	syscall

	move $a0 $v0
	
	jal fib
	
	move $a0 $v0  #print outcome
	li $v0 1
	syscall
	
printData_ret:
	li $v0 10
	syscall

fib:
	bgt $a0 2 fib_recursion
	li $v0 1 
	jr $ra	
	
fib_recursion:
	addi $sp $sp -12
	move $s0 $a0
	sw $ra 8($sp)  #save address
	sw $s0 4($sp)  #save n
	addi $a0 $s0 -1  #n - 1
	
	jal fib
	
	sw $v0 0($sp)  #save fib(n-1) value
	lw $s0 4($sp)  #load n
	addi $a0 $s0 -2  #n - 2
	
	jal fib
	
	lw $s1 0($sp)  #load fib(n-1) value
	add $v0 $v0 $s1  #v0 = f(n-1) + f(n-2)
	lw $t0 4($sp)  #t0 = n
	lw $ra 8($sp)	
	add $sp $sp 12
	
	jr $ra
