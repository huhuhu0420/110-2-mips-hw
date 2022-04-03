.data
    userInput: .space 50
    user : .asciiz "AMOGUS"
.text
main:
    li $v0, 54
    la $a0,user
    la $a1,userInput
    li $a2,30
    syscall
    li $v0,55
    li $a1,2
    la $a0,userInput
    syscall
    