program ej3;

type
	emple = record
		nro:integer;
		nombre:String;
		apellido:String;
		edad:integer;
		dni:integer;
	end;
	archivo = file of emple;
	
procedure leerEmpleado(var e:emple);
begin
	WriteLn('Numero de empleado ', e.nro);
	WriteLn('Apellido ', e.apellido);
	if(e.apellido <> 'fin')then begin
		WriteLn('Nombre ', e.nombre);
		WriteLn('Edad ', e.edad);
		WriteLn('DNI ', e.dni);
	end;
end;
	
procedure loadEmpleado(var e:emple);
begin
	Write('Numero de empleado '); ReadLn(e.nro);
	Write('Nombre '); ReadLn(e.nombre);
	Write('Apellido '); ReadLn(e.apellido);
	Write('Edad '); ReadLn(e.edad);
	Write('DNI '); ReadLn(e.dni);
end;
	
procedure cargarDatos(var arc:archivo);
var e:emple;
begin
	loadEmpleado(e);
	while(e.apellido <> 'fin')do begin
		write(arc, e);
		loadEmpleado(e);
	end;
	close(arc);
end;
	
procedure listarByName(var arc:archivo);
var data:String; e:emple;
begin
	writeln('Escriba el nombre o apellido de la persona');
	readln(data);
	while(not eof(arc))do begin
		read(arc, e);
		if(e.apellido = data) or (e.nombre = data)then begin
			leerEmpleado(e);
		end;
	end;
	close(arc);
end;

procedure listar(var arc:archivo);
var e:emple;
begin
	while(not eof(arc))do begin
		read(arc, e);
		leerEmpleado(e);
	end;
	close(arc);
end;

procedure listarViejos(var arc:archivo);
var e:emple;
begin
	while(not eof(arc))do begin
		read(arc, e);
		if(e.edad > 70)then
			leerEmpleado(e);
	end;
	close(arc);
end;

procedure existeEmpleado(var arc:archivo; var exist:Boolean; search:emple);
var e:emple;
begin
	while(not eof(arc) and not exist)do begin
		read(arc, e);
		if(e.nro = search.nro)then
			exist := true;
	end;
end;

procedure agregarNoRepetir(var arc:archivo);
var e:emple; exist:boolean;
begin
	loadEmpleado(e);
	while(e.nombre <> 'fin')do begin
		exist := false;
		existeEmpleado(arc, exist, e);
		if(not exist)then begin
			seek(arc, filesize(arc));
			write(arc, e);
			seek(arc, 0);
		end;
		loadEmpleado(e);
	end;
	close(arc);
end;

procedure modAge(var arc:archivo);
var nro:integer; e:emple; found:boolean;
begin
	found := false;
	Writeln('Ingrese el numero de empleado a modificar');
	Readln(nro);
	while(nro <> -1)do begin
		while(not eof(arc) and not found)do begin
			read(arc, e);
			if(e.nro = nro)then begin
				ok := true;
				writeln('Escriba la nueva edad'); readln(nro);
				e.nro := nro;
				seek(arc, filepos(arc)-1);
				write(arc, e);
				nro := -1;
			end;
		end;
	end;
	close(arc);
end;
	
procedure exportToTxt(var arc:archivo);
var txt:Text; e:emple;
begin
	assign(txt, 'todos_empleados.txt');
	rewrite(txt);
	while(not eof(arc))do begin
		read(arc, e);
		writeln(txt, e.nro, '', e.dni, '', e.nombre);
		writeln(arc, e.edad, '', e.apellido);
	end;
	close(arc);
	close(txt);
end;
	
var arc:archivo; filename:String; opt:String;
BEGIN
	readln(filename);
	assign(arc, filename);
	rewrite(arc);
	cargarDatos(arc);
	reset(arc);
	writeln('i. Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado.');
	writeln('ii. Listar en pantalla los empleados de a uno por línea.');
	writeln('iii. Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.');
	readln(opt);
	case opt of
		'i': listarByName(arc);
		'ii': listar(arc);
		'iii': listarViejos(arc);
		'iiii': agregarNoRepetir(arc);
		'iiiii': modAge(arc);
		'iiiiii': exportToTxt(arc);
		else
			writeln('error');
	end;
END.

