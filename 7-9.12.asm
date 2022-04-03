#quarters  dimes  nickels  pennies
#   25      10      5         1
.data
	quarter: .asciiz " quarter, "
	dime: .asciiz " dime, "
	nickel: .asciiz " nickel, and "
	penny: .asciiz " penny"
	quarters: .asciiz " quarters, "
	dimes: .asciiz " dimes, "
	nickels: .asciiz " nickels, and "
	pennies: .asciiz " pennies"

.text
main:
	li $v0 5
	syscall
	move $s0 $v0  #s0 = money

getQuarters:
	li $t0 25
	div $s1 $s0 $t0 #s1 = quarters
	# $hi = remainder, $lo = quotient
	mfhi $s0 # or use rem $s0 $s0 $t0

getDimes:
	li $t0 10
	div $s2 $s0 $t0
	mfhi $s0  #$s2 = dimes

getNickles:
	li $t0 5
	div $s3 $s0 $t0
	mfhi $s0  #$s3 = nickels, $s0 = pennies

printOutcome:
	li $v0 1
	add $a0 $s1 $0
	syscall
	bgt $s1 1 printQuarters
	ble $s1 1 printQuarter
	
printQ_ret:
	li $v0 1
	add $a0 $s2 $0
	syscall
	
	bgt $s2 1 printDimes
	ble $s2 1 printDime
printD_ret:
	li $v0 1
	add $a0 $s3 $0
	syscall
	
	bgt $s3 1 printNickels
	ble $s3 1 printNickel
printN_ret:
	li $v0 1
	add $a0 $s0 $0
	syscall
	
	bgt $s0 1 printPennies
	ble $s0 1 printPenny

printP_ret:
	li $v0 10
	syscall

printQuarter:
	la $a0 quarter
	li $v0 4
	syscall
	j printQ_ret
	
printQuarters:
	la $a0 quarters
	li $v0 4
	syscall
	j printQ_ret
printDime:
	la $a0 dime
	li $v0 4
	syscall
	j printD_ret
printDimes:
	la $a0 dimes
	li $v0 4
	syscall
	j printD_ret
	
printNickel:
	la $a0 nickel
	li $v0 4
	syscall
	j printN_ret
printNickels:
	la $a0 nickels
	li $v0 4
	syscall
	j printN_ret
printPenny:
	la $a0 penny
	li $v0 4
	syscall
	j printP_ret
printPennies:
	la $a0 pennies
	li $v0 4
	syscall
	j printP_ret
