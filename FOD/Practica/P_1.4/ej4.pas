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

procedure listNames(var arc:archivo);
var eFile:emple;
begin
	while not eof(arc) do begin
		read(arc, eFile);
		if(eFile.edad > 70)then
			leerEmpleado(eFile);
	end;
end;

procedure listAge(var arc:archivo);
var eFile:emple;
begin
	while not eof(arc) do begin
		read(arc, eFile);
		leerEmpleado(eFile);
	end;
end;

function searchEqual(arc:archivo; eRef:emple):Boolean;
var eFile:emple;
begin
	while not eof(arc)do begin
		Read(arc, eFile);
		if(eFile.nro = eRef.nro)then
			searchEqual := true;
	end;
	searchEqual := false;
end;

procedure addEmple(var arc:archivo);
var eFile, eRef:emple;
begin
	loadEmpleado(eRef);
	while(eRef.nombre <> 'fin')do begin
		if(not searchEqual(arc, eRef))then begin
			seek(arc, fileSize(arc));
			write(arc, eRef);
		end;
		loadEmpleado(eRef);
	end;
end;

procedure fileExists(var arc:archivo);
var id:integer;
begin
	reset(arc);
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
		6: listAge(arc);
		7: listAge(arc);
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
