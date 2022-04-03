.data
	a: .word 3
	b: .word 1
	c: .word 2

.text
	lw $t0 a
	lw $t1 b
	lw $t2 c
	sub $t3 $t0 $t1
	add  $t4 $t3 $t2 