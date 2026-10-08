#Kaua Bezerra Brito - RA00364001
#Liam Vedovato Lopes - RA00359597
#Rafael Barros Infantini - RA00359394

#2) Faca um codigo em assembly do MIPS que dado um numero digitado pelo usuario, verifica se esse
#numero e primo. Caso o numero seja primo, devera ser apresentada na tela a mensagem "Primo", caso
#contrario, devera ser apresentada na tela a mensagem "Nao e Primo". Considere que o usuario ira digitar
#um numero inteiro e maior que 1.

#Codigos do system call
#1 - Apresenta um inteiro ao usuario
#4 - Apresenta uma string ao usuario
#5 - Recebe um numero inteiro do usuario

.data 
	prompt: .asciiz "Digite um numero: "
	messageP: .asciiz "\nPrimo"
	messageNP: .asciiz "\nNao e Primo"
	
.text
	
addi $v0, $zero, 4 	#Define o código da syscall para impressão de string		
la $a0, prompt		#Carrega o endereço da mensagem "Digite um numero"
syscall 		#Exibe a mensagem na tela

addi $v0, $zero, 5	#Define o código da syscall para leitura de inteiro
syscall 		#Lê o número digitado (resultado vai para $v0)
move $t0, $v0 		#Move o valor lido para $t0 (número a ser testado)


li $t6, 2 		#Primeiro valor a dividir a entrada do usuario


for:
beq $t6, $t0, Primo     #Se o divisor for igual ao número, não há divisores -> é primo

rem $t3, $t0, $t6       #Calcula o resto da divisão: número % divisor
beq $t3, $zero, NP      #Se o resto for 0, o número é divisível -> não é primo

addi $t6, $t6, 1        #Incrementa o divisor (testa o próximo valor)
j for			#Volta para o início do loop


NP:
addi $v0, $zero, 4 	#Define syscall para imprimir string
la $a0, messageNP 	#Carrega a mensagem "Nao e primo"
syscall 		#Exibe a mensagem
j fim			#Encerra o programa

Primo:
addi $v0, $zero, 4 	#Define syscall para imprimir string
la $a0, messageP 	#Carrega a mensagem "Primo"
syscall 		#Exibe a mensagem


fim: