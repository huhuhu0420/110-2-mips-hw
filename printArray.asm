.data
	list: .word 1, 2, 3, 4, 5
	size: .word 5

.text
	main:
		lw $t3 size  #t3 = size
		la $t1 list  #t1 = list
		li $t2 0  #t2 = i
	printLoop:
		beq $t2 $t3 end
		
		lw $a0 0($t1)
		li $v0 1
		syscall
		
		addi $t2 $t2 1
		addi $t1 $t1 4
		j printLoop
		
	end: