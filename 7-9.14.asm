.data
	printIsEven: .asciiz "Even"	
	printIsOdd: .asciiz "Odd"
	
.text
	li $v0 5
	syscall
	move $s0 $v0
	
	srl $s1 $s0 1
	sll $s1 $s1 1
	
	beq $s0 $s1 isEven	
	
isOdd:
	la $a0 printIsOdd
	li $v0 4
	syscall
	
	li $v0 10
	syscall

isEven:
	la $a0 printIsEven
	li $v0 4
	syscall
	
	li $v0 10
	syscall
