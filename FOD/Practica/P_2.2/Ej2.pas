program Ej2;
const valorAlto = 9999;
type
	alumno = record
		codigo:integer;
		nombre:String;
		apellido:String;
		cursadas:integer;
		aprobadas:integer;
	end;
	alumnoDetalle = record
		codigo:integer;
		materia:boolean;
	end;
	arc_m = file of alumno;
	arc_d = file of alumnoDetalle;
	
procedure leer(var arc:arc_d; var a:alumnoDetalle);
begin
	if(not eof(arc))then
		read(arc, a)
	else
		a.codigo := valorAlto;
end;

procedure leerMaestro(var arc:arc_m; var a:alumno);
begin
	if(not eof(arc))then
		write(arc, a)
	else
		a.codigo := valorAlto;
end;
	
procedure actualizarMaestro(var arcM:arc_m; var arcD:arc_d);
var regd,actual:alumnoDetalle; regm:alumno;
begin
	reset(arcM);
	reset(arcD);
	leer(arcD, regd);//EL DETALLE EN EL MAESTR EXISTE
	while(regd.codigo <> valorAlto)do begin
		leerMaestro(arcM, regm);
		while(regm.codigo <> regd.codigo)do begin
			leerMaestro(arcM, regm);
		end;
		actual := regd;
		while(actual.codigo = regd.codigo)do begin
			if(regd.materia)then
				regm.aprobadas := regm.aprobadas + 1
			else
				regm.cursadas := regm.cursadas + 1;
			leer(arcD, regd);
		end;
		seek(arcM, filepos(arcM) - 1);
		write(arcM, regm);
	end;
end;

procedure listar(var arc:arc_m);
var txt:Text; regm:alumno;
begin
	assign(txt, 'curs4r.txt');
	rewrite(txt);
	reset(arc);
	leerMaestro(arc, regm);
	while(regm.codigo <> valorAlto)do begin
		if(regm.cursadas > 4) and (regm.aprobadas = 0)then begin
			writeln(txt, regm.codigo, ' ', regm.nombre, ' ', regm.apellido);
		end;
		leerMaestro(arc, regm);
	end;
end;

begin

end.
