.data
	u: .asciiz "underweight\n"
	o: .asciiz "overweight\n"
	next: .asciiz "\n"
	
.text
main:
	j scanf
bmi:
	add $s0 $a0 $zero  #s0 =  height
	add $s1 $a1 $zero  #s1 = weight
	mul $s1 $s1 10000
	mul $s0 $s0 $s0
	div $v0 $s1 $s0  #v0 = bmi
	jr $ra
	
print:
	add $s0 $a0 $zero  #s0 = bmi
	blt $s0 18 under
	bgt $s0 24 over
	j else
under:
	la $a0 u
	li $v0 4
	syscall
	jr $ra
over:
	la $a0 o
	li $v0 4
	syscall
	jr $ra
else:
	move $a0 $s0
	li $v0 1
	syscall
	la $a0 next
	li $v0 4
	syscall
	jr $ra
	
scanf:


scanf_j:
	li $v0 5
	syscall
	move $s0 $v0  #s0 = height
	beq $s0 -1 scanf_b
	li $v0 5
	syscall
	move $s1 $v0  #s1 = weight
	
	add $a0 $s0 $zero
	add $a1 $s1 $zero
	jal bmi
	add $a0 $v0 $zero  #a0 = bmi
	
	jal print 
	
	j scanf_j

scanf_b:
	li $v0 10
	syscall
