.data
	msg1: .asciiz "\nDigite o salário atual: "
	msg2: .asciiz "\nNovo salário: "
.text
main:
	#Salário atual
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0

	#Calculando o novo salário
	mul $t1, $t0, 25
	div $t2, $t1, 100
	add $t3, $t2, $t0
	
	#Mostrar mensagem
	li $v0, 4
	la $a0, msg2
	syscall

	#Mostrar resultado
	li $v0, 1
	add $a0, $t3, 0
	syscall

	#Encerrar
	li $v0, 10
	syscall
	
