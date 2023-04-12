.data
NUM1: .word 5
NUM2: .word 4
RES: .word 0

.code
LD R1, NUM1 (R0)
LD R2, NUM2 (R0)
dadd R3, R0, R0

beqz R1, fin
beqz R2, fin

loop:
	dadd R3, R3, R1
	daddi R2, R2, -1
bnez R2, loop
sd R3, RES (R0)

fin: HALT