.data
	msg1: .asciiz "\nDigite o primeiro número inteiro: "
	msg2: .asciiz "\nDigite o segundo número inteiro: "
	msg3: .asciiz "\nMaior: "
	msg4: .asciiz "\nSomatório dos números ímpares entre eles: "

.text
main:
	#Primeiro valor
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#Segundo valor
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#Verificar o maior
se:
	bgt $t0, $t1, maior

senao:
	add $t2, $t1, 0  #maior
	add $t3, $t0, 0  #menor
	j fimse

maior:
	add $t2, $t0, 0 #maior
	add $t3, $t1, 0 #menor

fimse:

	# Mostrar mensagem
	li $v0, 4
	la $a0, msg3
	syscall

	# Mostrar resultado
	li $v0, 1
	add $a0, $t2, 0
	syscall
	
	#Soma dos ímpares
	li $t4, 0
	
	#Contador = menor + 1
	li $t7, 1
	add $t5, $t3, $t7

loop:
	#se contador >= maior -> fim
	bge $t5, $t2, fimloop
	
	#ver se é ímpar
	add $t6, $t5, 1
	
	#se for par, pular
	beq $t6, $zero, prox
	
	#soma = soma + contador
	add $t4, $t4, $t5
	
prox:
	li $t7, 1
	add $t5, $t5, $t7
	j loop
	
fimloop:
	#Mostrar mensagem
	li $v0, 4
	la $a0, msg4
	syscall

	#Mostrar resultado
	li $v0, 1
	add $a0, $t4, 0
	syscall

	#Encerrar
	li $v0, 10
	syscall
	
	
