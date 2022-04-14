.data
	heavy: .asciiz "too heavy\n"
	light: .asciiz "too light\n"
	double100: .double 100
	heavyP: .double 24
	lightP: .double 18.5

.text
main:
	l.d $f6 double100  #f6 = 100
	l.d $f8 heavyP  #f8 = 24
	l.d $f10 lightP  #f10 = 18.5
	li $v0 7
	syscall
	mov.d $f2 $f0  #f2 = height
	li $v0 7
	syscall
	mov.d $f4 $f0  #f4 = weight
	
	div.d $f2 $f2 $f6
	mul.d $f2 $f2 $f2
	div.d $f2 $f4 $f2  #f2 = bmi

	###############
	c.lt.d $f8 $f2 
	bc1t tooHeavy
	
	c.lt.d $f2 $f10
	bc1t tooLight
	##############
	
	j default
	
tooHeavy:
	la $a0 heavy
	li $v0 4
	syscall
	j default
	
tooLight:
	la $a0 light
	li $v0 4
	syscall
	j default

default:
	mul.d $f2 $f2 $f6
	################
	cvt.w.d $f14 $f2
	cvt.d.w $f14 $f14
	################
	div.d $f14 $f14 $f6

	mov.d $f12 $f14
	li $v0 3
	syscall
