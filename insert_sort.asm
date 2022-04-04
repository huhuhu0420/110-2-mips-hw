.data
	data: .word 9,3,2,1,8,11,1
	comma: .asciiz ","

.text
main:
	la $s0 data  #s0 = data

insertSort:
	li $s1 1  #s1 = i = 1
insertSort_j:
	bge $s1 7 insertSort_break
	sll $t0 $s1 2  #t0 = 4i
	add $t1 $t0 $s0  #t1 = &data[i]
	lw $t1 0($t1)  #t1 = temp = data[i]
	
jloop:
	addi $s2 $s1 -1  #s2 = j = i-1
jloop_j:
	blt $s2 $zero jloop_break  #if(j < 0) break
	sll $t2 $s2 2  #t2 = 4j
	add $t3 $s0 $t2  #t3 = &data[j]
	lw $t3 0($t3)  #t3 = data[j] 
	
	bge $t1 $t3 jloop_break  #if(temp > data[j]) break
	
	addi $t4 $s2 1  #t4 = j + 1
	sll $t4 $t4 2  #t4 = 4(j + 1)
	add $t4 $t4 $s0  #t4 = &data[j+1]
	
	sw $t3 0($t4)   #data[j+1] = data[j]
	addi $s2  $s2 -1   #j -= 1 
	j jloop_j
jloop_break:
	addi $t4 $s2 1  #t4 = j + 1
	sll $t4 $t4 2  #t4 = 4(j + 1)
	add $t4 $t4 $s0  #t4 = &data[j+1]
	sw $t1 0($t4)  #data[j+1] = temp

	addi $s1 $s1 1  #i++
	j insertSort_j

insertSort_break:
printData:
	li $t0 0  #t0 = i = 0	
print_j:
	bge $t0 7 end
	sll $t1 $t0 2
	add $t2 $t1 $s0 
	lw $a0 0($t2)
	li $v0 1
	syscall  #print data[i]
	la $a0 comma
	li $v0 4
	syscall
	addi $t0 $t0 1  #i++
	j print_j
	
end:
	li $v0 10
	syscall
	
	
	
