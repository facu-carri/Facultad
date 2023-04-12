.data
	base: .double 5.85
	altura: .double 13.47
	sup: .double -1

.code
	l.d f1, base ($zero)
	l.d f2, altura ($zero)
	daddi r1, $zero, 2
	mul.d f1, f2, f1
	mtc1 r1, f3
	cvt.d.l f3, f3
	div.d f1, f1, f3
	s.d f1, sup($zero)
halt