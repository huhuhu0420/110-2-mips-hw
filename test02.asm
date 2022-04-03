

.text
data:
	main:
		

	loop2:
		#s0 = a, s1 = i, s2 = k
		sll $t1 $s1 2  #t1 = i
		add $t0 $t1 $s0
		lw $t3 0($t0)  #t3 = a[i]
		
		bge $t3 $s2 end
		
		addi $s1 $s1 1
		addi $s2 $s2 $s1
		j loop2

	loop:
		#s0 = i, s1 = j, s2 = a, s3 = b
		sll $t0 $s0 2
		add $t2 $t0 $s2  # t2 = a[i]
		sll $t1 $s1 2
		addi $t1 $t1 4  # t1 = j+4
		add $t3 $s3 $t1  # t3 = b[j+1]
		
		lw $t4 0($t2)
		lw $t5 0($t3)
		beq $t2 $t3 exit
		
		addi $s1 $s1 1
		addi $s0 $s0 -1
		j loop
		
	exit: