{
	4. Agregar al menú del programa del ejercicio 3, opciones para:
		a. Añadir uno o más empleados al final del archivo con sus datos ingresados por
			teclado. Tener en cuenta que no se debe agregar al archivo un empleado con
			un número de empleado ya registrado (control de unicidad).
		b. Modificar edad a uno o más empleados.
		c. Exportar el contenido del archivo a un archivo de texto llamado “todos_empleados.txt”.
		d. Exportar a un archivo de texto llamado: “faltaDNIEmpleado.txt”, los empleados
			que no tengan cargado el DNI (DNI en 00).
	NOTA: Las búsquedas deben realizarse por número de empleado.
}
program ej4;
type
	emple = record
		nro:integer;
		apellido:String;
		nombre:String;
		edad:integer;
		dni:String;
	end;
	archivo = file of emple;
	
procedure loadEmpleado(var e:emple);
begin
	Write('Numero de empleado '); ReadLn(e.nro);
	Write('Nombre '); ReadLn(e.nombre);
	Write('Apellido '); ReadLn(e.apellido);
	Write('Edad '); ReadLn(e.edad);
	Write('DNI '); ReadLn(e.dni);
end;
	
procedure loadFile(var arc:archivo);
var e:emple;
begin
	loadEmpleado(e);
	while(e.apellido <> 'fin')do begin
		write(arc, e);
		loadEmpleado(e);
	end;
	close(arc);
end;

procedure createFile(var arc:archivo);
begin
	rewrite(arc);
	loadFile(arc);
end;
	
procedure leerEmpleado(e:emple);
begin
	WriteLn('Numero de empleado ', e.nro);
	WriteLn('Nombre ', e.nombre);
	WriteLn('Apellido ', e.apellido);
	WriteLn('Edad ', e.edad);
	WriteLn('DNI ', e.dni);
end;
	
procedure listDefs(var arc:archivo);
var eFile, eRef:emple;
begin
	Write('Nombre ');
	ReadLn(eRef.nombre);
	Write('Apellido ');
	ReadLn(eRef.apellido);
	while not eof(arc) do begin
		read(arc, eFile);
		if(eFile.nombre = eRef.nombre) and (eFile.apellido = eRef.apellido)then
			leerEmpleado(eFile);
	end;
end;

procedure listAge(var arc:archivo);
var eFile:emple;
begin
	reset(arc);
	while not eof(arc) do begin
		read(arc, eFile);
		if(eFile.edad > 70)then
			leerEmpleado(eFile);
	end;
	close(arc);
end;

procedure listNames(var arc:archivo);
var eFile:emple;
begin
	while not eof(arc) do begin
		read(arc, eFile);
		leerEmpleado(eFile);
	end;
end;

procedure searchEqual(var arc:archivo; var eRef:emple; var found:boolean);
var eFile:emple;
begin
	while not eof(arc) and (not found) do begin
		Read(arc, eFile);
		if(eFile.nro = eRef.nro)then
			found := true;
	end;
end;

procedure addEmple(var arc:archivo);
var eRef:emple; found:boolean;
begin
	reset(arc);
	loadEmpleado(eRef);
	while(eRef.nombre <> 'fin')do begin
		found := false;
		searchEqual(arc, eRef, found);
		if(not found)then begin
			seek(arc, fileSize(arc));
			write(arc, eRef);
		end;
		loadEmpleado(eRef);
	end;
	close(arc);
end;

procedure modAge(var arc:archivo);
var e:emple; found:boolean; age:integer;
begin
	reset(arc);
	loadEmpleado(e);
	while(e.nombre <> 'fin')do begin
		found := false;
		searchEqual(arc, e, found);
		if(found)then begin
			writeln('Insertar edad');
			readln(age);
			seek(arc, filepos(arc)-1);
			read(arc, e);
			e.edad := age;
			seek(arc, filepos(arc)-1);
			write(arc, e);
		end;
		loadEmpleado(e);
	end;
	close(arc);
end;

procedure exportToTxt(var arc:archivo);
var txt:Text; e:emple;
begin
	assign(txt, 'todos_empleados.txt');
	rewrite(txt);
	reset(arc);
	while(not eof(arc))do begin
		read(arc, e);
		writeln(txt, e.nro, '', e.edad, '', e.dni, '', e.nombre);
		writeln(txt, e.apellido);
	end;
	close(arc);
	close(txt);
end;

procedure listDni(var arc:archivo);
var txt:Text; e:emple;
begin
	assign(txt, 'faltaDNIEmpleado.txt');
	rewrite(txt);
	reset(arc);
	while(not eof(arc))do begin
		read(arc, e);
		if(e.dni = '00')then begin
			writeln(txt, e.nro, '', e.edad, '', e.dni, '', e.nombre);
			writeln(txt, e.apellido);
		end;
	end;
	close(arc);
	close(txt);
end;

procedure bajaFisica(var arc:archivo);
var nro,pos:integer; e:emple;
begin
	reset(arc);
	pos := -1;
	Writeln('Ingrese el nro de empleado');
	Readln(nro);
	while(not eof(arc)) and (pos = -1)do begin
		read(arc, e);
		if(e.nro = nro)then begin
			pos := filepos(arc);
		end;
	end;
	if(pos <> -1)then begin
		seek(arc, filesize(arc)-1);
		read(arc, e);
		seek(arc, pos-1);
		write(arc, e);
		seek(arc, filesize(arc)-1);
		truncate(arc);
	end;
	close(arc);
end;

procedure fileExists(var arc:archivo);
var id:integer;
begin
	//reset(arc);
	WriteLn('[1] Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado');
	WriteLn('[2] Listar en pantalla los empleados de a uno por línea');
	WriteLn('[3] Listar en pantalla empleados mayores de 70 años, próximos a jubilarse');
	WriteLn('[4] Añadir uno o más empleados al final del archivo');
	WriteLn('[5] Modificar edad a uno o más empleados');
	WriteLn('[6] Exportar el contenido del archivo');
	WriteLn('[7] Exportar a un archivo');
	Readln(id);
	case id of
		1: listDefs(arc);
		2: listNames(arc);
		3: listAge(arc);
		4: addEmple(arc);
		5: modAge(arc);
		6: exportToTxt(arc);
		7: listDni(arc);
		8: bajaFisica(arc);
		else writeLn('>.< ERROR >.<');
	end;
	close(arc);
end;
	
var filename:String;
	arc:archivo;
	id:integer;
BEGIN
	Write('Ingrese el nombre del archivo: ');
	ReadLn(filename);
	assign(arc, filename);
	WriteLn('[1] Cargar archivo');
	WriteLn('[2] Crear archivo');
	ReadLn(id);
	case id of
		1: createFile(arc);
		2: fileExists(arc);
		else writeLn('>.< ERROR >.<');
	end;
END.
