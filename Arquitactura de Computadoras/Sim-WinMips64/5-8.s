.data
c1: .asciiz 'ABCDEFGH'
c2: .asciiz 'ABCDE'
equals: .word 0

.code
daddi $a0, $zero, c1
daddi $a1, $zero, c2

jal compare

sd $v0, equals ($zero)

halt

compare: daddi $v0, $zero, 1
	loop: lbu $t0, 0($a0)
		lbu $t1, 0($a1)
		beqz $t0, finEq
		bne $t0, $t1, fin
		daddi $v0, $v0, 1
		daddi $a0, $a0, 1
		daddi $a1, $a1, 1
		j loop
	finEq: beqz $t1, fin 
		daddi $v0, $zero, -1
	fin: jr $ra