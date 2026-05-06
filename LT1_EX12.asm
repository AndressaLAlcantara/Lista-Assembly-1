.data
	msg1: .asciiz "\nDigite a altura (cm): "
	msg2: .asciiz "\nMenor altura: "
	msg3: .asciiz "\nMaior altura: "
.text
main:
	li $t0, 0        # contador (0 até 14)

	# Ler primeira altura
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0   # altura

	# inicializa menor e maior
	add $t2, $t1, 0   # menor
	add $t3, $t1, 0   # maior

	addi $t0, $t0, 1  # contador = 1

loop:
	beq $t0, 15, fim   # já leu 15 ? termina

	# ler próxima altura
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0   # altura atual

	# verificar menor
	blt $t1, $t2, menor
	j verifica_maior

menor:
	add $t2, $t1, 0   # atualiza menor

verifica_maior:
	# verificar maior
	bgt $t1, $t3, maior
	j continua

maior:
	add $t3, $t1, 0   # atualiza maior

continua:
	addi $t0, $t0, 1
	j loop

fim:
	# mostrar menor
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	add $a0, $t2, 0
	syscall

	# mostrar maior
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	add $a0, $t3, 0
	syscall

	# encerrar
	li $v0, 10
	syscall