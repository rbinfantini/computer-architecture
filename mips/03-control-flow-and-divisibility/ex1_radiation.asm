#Kaua Bezerra Brito - RA00364001
#Liam Vedovato Lopes - RA00359597
#Rafael Barros Infantini - RA00359394

#1) Para este exercicio criaremos um medidor imaginario de radiacao.
#Serao feitas tres classificacoes:
#	• Tipo 1: Caso o valor de radiacao esteja entre 1 e 30 (1 e 30 inclusos)
#	• Tipo 2: Caso o valor de radiacao esteja entre 31 e 79 (31 e 79 inclusos)
#	• Tipo 3: Caso o valor de radiacao seja maior ou igual a 80.
#Considere que o usuario ira digitar um valor de radiacao, sendo ele um numero inteiro positivo.
#Escreva um codigo em assembly do MIPS que implemente esse medidor. O programa devera receber o
#numero inteiro do usuario, e com base no valor deste numero, tomar diferentes decisoes.
#	• Se o numero estiver na classificacao "Tipo 1", devera ser armazenado o numero 1 em t5.
#	• Se o numero estiver na classificacao "Tipo 2", devera ser armazenado o numero 2 em t5.
#	• Se o numero estiver na classificacao "Tipo 3", devera ser armazenado o numero 3 em t5.

#Codigos do system call
#1 - Apresenta um inteiro ao usuario
#4 - Apresenta uma string ao usuario
#5 - Recebe um numero inteiro do usuario

.data
	prompt: .asciiz "Digite o valor de radiacao: "
	message: .asciiz "\nRadiacao Tipo: "
	
.text

		
addi $v0, $zero, 4 	#Define código da syscall 4 (imprimir string)		
la $a0, prompt		#Carrega o endereço da string "prompt" em $a0
syscall 		#Print da mensagem "Digite o valor de radiacao" (string - codigo 4)

addi $v0, $zero, 5	#Define código da syscall 5 (ler inteiro)
syscall 		#System call para ler o input do usuario
move $t0, $v0 		#Move o inteiro recebido de $v0 para $t0


slti $s1, $t0, 80 	#$s1 = 1 se (valor < 80), senão $s1 = 0
beq $s1, $zero, tipo3 	#Se valor >= 80, desvia para tipo3

slti $s1, $t0, 31 	#$s1 = 1 se (valor < 31), senão $s1 = 0
beq $s1, $zero, tipo2 	#Se valor >= 31, desvia para tipo2


tipo1:
li $t5, 1		#Armazena 1 em $t5 (Tipo 1: entre 1 e 30)
j saida			#Salta para a etapa de saída

tipo2:
li $t5, 2		#Armazena 2 em $t5 (Tipo 2: entre 31 e 79)
j saida			#Salta para a etapa de saída

tipo3:
li $t5, 3		#Armazena 3 em $t5 (Tipo 3: >= 80)
j saida			#Salta para a etapa de saída


saida:
addi $v0, $zero, 4 	#Define código da syscall 4 (imprimir string)
la $a0, message 	#Carrega o endereço da mensagem "Radiacao Tipo"
syscall 		#Imprime a mensagem na tela
  
addi $v0, $zero, 1	#Define código da syscall 1 (imprimir inteiro)
add $a0, $zero, $t5	#Move o valor do tipo (em $t5) para $a0
syscall 		#Imprime o valor do tipo de radiação