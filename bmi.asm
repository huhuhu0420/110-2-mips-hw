.data
	getHeight: .asciiz "enter height:"
	getWeight: .asciiz "enter weight:"
	const: .float 100

.text
	#prompt height
	li $v0 4
	la $a0 getHeight  #print
	syscall
	li $v0 5  #scanf
	syscall 
	mtc1 $v0 $f0  #f0 = height
	
	#prompt weight
	li $v0 4
	la $a0 getWeight  #print
	syscall
	li $v0 5  #scanf
	syscall
	mtc1 $v0 $f1  #f1 = weight 
	
	#calculate	
	cvt.s.w $f0 $f0
	cvt.s.w $f1 $f1
	l.s $f3, const  #f3 = 100
	div.s $f0 $f0 $f3  #f0 = height/100
	mul.s $f0 $f0 $f0  #f0 = (height/100)^2
	div.s $f12 $f1 $f0  #f12 = BMI
	
	#output
	li $v0 2
	syscall
	
	
	
