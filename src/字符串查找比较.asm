.data
	buffer: .word 0:1024
	successStr: .asciiz "Success! Location: "
	failStr: .asciiz "Fail!"
	enterStr: .asciiz "\r\n"	
.text
main:
#获取输入字符串
	la $a0, buffer
	li $a1, 1024	
	li $v0, 8
	syscall
			
#输入查找字符
getChar:
	li $v0, 12
	syscall
	move $s0, $v0
	jal enter	
	beq $s0, '?', exit
	li $t0, 0
	la $t1, buffer
#比较是否相等
compare:
	add $t2, $t1, $t0
	lbu $t3, ($t2)
	beq $t3, '\0', fail		
	beq $s0, $t3, success
	addi $t0, $t0, 1
	j compare

#success
success:
	li $v0, 4
	la $a0, successStr
	syscall
	
	li $v0, 1
	addi $t0, $t0, 1
	la $a0, ($t0)
	syscall
	
	jal enter
	j getChar	
#fail
fail:
	li $v0, 4
	la $a0, failStr
	syscall

	jal enter	
	j getChar	

#结束,输入？
exit:
	li $v0, 10
	syscall
	
#换行
enter:
	li $v0, 4
	la $a0, enterStr	
	syscall
	jr $ra
