.data
	c: .word 1000,1000,1000,1000,1000,1000,512,1000
.text
main:
	li $s0 1
	la $s2 c

	# s0 = a, s1 = b, s2 = C
	# b = C[a+5] >> 8
	addi $t0 $s0 5  # t0 = a +5
	sll $t0 $t0 2
	add $t0 $t0 $s2  
	lw $t0 0($t0)  # t0 = C[a+5]
	srl $t0 $t0 8  # t0 = C[a+5] >> 8
	add $s1 $t0 $0
	
	add $a0 $s1 $0
	li $v0 1
	syscall