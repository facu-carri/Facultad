.data
CONTROL: 	.word 0x10000
DATA: 		.word 0x10008
ERROR: 		.asciiz  "ERROR"
CERO:		.asciiz  "CERO"
UNO:		.asciiz  "UNO"
DOS:		.asciiz  "DOS"
TRES:		.asciiz  "TRES"
CUATRO:		.asciiz  "CUATRO"
CINCO:		.asciiz  "CINCO"
SEIS:		.asciiz  "SEIS"
SIETE:		.asciiz  "SIETE"
OCHO:		.asciiz  "OCHO"
NUEVE:		.asciiz  "NUEVE"

.code
ld $s0, CONTROL($zero) ; copio el dato que tiene la direccion de memoria Control (0x10000) y lo guardo en $s0
ld $s1, DATA($zero)
jal ingreso
dadd $a0, $zero, $v0
jal muestra
halt

ingreso: daddi $t0, $zero, 8
	sd $t0, 0($s0) ; guardo $t0 en la direccion de memoria 0($s0) (porque no le puedo envíar un registro, solo una direccion
	ld $v0, 0($s1) ; copio el dato de 0($s1) a $v0
	slti $t0, $v0, 0
	bnez $t0, fin
	slti $t0, $v0, 10 ; si es menor que 10 = 1
	beqz $t0, fin
	jr $ra
	fin: daddi $v0, $zero, -1
		jr $ra

muestra: daddi $t0, $zero, -1
	beq $t0, $a0, error
	daddi $t0, $zero, 8
	dmul $a0, $t0, $a0
	daddi $t1, $a0, CERO ; t1 = num + dir de cero
	j final
	error: daddi $t1, $zero, ERROR
	final: sd $t1, 0($s1) ; cargo data
		daddi $t1, $zero, 4
		sd $t1, 0($s0)
		jr $ra

;Escriba un programa que utilice sucesivamente dos subrutinas: La primera, denominada ingreso, debe solicitar el
;ingreso por teclado de un número entero (de un dígito), verificando que el valor ingresado realmente sea un dígito. La
;segunda, denominada muestra, deberá mostrar en la salida estándar del simulador (ventana Terminal) el valor del
;número ingresado expresado en letras (es decir, si se ingresa un ‘4’, deberá mostrar ‘CUATRO’). Establezca el pasaje
;de parámetros entre subrutinas respetando las convenciones para el uso de los registros y minimice las detenciones
;del cauce (ejercicio similar al ejercicio 6 de Práctica 2).