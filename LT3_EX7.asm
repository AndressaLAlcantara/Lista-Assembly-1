.data
	msg1: .asciiz "\nDigite um numero entre 100 e 999: "
	msg2: .asciiz "\nCENTENA = "
	msg3: .asciiz "\nDEZENA = "
	msg4: .asciiz "\nUNIDADE = "

.text
main:
ler:
	#Número entre 100 a 999
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	add $t0, $v0, 0

	#Validar se < 100
	li $t7, 100
	blt $t0, $t7, ler

	#Validar se > 999
	li $t7, 999
	bgt $t0, $t7, ler

	#Centena
	li $t7, 100
	div $t0, $t7
	mflo $t1

	#resto da divisão por 100
	mfhi $t2

	#Dezena
	li $t7, 10
	div $t2, $t7
	mflo $t3

	#Unidade
	mfhi $t4

	#Mostrar centena
	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 1
	add $a0, $t1, 0
	syscall

	#Mostrar dezena
	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 1
	add $a0, $t3, 0
	syscall
	
	#Mostrar unidade
	li $v0, 4
	la $a0, msg4
	syscall

	li $v0, 1
	add $a0, $t4, 0
	syscall

	#Encerrar
	li $v0, 10
	syscall