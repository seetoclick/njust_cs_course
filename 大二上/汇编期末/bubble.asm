    	.data
endl: 	.asciiz " "
endl2: 	.asciiz "\n"
    	.align 2
data:  	.word 10, 23, 33, 5, 20, 77, 13, 28
    	.globl main
    	.text
main:
    	la $a0, data
    	li $a1, 8
    	jal printArray		# a0: 数组首地址；a1: 数组长度； 无返回值
    	
    	la $a0, data
    	li $a1, 8
    	jal bubbleSort		# a0: 数组首地址；a1: 数组长度； 无返回值
    	
    	la $a0, endl2
    	li $v0, 4
    	syscall
    	
     	la $a0, data
    	li $a1, 8
    	jal printArray		# a0: 数组首地址；a1: 数组长度； 无返回值	
    	
	li $v0, 10
	syscall

printArray:
    	move $t0, $a0		# t0 = a
    	move $t1, $a1		# t1 = n
	li $t2, 0    		# t2: 计数器
loop0:	lw $a0, ($t0)		# 输出a[t2]
	li $v0, 1
	syscall
	la $a0, endl		# 输出换行	
	li $v0, 4
	syscall
	addi $t0, $t0, 4
	addi $t2, $t2, 1
	blt $t2, $t1, loop0	# 判断循环条件
	jr $ra
	   
bubbleSort:
    	move $t0, $a0		# t0 = a
    	move $t1, $a1		# t1 = n
    	addi $t1, $t1, -1
	li $t2, 0    		# t2: 外层计数器 i
loop1:
	li $t3, 0		# t3: 内层计数器	j 
loop2:    
    	move $t4, $t3
    	sll $t4, $t4, 2
    	add $t4, $t0, $t4	# 获取下标
    	lw $a0, ($t4)
    	lw $a1, 4($t4)
    	ble $a0, $a1, continue
    	sw $a0, 4($t4)		# 交换
    	sw $a1, ($t4)
continue:
    	addi $t3, $t3, 1
    	sub $t5, $t1, $t2
    	blt $t3, $t5, loop2 	# 判断内层循环条件 j < n - 1 - i
    	addi $t2, $t2, 1
    	blt $t2, $t1, loop1	# 判断外层循环条件 i < n - 1
    	jr $ra			
    	
    
	
