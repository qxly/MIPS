.data
	#var1:	.word 1
	#array1	.byte	'a','b'
	#array2:	.space 40
	#array1:	.space	12
	#string1: .asciiz "print this.\n"
	var1: .word
	#var2: .word 0
.text
	la $a0, var1
	li $a1, 1000	
	li $v0, 8
	syscall
	#li $t1, 2
	#sw $t1, ($t0)
	#li $t1, 5
	#sw $t1, var1
	#la $t0, array1
	#li $t1, 5
	#sw $t1,($t0)
	
	#li $t1, 13
	#sw $t1, 4($t0)
	
	#li $t1, -7
	#sw $t1, 8($t0)
main:	#li $t2, 1
	#la $a0, string1
	#sll $t1, $t2, 2
	#sw $t2, var2
	#sw $t1, var1
	#syscall
	
	
	
