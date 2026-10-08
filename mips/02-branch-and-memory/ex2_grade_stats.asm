#Kauã Bezerra Brito - RA00364001
#Liam Vedovato Lopes - RA00359597
#Rafael Barros Infantini - RA00359394

#2) Considere que as primeiras 10 posições da memória de dados do MIPS armazenam valores
#correspondentes a notas que os alunos da disciplina “Arquitetura de Computadores” obtiveram na P1. Faça
#um código em assembly do MIPS que deverá:
#	• Armazenar a maior nota em t5;
#	• Armazenar a menor nota em t6;
#	• Armazenar a quantidade de notas menores que 5,0 em t7;
#OBS: O conteúdo das primeiras 10 posições da memória de dados do MIPS deverá ser inicializado com
#valores arbitrários para as notas, escolhidos por vocês, entre 0 e 10, no início do código.

li $s0, 268500992    	#Define o endereço base da memória
li $s1, 0		#Inicializa o contador = 0

li $t0, 1		#Nota 1
li $t1, 2		#Nota 2
li $t2, 3		#Nota 3
li $t3, 4		#Nota 4
li $t4, 5		#Nota 5
li $t5, 6		#Nota 6
li $t6, 7		#Nota 7
li $t7, 8		#Nota 8
li $t8, 9		#Nota 9
li $t9, 10		#Nota 10
	
sw $t0, ($s0)		#Armazena o valor de $t0 no endereço base
sw $t1, 4($s0)		#Armazena o valor de $t1 no endereço base + 4 bytes
sw $t2, 8($s0)		#Armazena o valor de $t2 no endereço base + 8 bytes
sw $t3, 12($s0)		#Armazena o valor de $t3 no endereço base + 12 bytes
sw $t4, 16($s0)		#Armazena o valor de $t4 no endereço base + 16 bytes
sw $t5, 20($s0)		#Armazena o valor de $t5 no endereço base + 20 bytes
sw $t6, 24($s0)		#Armazena o valor de $t6 no endereço base + 24 bytes
sw $t7, 28($s0)		#Armazena o valor de $t7 no endereço base + 28 bytes
sw $t8, 32($s0)		#Armazena o valor de $t8 no endereço base + 32 bytes
sw $t9, 36($s0)		#Armazena o valor de $t9 no endereço base + 36 bytes

lw $t5, ($s0)		#Carrega o primeiro valor como maior
lw $t6, ($s0)		#Carrega o primeiro valor como menor
sub $t7, $t7, $t7	#Zera o contador de valores menores que 5

loop:
	beq $s1, 10, fim	#Se já percorreu 10 elementos, termina o programa
	lw $s2, ($s0)		#Carrega a nota atual
	
	slt $s3, $t5, $s2	#Se (maior_atual < valor_atual) então $s3 = 1
	beq $s3, 0, nao_maior	#Se não for maior, pula para o label nao_maior
	addi $t5, $s2, 0	#Atualiza o maior com o valor atual

nao_maior:
	slt $s3, $s2, $t6	#Se (valor_atual < menor_atual) então $s3 = 1
	beq $s3, 0, nao_menor	#Se não for menor, pula para o label nao_menor
	addi $t6, $s2, 0	#Atualiza o menor com o valor atual

nao_menor:
	slti $s3, $s2, 5	#Se (valor_atual < 5) então $s3 = 1
	beq $s3, 0, continua	#Se não for menor que 5, pula incremento
	addi $t7, $t7, 1	#Incrementa contador de valores menores que 5

continua:
	addi $s0, $s0, 4   	#Avança para o próximo endereço
	addi $s1, $s1, 1  	#Incrementa o índice do loop
	j loop			#Volta para o início do loop

fim: