;Escribir un programa que lea desde teclado un numero en punto flotante y lo compare con el valor almacenado en la celda
;llamada Valor. Si el valor ingresado por teclado es mayor que el almacenado en Valor, deberá calcular (X-valor)*X,
;donde X es el numero leido por teclado. Caso contrato, deberá calcular (Valor - X)/X. Por ultimo, deberá imprimir
;el texto "El resultado es:" junto con el valor calculado.

.data
CONTROL: 	.word32 0x10000
DATA:		.word32 0x10008
valor:		.double 5.6
res:		.asciiz "El resultado es: "

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)

daddi $t0, $zero, 8
sd $t0, 0($s0)
l.d f0, 0($s1)

l.d f1, valor($zero)
c.le.d f0, f1
bc1t esMenor
esMayor: sub.d f2, f0, f1
	mul.d f2, f2, f0
	j fin
	
esMenor: sub.d f2, f1, f0
	div.d f2, f2, f0
	
fin: daddi $t0, $zero, res
	sd $t0, 0($s1)
	
	daddi $t0, $zero, 4
	sd $t0, 0($s0)
	
	s.d f2, 0($s1) 
	
	daddi $t0, $zero, 3
	sd $t0, 0($s0)
halt