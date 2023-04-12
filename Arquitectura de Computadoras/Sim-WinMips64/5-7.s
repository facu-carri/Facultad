.data
M: .word 25
len: .word 8
tabla: .word 26, 06, 2011, 15, 20, 30, 80, 2
res: .word 0

.code
ld $a0, M ($zero)
daddi $a1, $zero, tabla ; dir tabla
ld $a2, len ($zero)

jal count

sd $v0, res ($zero)

halt

count: dadd $v0, $zero, $zero
	loop: beqz $a2, fin
		ld $t0, 0 ($a1)
		slt $t1, $t0, $a0
		beqz $t1, siguiente
		daddi $v0, $v0, 1
		siguiente: daddi $a1, $a1, 8
		daddi $a2, $a2, -1
		j loop
	fin: jr $ra