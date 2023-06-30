program untitled;
const
	valorAlto = 9999;
type
	alumno_mae = record
		codigo:integer;
		nombre:String;
		apellido:String;
		materiasCursadas:integer;
		materiasFinal:integer;
	end;
	alumno_det = record
		codigo:integer;
		estado:0..1;// 0 = cursada, 1 = final
	end;
	maestro = file of alumno_mae;
	detalle = file of alumno_det;
	
procedure leerMae(var mae:maestro; var reg_m:alumno_mae);
begin
	if(eof(mae))then
		reg_m.codigo := valorAlto
	else
		read(mae, reg_m);
end;
	
procedure leerDet(var det:detalle; var reg_d:alumno_det);
begin
	if(eof(det))then
		reg_d.codigo := valorAlto
	else
		read(det, reg_d);
end;
	
procedure actualizar(var mae:maestro; var det:detalle);
var
	reg_d:alumno_det;
	reg_m:alumno_mae;
begin
	reset(mae);
	reset(det);
	leerDet(det, reg_d);
	while(reg_d.codigo <> valorAlto)do
	begin
		leerMae(mae, reg_m);
		while(reg_m.codigo <> reg_d.codigo)do
			leerMae(mae, reg_m);
		while(reg_m.codigo = reg_d.codigo)do
		begin
			if(reg_d.estado = 0)then
				reg_m.materiasCursadas := reg_m.materiasCursadas + 1
			else
				reg_m.materiasFinal := reg_m.materiasFinal + 1;
			leerDet(det, reg_d);
		end;
		seek(mae, filepos(mae)-1);
		write(mae, reg_m);
	end;
	close(mae);
	close(det);
end;
	
procedure listar(var mae:maestro);
var reg:alumno_mae; txt:Text;
begin
	assign(txt, 'alumnos.txt');
	rewrite(txt);
	reset(mae);
	leerMae(mae, reg);
	while(reg.codigo <> valorAlto)do begin
		if(reg.materiasCursadas > 4) and (reg.materiasFinal = 0)then begin
			writeln(txt, reg.codigo, '', reg.materiasCursadas, '', reg.materiasFinal, '', reg.nombre);
			writeln(txt, reg.apellido);
		end;
		leerMae(mae, reg);
	end;
	close(mae);
	close(txt);
end;
	
var mae:maestro; det:detalle; opt:Char;
BEGIN
	assign(mae, 'maestro.dat');
	assign(det, 'detalle.dat');
	writeln('Introduzca una opción');
	Writeln('[a] Actualizar el archivo maestro');
	Writeln('[b] Listar en un archivo de texto los alumnos que tengan >4 materias con cursada aprobada pero no aprobaron el final');
	readln(opt);
	case opt of
		'a': actualizar(mae, det);
		'b': listar(mae);
		else
			Writeln('>Error')
	end;
END.

