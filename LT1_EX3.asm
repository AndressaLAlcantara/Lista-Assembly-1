.data
	msg1: .asciiz "\nDigite a quantidade de horas trabalhadas: "
	msg2: .asciiz "\nDigite a quantidade de horas extras: "
	msg3: .asciiz "\nSalário Bruto: "
	msg4: .asciiz "\Descontos: "
	msg5: .asciiz "\nSalário Líquido: "
.text
main:
	#Horas trabalhadas
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0,5
	syscall
	add $t0, $v0, 0
	
	#Horas Extras
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, 0
	
	#Desconto
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, 0

	#Calcular Salário
	li $t3, 10
	mul $t4, $t0, $t3          #Hora trabalhada * 10
	
	li $t3, 15
	mul $t5, $t0, $t3          # Hora extra * 15
	
	add $t6, $t4, $t5     #Salário Bruto
	
	sub $t7, $t6, $t2
			
	#Mostrar mensagem
	li $v0, 4
	la $a0, msg4
	syscall
	
	#Mostrar resultado (salário bruto)
	li $v0, 1
	add $a0, $t6, 0
	syscall
	
	#Mostrar resultado (salário líquido)
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 1
	add $a0, $t7, 0
	syscall
	
	#Encerrar	
	li $v0, 10
	syscall