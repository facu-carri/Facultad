.data
pixel: 		.byte 0, 0, 0, 0, 5, 3, 0, 0
CONTROL: 	.word 0x10000
DATA: 		.word 0x10008

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)

daddi $t0, $zero, 7
sd $t0, 0($s0) ; clean

ld $t0, pixel($zero)
sd $t0, 0($s1)

daddi $t0, $zero, 5
sd $t0, 0($s0)

halt