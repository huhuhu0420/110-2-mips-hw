.data
data: .word 14,3,1,2,7,7,13,0,11,5,18,2,3
size: .word 13

.text
main: 
	la $s0 data
	lw $s1 size

	jal sort
	
	li $v0 10
	syscall

sort:
	addi $sp $sp -4
	sw $ra 0($sp)
	li $s2 0  #s2 = i
sort_j:
	beq $s2 $s1 sort_break  #i == n, break
	
	add $t0 $s2 $zero  #t0 = left
	add $t1 $s1 $zero  #t1 = right
	jal getMinIndex
	
	add $s3 $t4 $zero
	jal swap

	addi $s2 $s2 1  #i++
	j sort_j
	
sort_break:
	lw $ra 0($sp)
	addi $sp $sp 4
	jr $ra

swap:
	sll $t1 $s2 2
	add $t1 $s0 $t1  #&data[i]
	lw $t0 0($t1)  #t0 = data[i]
	sll $t2 $s3 2
	add $t2 $s0 $t2
	lw $t2 0($t2)  #t2 = data[index]

	sw $t2 0($t1)
			
	sll $t2 $s3 2
	add $t2 $s0 $t2

	sw $t0 0($t2)
	
	jr $ra

getMinIndex:
	addi $t3 $t0 1  #t3 = i = left + 1
	add $t4 $t0 $zero  #t4 = minIndex = left 
getMinIndex_j:
	beq $t3 $t1 getMinIndex_break  #i == right, break
	
	sll $t5 $t3 2
	add $t5 $s0 $t5
	lw $t5 0($t5)  #t5 = data[i]
	sll $t6 $t4 2
	add $t6 $s0 $t6
	lw $t6 0($t6)  #t4 = data[minIndex]
	
	bge $t5 $t6 notSmaller
	add $t4 $t3 $zero  #minIndex = i

notSmaller:	
	addi $t3 $t3 1  #i++
	j getMinIndex_j
	
getMinIndex_break:
	jr $ra
