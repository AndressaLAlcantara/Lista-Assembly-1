.data
	msg1: .asciiz "\nDigite o valor da variável: "
	msg2: .asciiz "\nPar: "
	msg3: .asciiz "\nImpar: "
.text
main:
	#Valor da variável
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0,5
	syscall
	add $t0, $v0, 0
	
	#Verificar se é par
	rem $t1, $t0, 2
	
	beq $t1, 0, se
	j senao
	
se:
	add $t2, $t0, 5
	j fimse
	#Se for ímpar
senao:
	add $t2, $t0, 8
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