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
    	jal printArray		# a0: �����׵�ַ��a1: ���鳤�ȣ� �޷���ֵ
    	
    	la $a0, data
    	li $a1, 8
    	jal bubbleSort		# a0: �����׵�ַ��a1: ���鳤�ȣ� �޷���ֵ
    	
    	la $a0, endl2
    	li $v0, 4
    	syscall
    	
     	la $a0, data
    	li $a1, 8
    	jal printArray		# a0: �����׵�ַ��a1: ���鳤�ȣ� �޷���ֵ	
    	
	li $v0, 10
	syscall

printArray:
    	move $t0, $a0		# t0 = a
    	move $t1, $a1		# t1 = n
	li $t2, 0    		# t2: ������
loop0:	lw $a0, ($t0)		# ���a[t2]
	li $v0, 1
	syscall
	la $a0, endl		# �������	
	li $v0, 4
	syscall
	addi $t0, $t0, 4
	addi $t2, $t2, 1
	blt $t2, $t1, loop0	# �ж�ѭ������
	jr $ra
	   
bubbleSort:
    	move $t0, $a0		# t0 = a
    	move $t1, $a1		# t1 = n
    	addi $t1, $t1, -1
	li $t2, 0    		# t2: �������� i
loop1:
	li $t3, 0		# t3: �ڲ������	j 
loop2:    
    	move $t4, $t3
    	sll $t4, $t4, 2
    	add $t4, $t0, $t4	# ��ȡ�±�
    	lw $a0, ($t4)
    	lw $a1, 4($t4)
    	ble $a0, $a1, continue
    	sw $a0, 4($t4)		# ����
    	sw $a1, ($t4)
continue:
    	addi $t3, $t3, 1
    	sub $t5, $t1, $t2
    	blt $t3, $t5, loop2 	# �ж��ڲ�ѭ������ j < n - 1 - i
    	addi $t2, $t2, 1
    	blt $t2, $t1, loop1	# �ж����ѭ������ i < n - 1
    	jr $ra			
    	
    
	
