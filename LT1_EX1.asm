.data
	msg1: .asciiz "\nDigite o comprimento do terreno: "
	msg2: .asciiz "\nDigite a largura do terreno: "
	msg3: .asciiz "\nArea "
.text
main:
	#Comprimento
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0,5
	syscall
	add $t0, $v0, 0
	
	#Largura
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#Calcular a área (multiplicação)
	mul $t2, $t0, $t1          #$t2= $t0 * $t1
	
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
	
	
	