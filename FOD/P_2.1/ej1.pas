program ej1;
uses SysUtils;
const
	valorAlto = 9999;
type
	empleado = record
		codigo:integer;
		monto:real;
		nombre:String[40];
	end;
	arc_comisiones = file of empleado;
	
procedure leer(var arc:arc_comisiones; var emple:empleado);
begin
	if(not eof(arc))then
		read(arc, emple)
	else
		emple.codigo := valorAlto;
end;
	
procedure compactar(var arc:arc_comisiones; var comp:arc_comisiones);
var
	regemple,regcomp:empleado;
begin
	assign(comp, 'compacto.dat');
	rewrite(comp);
	reset(arc);
	leer(arc, regemple);
	while(regemple.codigo <> valorAlto)do begin
		regcomp := regemple;
		regcomp.monto := 0;
		while(regemple.codigo = regcomp.codigo)do begin
			regcomp.monto := regcomp.monto + regemple.monto;
			leer(arc, regemple);
		end;
		write(comp, regcomp);
	end;
	close(arc);
	close(comp);
end;
	
procedure leerComision(var c : empleado);
begin
	c.codigo := Random(15) - 1;
	if(c.codigo > 0) then
	begin
		c.nombre := 'test' + IntToStr(c.codigo);
		c.monto := Random(200) + 1;
	end;
end;
	
procedure cargarComisiones(var arc:arc_comisiones);
var emple:empleado;
begin
	assign(arc, 'comisiones.dat');
	rewrite(arc);
	leerComision(emple);
	while(emple.codigo <> -1)do begin
		write(arc, emple);
		leerComision(emple);
	end;
	close(arc);
end;
	
procedure imprimirComision(c : empleado);
begin
	writeln('Codigo: ', c.codigo);
	writeln('Nombre: ', c.nombre);
	writeln('Monto: $', c.monto:0:2);
	writeln;
end;

procedure imprimirArchivo(var arc:arc_comisiones);
var emple:empleado;
begin
	reset(arc);
	while(not eof(arc)) do
	begin
		read(arc, emple);
		imprimirComision(emple);
	end;
	close(arc);
end;
	
var arc, salida:arc_comisiones;
BEGIN
	randomize();
	cargarComisiones(arc);
	imprimirArchivo(arc);
	writeLn('-------');
	compactar(arc,salida);
	imprimirArchivo(salida);
END.
