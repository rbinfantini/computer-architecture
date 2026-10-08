#Kaua Bezerra Brito - RA00364001
#Liam Vedovato Lopes - RA00359597
#Rafael Barros Infantini - RA00359394

#3) Faca um codigo em assembly do MIPS que dados dois numeros, A e B, inteiros e positivos, digitados
#pelo usuario, calcula o maximo divisor comum destes dois numeros e armazena esse valor em t5.
#Dica: E possivel utilizar a instrucao rem para calcular o resto da divisao.

.data
	promptA: .asciiz "Digite o valor de A (inteiro e positivo): "
	promptB: .asciiz "Digite o valor de B (inteiro e positivo): "
	message: .asciiz "O MDC calculado e: "

.text
	
addi $v0, $zero, 4 	#Define o código da syscall para imprimir string		
la $a0, promptA		#Carrega o endereço da mensagem de A
syscall 		#Exibe a mensagem na tela

addi $v0, $zero, 5	#Define o código da syscall para leitura de inteiro
syscall 		#Lê o valor digitado (resultado em $v0)
move $t0, $v0 		#Armazena o valor de A em $t0

		
addi $v0, $zero, 4 	#Define o código da syscall para imprimir string		
la $a0, promptB		#Carrega o endereço da mensagem de B
syscall 		#Exibe a mensagem na tela

addi $v0, $zero, 5	#Define o código da syscall para leitura de inteiro
syscall 		#Lê o valor digitado (resultado em $v0)
move $t1, $v0 		#Armazena o valor de B em $t1


loop:
beq $t1, $zero, MDC 	#Se B == 0, o valor atual de A é o MDC final
rem $t2, $t0, $t1 	#Calcula o resto da divisão A % B
move $t0, $t1 		#Atualiza A com o valor anterior de B
move $t1, $t2 		#Atualiza B com o resto da divisão
j loop			#Repete o processo até B ser 0


MDC:
move $t5, $t0 		#Armazena o MDC final no registrador $t5
addi $v0, $zero, 4 	#Define o código da syscall para imprimir string
la $a0, message 	#Carrega a mensagem "O MDC calculado e: "
syscall 		#Exibe a mensagem

addi $v0, $zero, 1	#Define o código da syscall para imprimir inteiro
add $a0, $zero, $t5	#Move o valor do MDC para $a0
syscall 		#Exibe o valor do MDC