.data
	double5: .double 5.0
	double3: .double 3.0
	double2: .double 2.0
	double4: .double 4.0
	InputX: .asciiz "Enter x"
	InputY: .asciiz "Enter y"
	InputZ: .asciiz "Enter z"
	nextline: .asciiz "\n"

.text
	main:
		la $a0 InputX
		li $v0 4
		syscall
		li $v0 7
		syscall
		mov.d $f2 $f0  #f2 = x
		la $a0 InputY
		li $v0 4
		syscall
		li $v0 7
		syscall
		la $a0 InputX
		li $v0 4
		syscall
		mov.d $f4 $f0  #f4 = y
		li $v0 7
		syscall
		mov.d $f6 $f0  #f6 = z
		
	typeA:
		#5x + 3y + z
		l.d $f8 double5
		l.d $f10 double3
		mul.d $f14 $f8 $f2  #f14 = 5x
		mul.d $f16 $f10 $f4  #f16 = 3y
		add.d $f14 $f14 $f16  #f14 = 5x + 3y
		add.d $f12 $f6 $f14  #f12 = 5x + 3y + z
		li $v0 3
		syscall
		la $a0 nextline
		li $v0 4
		syscall
	typeB:
		#(5x + 3y + z) / 2 * 3
		l.d $f8 double2
		div.d $f12 $f12 $f8  #f12 = (5x + 3y + z) / 2 
		mul.d $f12 $f12 $f10  #f12 = (5x + 3y + z) / 2 * 3
		li $v0 3
		syscall
		li $v0 4
		syscall
	typeC:
		# x^3 + 2x^2 + 3x + 4
		l.d $f12 double4  #f8 = 4
		mul.d $f14 $f2 $f2
		mul.d $f16 $f14 $f8  #f16 = 2x^2 
		mul.d $f14 $f14 $f2  #f14 = x^3
		mul.d $f18 $f2 $f10  #f18 = 3x
		add.d $f12 $f14 $f12
		add.d $f12 $f12 $f16
		add.d $f12 $f12 $f18  #F12 = x^3 + 2x^2 + 3x + 4
		li $v0 3
		syscall
		li $v0 4
		syscall
	typeD:
		#(4x / 3) * y 
		l.d $f12 double4 
		mul.d $f14 $f12 $f2
		div.d $f14 $f14 $f10  #f14 = 4x / 3
		mul.d $f12 $f14 $f4
		li $v0 3
		syscall
		addi $v0, $zero, 10	 
		syscall
	
		
		
		
		
