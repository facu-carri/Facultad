.data
text: 		.asciiz "Hola, Mundo!"
CONTROL: 	.word32 0x10000
DATA: 		.word32 0x10008

.code

ld $t0, CONTROL($zero)
daddi $t1, $zero, 6
sd $t0, 0($t1)

ld $t0, DATA($zero)
daddi $t1, $zero, text
sd $t1, 0($t0)

ld $t0, CONTROL($zero)
daddi $t1, $zero, 4
sd $t1, 0($t0)

halt