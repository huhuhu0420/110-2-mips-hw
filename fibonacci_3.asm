.data
	data: .word 0:30
		
.text
main:
	la $s0 data  #s0 = data
	li $t0 1
	sw $t0 0($s0)
	sw $t0 4($s0)
	li $v0 5
	syscall
	move $s1 $v0  #s1 = n
	
	add $a0 $s1 $zero  #a0 = n
	jal fib
	
	add $a0 $v0 $zero
	li $v0 1
	syscall
	
	li $v0 10
	syscall
	
fib:
	add $t0 $a0 $zero  #t0 = n
	addi $t0 $t0 -1  #n = n - 1
	sll $t0 $t0 2
	add $t0 $s0 $t0
	lw $t0 0($t0)  #t0 = data[n-1]
	
	beq $t0 $zero fib_rec
	
	add $v0 $t0 $zero
	jr $ra

fib_rec:
	add $sp $sp -12
	sw $ra 8($sp)  #save address
	add $t0 $a0 $zero  #t0 = n
	sw $t0 4($sp)  #save n
	
	add $a0 $t0 -1  #a0 = n-1
	jal fib
	
	sw $v0 0($sp)  #save f(n-1)
	
	lw $t0 4($sp)
	add $a0 $t0 -2  #a0 = n-2
	jal fib
	
	lw $t1 0($sp)
	add $t1 $v0 $t1  #t1 = f(n-1) + f(n-2)
	
	lw $t0 4($sp)  #t0 = n
	addi $t0 $t0 -1  #n = n - 1
	sll $t0 $t0 2
	add $t0 $s0 $t0  #t0 = &data[n-1]
	sw $t1 0($t0)  #save data[n-1]
	
	add $v0 $t1 $zero  
	lw $ra 8($sp)
	
	add $sp $sp 12
	jr $ra

	
	