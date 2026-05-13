.data
	msg1: .asciiz "\nDigite o valor da compra (1000 a 9999): "
	msg2: .asciiz "\nDigite o valor da parcela (100 a 500): "
	msg3: .asciiz "\nQuantidade de parcelas: "

.text
main:

lerCompra:

	#Valor da compra
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	add $t0, $v0, 0

	#Validar compra >= 1000
	li $t7, 1000
	blt $t0, $t7, lerCompra

	#Validar compra <= 9999
	li $t7, 9999
	bgt $t0, $t7, lerCompra

lerParcela:

	#Parcela
	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 5
	syscall
	add $t1, $v0, 0

	#Validar parcela >= 100
	li $t7, 100
	blt $t1, $t7, lerParcela

	#Validar parcela <= 500
	li $t7, 500
	bgt $t1, $t7, lerParcela

	#quantidade de parcelas
	div $t0, $t1
	mflo $t2   # resultado da divisão
	mfhi $t3   # resto

	#Se houver resto, soma mais 1 parcela
	beq $t3, $zero, mostrar

	li $t7, 1
	add $t2, $t2, $t7

mostrar:

	#Mostrar mensagem
	li $v0, 4
	la $a0, msg3
	syscall

	#Mostrar quantidade
	li $v0, 1
	add $a0, $t2, 0
	syscall

	#Encerrar
	li $v0, 10
	syscall