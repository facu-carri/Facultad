;El índice de masa corporal (IMC) es una medida de asociación entre el peso y la talla de un individuo.
;Se calcula a partir del peso (expresado en kilogramos, por ejemplo: 75,7 kg) y la estatura (expresada en metros,
;por ejemplo 1,73 m), usando la fórmula:
;IMC = peso / (estatura)2
;De acuerdo al valor calculado con este índice, puede clasificarse el estado nutricional de una persona en:
;Infrapeso (IMC < 18,5), Normal (18,5 ≤ IMC < 25), Sobrepeso (25 ≤ IMC < 30) y Obeso (IMC ≥ 30).
;Escriba un programa que dado el peso y la estatura de una persona calcule su IMC y lo guarde en la dirección
;etiquetada IMC. También deberá guardar en la dirección etiquetada estado un valor según la siguiente tabla:
;IMC Clasificación Valor guardado
;< 18,5 Infrapeso 1
;< 25 Normal 2
;< 30 Sobrepeso 3
;≥ 30 Obeso 4

.data
	peso: .double 0
	estatura: .double 1.73
	imc: .double -1
	estado: .word 0
	
	infrapeso: .double 18.5
	normal: .double 25
	sobrepeso: .double 30
	
.code
	l.d f1, peso($zero)
	l.d f2, estatura($zero)
	mul.d f2, f2, f2 ; estatura al cuadrado
	div.d f1, f1, f2 ; peso / (estatura)2
	s.d f1, imc($zero)
	daddi $t0, $zero, 4
	infrapeso: l.d f2, infrapeso($zero)
		c.lt.d f1, f2
		bc1f normal
		daddi $t0, $zero, 1
		j fin
	normal: l.d f2, normal($zero)
		c.lt.d f1, f2
		bc1f sobrepeso
		daddi $t0, $zero, 2
		j fin
	sobrepeso: l.d f2, sobrepeso($zero)
		c.lt.d f1, f2
		bc1f fin
		daddi $t0, $zero, 3
	fin: sd $t0, estado($zero)
halt