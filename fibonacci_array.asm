.data
	fdata: .word 0,1,1,0,0,0,0,0,0,0,0
	comma: .asciiz ","
	nextline: .asciiz "\n" 

.text
main:
	la $s3 fdata  #s3 = fdata

	li $v0 5
	syscall

	move $a0 $v0
	
	jal fib
	
	move $a0 $v0  #print outcome
	li $v0 1
	syscall
	la $a0 nextline
	li $v0 4
	syscall
	
	li $t0 0  #t0 = i = 0
	j printData
	
printData_ret:
	li $v0 10
	syscall

fib:
	sll $t7 $a0 2  #t7 = 4n
	add $t7 $t7 $s3
	lw $t7 0($t7)  #t7 = data[n]
	
	beq $t7 $zero fib_recursion
	add $v0 $t7 $zero  #return dada[n]
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
	
	sll $t7 $t0 2  #t7 = 4n
	add $t7 $s3 $t7
	sw $v0 0($t7)  
	
	lw $ra 8($sp)	
	add $sp $sp 12
	
	jr $ra
	
printData:
	#t0 = i
	bgt $t0 36 printData_ret
	add $t1 $t0 $s3  #t1 = fdata[i]
	
	lw $a0 0($t1)
	li $v0 1
	syscall
	la $a0 comma
	li $v0 4
	syscall
	
	addi $t0 $t0 4  #i++ 
	j printData
	
