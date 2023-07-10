      .data
array:   .space 60  
         .globl main
         .text
main:    li $t3,0
         la $t0,array
         add $t1,$0,$t0
         addi $t8,$t0,60
input:   li $v0,5
         syscall
         sw $v0,($t1)
         addi $t1,$t1,4
         addi $t3,$t3,1
         slti $s0,$t3,15
         bnez $s0,input
         addi $t3,$0,0
outloop:add $t1,$0,$t0
        slti $s0,$t3,15
        beqz $s0,print
        addi $t4,$t3,-1
inloop: slti $s0,$t4,0
        bnez $s0,exitinloop
        sll $t5,$t4,2
        add $t5,$t1,$t5
        lw $t6,($t5)
        lw $t7,4($t5)
        slt $s0,$t6,$t7
        bnez $s0,swap
        addi $t4,$t4,-1
        j inloop
swap:   sw $t6,4($t5)
        sw $t7,($t5)
        addi $t4,$t4,-1
        j inloop
exitinloop: 
        addi $t3,$t3,1
        j outloop
print:  lw $a0,($t0)
        li $v0,1
        syscall
         li $v0,11
       li $a0,32
       syscall
       addi $t0,$t0,4
       bne $t0,$t8,print
exit: li $v0,10
     syscall