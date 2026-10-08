#Kauã Bezerra Brito - RA00364001
#Liam Vedovato Lopes - RA00359597
#Rafael Barros Infantini - RA00359394

#1) Com base no código fornecido no Teams(Aula 08), vocês deverão fazer um código que irá armazenar
#um valor em um endereço de memória específico da memória de dados do MIPS.
#	• O valor armazenado deve ser o inteiro correspondente à soma dos dois últimos dígitos do seu RA.
#	• O endereço de memória deve ser a próxima posição válida partir do início, onde o offset é a soma
#dos dígitos do seu RA.(Ex: Se a soma for 15, o offset será 16; se a soma for 8, o offset será 8)
#OBS: Em casos de grupos com dois ou três integrantes, escolham o RA de um dos integrantes.

li $t0, 0	#Primeiro numero do RA atribuido a t0
li $t1, 0	#Segundo numero do RA atribuido a t1
li $t2, 3	#Terceiro numero do RA atribuido a t2
li $t3, 6	#Quarto numero do RA atribuido a t3
li $t4, 4	#Quinto numero do RA atribuido a t4
li $t5, 0	#Sexto numero do RA atribuido a t5
li $t6, 0	#Penultimo numero do RA atribuido a t6
li $t7, 1	#Ultimo numero do RA atribuido a t7

li $s0, 0   		#Inicializa soma dos numeros do RA
add $s0, $s0, $t0	#Adiciona o primeiro numero do RA
add $s0, $s0, $t1	#Adiciona o segundo numero do RA
add $s0, $s0, $t2	#Adiciona o terceiro numero do RA
add $s0, $s0, $t3	#Adiciona o quarto numero do RA
add $s0, $s0, $t4	#Adiciona o quinto numero do RA
add $s0, $s0, $t5	#Adiciona o sexto numero do RA
add $s0, $s0, $t6	#Adiciona o setimo numero do RA
add $s0, $s0, $t7	#Adiciona o oitavo numero do RA

add $t8, $t6, $t7    #Calcula a soma dos dois ultimos numero do RA

li $s1, 268500992    #Define o endereço base da memória

li $t9, 0            #Inicializa o contador do offset com 0

loop:
	addi $t9, $t9, 4     #Incrementa o offset em 4 bytes (avança para a próxima palavra de memória)
	blt $t9, $s0, loop   #Se o offset atual ($t9) for menor que a soma total do RA ($s0), volta pro loop

add $s1, $t9, $s1    	#Soma o offset final ao endereço base para obter o endereço de memória exato
sw $t8, ($s1)         	#Armazena o valor (soma dos 2 últimos dígitos) no endereço de memória calculado