.data
	msg1: .asciiz "\nDigite o valor de A na equação de segundo grau: "
	msg2: .asciiz "\nDigite o valor de B na equação de segundo grau: "
	msg3: .asciiz "\nDigite o valor de C na equação de segundo grau: "
	msg4: .asciiz "\nDUAS RAÍZES REAIS"
	msg5: .asciiz "\nUMA RAÍZ REAL"
	msg6: .asciiz "\nNÃO EXISTEM RAÍZES REAIS"
.text
main:
	#Valor de A
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#Valor de B
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#Valor de C
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0
	
	#Calculando delta    #b^2 - 4 * A * C
	mul $t3, $t1, $t1
	mul $t4, $t0, $t2
	mul $t5, $t4, 4
	sub $t6, $t3, $t5
	
se:
	bgtz $t6, duas
	beq $t6, $zero, uma
	bltz $t6, nenhuma
	
duas:
	li $v0, 4
	la $a0, msg4
	syscall
	j fim

uma: 
	li $v0, 4
	la $a0, msg5
	syscall
	j fim

nenhuma:
	li $v0, 4
	la $a0, msg6
	syscall
	
fim:
	#Encerrar
	li $v0, 10
	syscall
	
