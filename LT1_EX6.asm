.data
	msg1: .asciiz "\nDigite o valor de A: "
	msg2: .asciiz "\nDigite o valor de B: "
	msg3: .asciiz "\nValor de C: "
.text
main:
	#Valor de A
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0,5
	syscall
	add $t0, $v0, 0
	
	#Valor de B
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0

	beq $t0, $t1, se
	j senao
se:
	add $t2, $t0, $t1		
	j fimse

senao:
	mul $t2, $t0, $t1
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

	
	
	
