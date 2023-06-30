program parcial;
const
	valorAlto = 9999;
	n = 5;
type
	alumno_mae = record
		dni_alumno:integer;
		codigo_carrera:integer;
		monto_total_pagado:real;
	end;
	alumno_det = record
		dni_alumno:integer;
		codigo_carrera:integer;
		monto_cuota:real;
	end;
	maestro = file of alumno_mae;
	detalle = file of alumno_det;
	arrFileDet = array[1..n] of detalle;
	arrRegDet = array[1..n] of alumno_det;
	
procedure leerMae(var mae:maestro; var reg:alumno_mae);
begin
	if(not eof(mae))then
		read(mae, reg)
	else
		reg.dni_alumno := valorAlto;
end;
	
procedure leerDet(var det:detalle; var reg:alumno_det);
begin
	if(not eof(det))then
		read(det, reg)
	else
		reg.dni_alumno := valorAlto;
end;
	
procedure minimo(var arFdet:arrFileDet; var arRdet:arrRegDet; var min:alumno_det);
var
	i,pos:integer;
begin
	min.dni_alumno := valorAlto;
	min.codigo_carrera := valorAlto;
	pos := 0;
	for i:=1 to n do begin
		if(arRdet[i].dni_alumno <> valorAlto)then begin
			if(arRdet[i].dni_alumno < min.dni_alumno) or ((arRdet[i].dni_alumno = min.dni_alumno) and (arRdet[i].codigo_carrera < min.codigo_carrera))then begin
				min := arRdet[i];
				pos := i;
			end;
		end;
	end;
	if(min.dni_alumno <> valorAlto)then begin
		leerDet(arFdet[pos], arRdet[pos]);
	end;
end;
	
procedure actualizar(var mae:maestro; var arFdet:arrFileDet);
var
	arRdet:arrRegDet;
	min:alumno_det;
	m:alumno_mae;
	i,dniActual,cod:integer;
	montoTotal:real;
begin
	reset(mae);
	for i:=1 to n do begin
		reset(arFdet[i]);
		leerDet(arFdet[i], arRdet[i]);
	end;
	minimo(arFdet, arRdet, min);
	while(min.dni_alumno <> valorAlto)do begin
		dniActual := min.dni_alumno;
		//while(dniActual = min.dni_alumno)do begin
			cod := min.codigo_carrera;
			montoTotal := 0;
			while(cod = min.codigo_carrera) and (dniActual = min.dni_alumno)do begin
				montoTotal := montoTotal + min.monto_cuota;
				minimo(arFdet, arRdet, min);
			end;
			leerMae(mae, m);
			while(m.dni_alumno <> dniActual) and (m.codigo_carrera <> cod)do begin
				leerMae(mae, m);
			end;
			m.monto_total_pagado := m.monto_total_pagado + montoTotal;
			seek(mae, filepos(mae)-1);
			write(mae, m);
		//end;
	end;
	close(mae);
	for i:=1 to n do begin
		close(arFdet[i]);
	end;
end;
	
procedure exportPobres(var mae:maestro);
var txt:Text; m:alumno_mae;
begin
	assign(txt, 'poor.txt');
	rewrite(txt);
	reset(mae);
	leerMae(mae, m);
	while(m.dni_alumno <> valorAlto)do begin
		if(m.monto_total_pagado = 0)then begin
			writeln(txt, m.dni_alumno, '', m.codigo_carrera, 'alumno moroso');
		end;
		leerMae(mae, m);
	end;
	close(mae);
	close(txt);
end;
	
var mae:maestro; arFdet:arrFileDet;
BEGIN
	assign(mae, 'maestro.dat');
	actualizar(mae, arFdet);
	exportPobres(mae);
END.
