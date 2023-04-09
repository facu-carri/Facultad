.data
A: .word 6
B: .word 2
C: .word 6
D: .word 0

.code
dadd r10, r0, r0

ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)

bne r1, r2, A_distinto_B # A ES IGUAL B ? NO, A Disinto de B

A_igual_B: daddi r10, r10, 2
	bne r2, r3, fin
	daddi r10, r10, 1
	j fin

A_distinto_B: bne r2, r3, B_distinto_C # COMPARO B CON C
	daddi r10, r10, 2
	j fin

B_distinto_C: bne r3, r1, fin # COMPARO C CON A
	daddi r10, r10, 2

fin: sd r10, D (r0)
halt