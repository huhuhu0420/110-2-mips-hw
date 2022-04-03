.data
	star: .asciiz "*"
	dot: .asciiz "."
	num: .word 9
	nextline: .asciiz "\n"
	promptType: .asciiz "Enter Type:"
	promptNum: .asciiz "Enter Num:"
	
.text
	main:
		li $v0 5
		syscall
		move $t0 $v0  #t0 = type
		li $v0 5
		syscall
		move $s0 $v0  #t1 = num
		beq $t0 1 type1
		
	printSign:
		move $t0 $a0  #t0 = n
		move $t1 $a1  #t1 = sign
		move $a0 $a1
		li $t2 1  #t2 = i
		
	printSignLoop:
		li $v0 4
		syscall
		addi $t2 $t2 1
		ble $t2 $t0 printSignLoop
		jr $ra
		
	type1:
		la $a1 star
		
	type1Top:
		div $s1 $s0 2  
		addi $s1 $s1 1  #s1 = 5
		li $s2 1  #s2 = i = 0
		
	type1TopLoop:
		add $a0 $s2 $zero  #a0 = i
		jal printSign
		la $a0 nextline  #a0 = \n
		li $v0 4
		syscall  #print \n
		addi $s2 $s2 1  #i++
		ble $s2 $s1 type1TopLoop
	
	type1Bot:
		div $s1 $s0 2  #s1 = 4
		add $s2 $s1 $zero  #s2 = i = 4 
	
	type1BotLoop:
		add $a0 $s2 $zero  #a0 = i
		jal printSign
		la $a0 nextline  #a0 = \n
		li $v0 4
		syscall  #print \n
		addi $s2 $s2 -1  #i--
		bgt $s2 $zero type1BotLoop
		
	type2:
	
	type3:
	
	end:
	
	
	
	
