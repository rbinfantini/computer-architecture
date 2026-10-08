#Kaua Bezerra Brito - RA00364001
#Liam Vedovato Lopes - RA00359597
#Rafael Barros Infantini - RA00359394

#2) Implemente uma versão em assembly do MIPS do algoritmo BubbleSort. Considere que inicialmente
#deverão ser carregados 4 números, nos registradores t0, t1, t2 e t3. Após a execução do algoritmo os valores
#deverão estar ordenados em ordem crescente nos registradores. Por exemplo, dados os números 6 2 8 1,
#após o algoritmo teremos 1 em t0, 2 em t1, 6 em t2 e 8 em t3 (1 2 6 8). Caso o vetor esteja originalmente
#ordenado, deverá ser apresentada uma mensagem “Vetor já ordenado” para o usuário.

#Codigos do system call
#1 - Apresenta um inteiro ao usuario
#4 - Apresenta uma string ao usuario
#5 - Recebe um numero inteiro do usuario

.data
	msg1: .asciiz "Digite o primeiro numero: "
	msg2: .asciiz "Digite o segundo numero: "
	msg3: .asciiz "Digite o terceiro numero: "
	msg4: .asciiz "Digite o quarto numero: "
	msgOrd: .asciiz "\nVetor ja ordenado\n"

.text

addi $v0, $zero, 4
la $a0, msg1
syscall

addi $v0, $zero, 5
syscall
add $t0, $zero, $v0


addi $v0, $zero, 4
la $a0, msg2
syscall

addi $v0, $zero, 5
syscall
add $t1, $zero, $v0


addi $v0, $zero, 4
la $a0, msg3
syscall

addi $v0, $zero, 5
syscall
add $t2, $zero, $v0


addi $v0, $zero, 4
la $a0, msg4
syscall

addi $v0, $zero, 5
syscall
add $t3, $zero, $v0


move $s2, $t0
move $s3, $t1
move $s4, $t2
move $s5, $t3


jal bubbleSort


bne $t0, $s2, fim
bne $t1, $s3, fim
bne $t2, $s4, fim
bne $t3, $s5, fim


addi $v0, $zero, 4
la $a0, msgOrd
syscall
j fim


bubbleSort:

li $s0, 0              # i = 0

loop_i:
beq $s0, 3, fimSort   # se i == 3 ? termina

li $s1, 0              # j = 0

loop_j:
sub $t6, $zero, $s0    # t6 = -i
addi $t6, $t6, 3       # t6 = 3 - i
beq $s1, $t6, prox_i   # se j == (3 - i), próxima passada


beq $s1, 0, comp01
beq $s1, 1, comp12
beq $s1, 2, comp23


comp01:
slt $t4, $t1, $t0      # se t1 < t0 ? precisa trocar
beq $t4, $zero, cont01
move $t5, $t0
move $t0, $t1
move $t1, $t5

cont01:
addi $s1, $s1, 1
j loop_j


comp12:
slt $t4, $t2, $t1
beq $t4, $zero, cont12
move $t5, $t1
move $t1, $t2
move $t2, $t5

cont12:
addi $s1, $s1, 1
j loop_j


comp23:
slt $t4, $t3, $t2
beq $t4, $zero, cont23
move $t5, $t2
move $t2, $t3
move $t3, $t5

cont23:
addi $s1, $s1, 1
j loop_j


prox_i:
addi $s0, $s0, 1
j loop_i


fimSort:
jr $ra


fim: