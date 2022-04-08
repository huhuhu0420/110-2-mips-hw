

.text

again:
	ll $t0 0($s1)
	addi $t0 $t0 1
	sc $t0 0($s1)
	beq $t1 $zero again
