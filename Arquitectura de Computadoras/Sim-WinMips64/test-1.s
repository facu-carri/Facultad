.data
cant: .word 8
datos: .word 1, 2, 3, 4, 5, 6, 7, 8
res: .word 0
.code
dadd r1, r0, r0 # r1 = 0
ld r2, cant(r0) # r2 = cant = 8
loop: ld r3, datos(r1) # r3 = datos(r1)
daddi r2, r2, -1 # decremento r2 (cant)
dsll r3, r3, 1 # desplazo 1 bit de r3, basicamente lo multiplica por 2 (000000001 => 000000010)
sd r3, res(r1) # guardo en res, r3 (guardo el resultado de r3, con un desplazamiento de R1)
daddi r1, r1, 8 # sumo 8 a r1
bnez r2, loop # si r2 != 0, loop (r2 es "contador", length de datos)
halt