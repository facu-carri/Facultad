{
	Realizar un programa que presente un menú con opciones para:
	a. Crear un archivo de registros no ordenados de empleados y completarlo con
		datos ingresados desde teclado. De cada empleado se registra: número de
		empleado, apellido, nombre, edad y DNI.
		Algunos empleados se ingresan con DNI 00.
		La carga finaliza cuando se ingresa el String ‘fin’ como apellido.
	b. Abrir el archivo anteriormente generado y
		-Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado.
		-Listar en pantalla los empleados de a uno por línea.
		-Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.
	NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario.
}
program ej3;
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
		if(eFile.nombre = eRef.nombre) or (eFile.apellido = eRef.apellido)then
			leerEmpleado(eFile);
	end;
end;

procedure listAge(var arc:archivo);
var eFile:emple;
begin
	while not eof(arc) do begin
		read(arc, eFile);
		if(eFile.edad > 70)then
			leerEmpleado(eFile);
	end;
end;

procedure listNames(var arc:archivo);
var eFile:emple;
begin
	while not eof(arc) do begin
		read(arc, eFile);
		leerEmpleado(eFile);
	end;
end;

procedure fileExists(var arc:archivo);
var id:integer;
begin
	reset(arc);
	WriteLn('[1] Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado');
	WriteLn('[2] Listar en pantalla los empleados de a uno por línea');
	WriteLn('[3] Listar en pantalla empleados mayores de 70 años, próximos a jubilarse');
	WriteLn('[4] Finalizar');
	Readln(id);
	case id of
		1: listDefs(arc);
		2: listNames(arc);
		3: listAge(arc);
		4: 
		else writeLn('>.< ERROR >.<');
	end;
	close(arc);
end;
	
var filename:String;
	arc:archivo;
	id:integer;
	notStop:Boolean;
BEGIN
	notStop := true;
	Write('Ingrese el nombre del archivo: ');
	ReadLn(filename);
	assign(arc, filename);
	while notStop do begin
		WriteLn('[1] Crear archivo');
		WriteLn('[2] Cargar archivo');
		WriteLn('[3] Finalizar');
		ReadLn(id);
		case id of
			1: createFile(arc);
			2: fileExists(arc);
			3: notStop := false;
			else begin
				writeLn('>.< ERROR >.<');
				notStop := false;
			end;
		end;
	end;
END.
