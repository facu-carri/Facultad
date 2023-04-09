.data
char: .ascii 'z'
vocales: .asciiz "AEIOUaeiou"
res: .word 0

.code
lb $a0, char($zero)
jal ES_VOCAL

sd $v0, res($zero)

halt

ES_VOCAL: dadd $v0, $zero, $zero
	dadd $t0, $zero, $zero
	loop: lbu $t1, vocales($t0)
		beqz $t1, fin
		beq $t1, $a0, vocal
		daddi $t0, $t0, 1
		j loop
	vocal: daddi $v0, $zero, 1
	fin: jr $ra

;*Escriba la subrutina ES_VOCAL que determina si un caracter es vocal o no, ya sea mayúscula o minúscula. La
;rutina debe recibir el caracter y debe retornar el valor 1 si es una vocal ó 0 en caso contrario.