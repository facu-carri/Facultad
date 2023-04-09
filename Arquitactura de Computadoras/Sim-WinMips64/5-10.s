.data
cadena: .asciiz "saramambiche"
vocales: .asciiz "AEIOUaeiou"
res: .word 0

.code
daddi $sp, $sp, 1024
daddi $a0, $zero, cadena
jal CONTAR_VOC
sd $v1, res($zero)
halt

CONTAR_VOC: dadd $v1, $zero, $zero
	dadd $s0, $zero, $a0
	daddi $sp, $sp, -8
	sd $ra, 0($sp) ; lo guardo en -8
	daddi $sp, $sp, -8
	sd $s0, 0($sp) ; guardo en -16
	loope: lbu $a0, 0($s0) ; obtengo char
		beqz $a0, fina ; char != 0
		jal ES_VOCAL ; send a0
		beqz $v0, sig ; get v0
		daddi $v1, $v1, 1
	sig: daddi $s0, $s0, 1
		j loope
	fina: LD $s0, 0($sp)
		daddi $sp, $sp, 8
		LD $ra, 0($sp)
		daddi $sp, $sp, 8
		jr $ra

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

;Usando la subrutina escrita en el ejercicio anterior, escriir la subrutina CONTAR_VOC, que recibe una cadena
;terminada en cero y devuelve la cantidad de vocales que tiene esa cadena.

daddi $sp, $sp, 1024
jal subrutina

subrutina: dadd $v0, $zero, $zero
	daddi $sp, $sp, -8
	sd $ra, 0($sp)
	daddi $sp, $sp, -8
	sd $t0, 0($sp)
	
	ld $t0, 0($sp)
	daddi $sp, $sp, 8
	ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra 