.data
	msg1: .asciiz "\nDigite o valor da variável: "
	msg2: .asciiz "\nPositivo: "
	msg3: .asciiz "\nNegativo: "
.text
main:
	#Valor da variável
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0,5
	syscall
	add $t0, $v0, 0
	
	#Verificar se é positivo
	bge $t0, 0, se
	j senao
	
se:
	add $t2, $t0, $t0
	j fimse
	
	#Se for negativo
senao:
	li $t1, 3
	mul $t2, $t0, $t1
fimse:	
	#Mostrar mensagem
	li $v0, 4
	la $a0, msg2
	syscall
	
	#Mostrar resultado
	li $v0, 1
	add $a0, $t2, 0
	syscall
	
	#Encerrar	
	li $v0, 10
	syscall