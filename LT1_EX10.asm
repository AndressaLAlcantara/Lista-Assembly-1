.data
	msg1: .asciiz "\nDigite o primeiro numero: "
	msg2: .asciiz "\nDigite o segundo numero: "
	msg3: .asciiz "\nResto da divisao: "

.text
main:
	# Ler A
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, 0   
	
	# Ler B
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0  

	#Verificar maior e menor
	bgt $t0, $t1, se
	j senao

se:
	add $t2, $t0, 0   
	add $t3, $t1, 0   
	j fimse

senao:
	add $t2, $t1, 0   
	add $t3, $t0, 0   

fimse:

	# Divisão
	div $t2, $t3
	mflo $t4          

	# quociente * menor 
	mul $t5, $t4, $t3

	# resto = maior - resultado 
	sub $t6, $t2, $t5

	# Mostrar resultado 
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	add $a0, $t6, 0
	syscall

	# Encerrar
	li $v0, 10
	syscall