.data
	msg1: .asciiz "\nDigite o primeiro número inteiro: "
	msg2: .asciiz "\nDigite o segundo número inteiro: "
	msg3: .asciiz "\nOs valores são iguais"
	msg4: .asciiz "\nMaior"
	msg5: .asciiz "\nMenor"
.text
main:
	#Primeiro número
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	#Segundo número
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0

se:
	beq $t0, $t1, iguais
	bgt $t0, $t1, maior1
	
menor1:
	add $t2, $t1, 0
	add $t3, $t0, 0
	j mostrar
	
maior1:
	add $t2, $t0, 0
	add $t3, $t1, 0
	j mostrar
	
iguais:
	li $v0, 4
	la $a0, msg3
	syscall
	j fim

mostrar:
	#Mostrar maior
	li $v0, 4
	la $a0, msg4
	syscall

	li $v0, 1
	add $a0, $t2, 0
	syscall

	#Mostrar menor
	li $v0, 4
	la $a0, msg5
	syscall

	li $v0, 1
	add $a0, $t3, 0
	syscall
	
fim:
	#Encerrar
	li $v0, 10
	syscall

