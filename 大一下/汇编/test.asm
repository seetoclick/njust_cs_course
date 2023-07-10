	.data
	.align 2
x:	.half 0
y:	.half 32767
	.text
main:	
	lbu $t0, y
	
	lbu $t1, y + 1
	
#	la $t2, y + 1
#	lh $a0, ($t2)
#	li $v0, 1
#	syscall	
#	li $t5, 0
#	divu $t5, $t5
#	mfhi $a0	

	li $t6, 2147483640
	add $t6, $t6, $t6

#	li $t5, 5
#	li $t6, 0
#	div $a0, $t5, $t6
#	li $v0, 1
#	syscall
	
	
#	sll $t1, $t1, 8
#	or $t0, $t0, $t1
#	sw $t0, x
	
#	la $t2, y
#	lw $a0, ($t2)
#	li $v0, 1
#	syscall 
exit:
	li $v0, 10
	syscall
