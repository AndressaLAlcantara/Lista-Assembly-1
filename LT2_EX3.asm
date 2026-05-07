.data
	msg1: .asciiz "\nDigite o primeiro valor inteiro: "
	msg2: .asciiz "\nDigite o segundo valor inteiro: "
	msg3: .asciiz "\nSubtracao: "
.text
main:
	#Primeiro valor inteiro
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#Segundo valor inteiro
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
se:
	bgt $t0, $t1, maior
senao:
	sub $t2, $t1, $t0
	j fimse
maior:
	sub $t2, $t0, $t1
fimse:
	#Mostrar mensagem
	li $v0, 4
	la $a0, msg3
	syscall
	
	#Mostrar resultado
	li $v0, 1
	add $a0, $t2, 0
	syscall
	
	#Encerrar	
	li $v0, 10
	syscall
	
	