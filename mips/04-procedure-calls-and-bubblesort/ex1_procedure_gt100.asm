#Kaua Bezerra Brito - RA00364001
#Liam Vedovato Lopes - RA00359597
#Rafael Barros Infantini - RA00359394

#1) Com base no código fornecido no Teams que realiza uma chamada de procedimento no MIPS, faça
#o seguinte exercício. Faça um código em assembly do MIPS que dado um número, armazenado em t0, realiza
#uma chamada de procedimento que verifica se o número é maior que 100. Caso o número seja, após o
#retorno da função (procedimento) deve ser armazenado o valor 999 em t5. Caso contrário, deve ser
#armazenado o valor 100 em t5.

#Codigos do system call
#1 - Apresenta um inteiro ao usuario
#4 - Apresenta uma string ao usuario
#5 - Recebe um numero inteiro do usuario

.data 
	prompt:	.asciiz "Digite um numero: "
  
.text
	
addi $v0, $zero, 4  			
la $a0, prompt		
syscall   

addi $v0, $zero, 5	
syscall

add $t0, $zero, $v0

jal maiorQueCem       
beq $t1, 0, maior
li $t5, 100
j fim	      

maiorQueCem:
    slti $t1, $t0, 101
    jr $ra

maior:
	li $t5, 999

fim: