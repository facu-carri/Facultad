.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car: .asciiz "d" ; caracter buscado
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.

.code
lbu R1, car (R0)
dadd R2, R0, R0 ; desplazamiento
dadd R3, R0, R0 ; cant

loop: lbu R4, cadena(R2)
bne R1, R4, sig ; caracter != cadena(R2)
daddi R3, R3, 1
sig: daddi R2, R2, 1
bnez R4, loop

sd R3, cant (R0)
HALT