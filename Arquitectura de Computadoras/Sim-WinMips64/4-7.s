.data
TABLA: .word 6, 2, 8, 5, 9, 33, 12, 53, 11, 7
X: .word 10
CANT: .word 0
RES: .word 0

.code
ld r1, X(R0)
dadd r2, r0, r0 # MUEVO EN LA TABLA
dadd r7, r0, r0 #cant
daddi r8, r0, 10

loop: ld r3, TABLA(r2)
	daddi r2, r2, 8
	slt r4, r1, r3 # 5 < 2 ? dejo 1 en R4
	beqz r4, addToRES # si es 1 (es menor), menorEqual
	beq r3, r1, addToRES # r3 = r1 ? si no es igual, menorEqual
	daddi r7, r7, 1 # dejo un 1 en r5
	sd r4, RES(r2)
	
addToRES: daddi r8, r8, -1
	daddi r2, r2, 8 # incremento r10
	bnez r8, loop
	
sd r7, CANT(r0)
halt