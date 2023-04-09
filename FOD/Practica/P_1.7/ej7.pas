{
   Realizar un programa que permita:
	a. Crear un archivo binario a partir de la información almacenada en un archivo de texto.
		El nombre del archivo de texto es: “novelas.txt”
	b. Abrir el archivo binario y permitir la actualización del mismo. Se debe poder agregar
		una novela y modificar una existente. Las búsquedas se realizan por código de novela.
}


program ej7;
type
	novela = record
		code:integer;
		nombre:String;
		genero:String;
		precio:real;
	end;
	archivo = file of novela;

procedure crearBinary(var bin:archivo);
var txt:Text; nov:novela; filename:String;
begin
	WriteLn('Ingrese el nombre del archivo binario');
	ReadLn(filename);
	assign(bin, filename);
	assign(txt, 'novelas.txt');
	rewrite(bin);
	reset(txt);
	while not eof(txt) do begin
		ReadLn(txt, nov.code, nov.precio, nov.genero);
		ReadLn(txt, nov.nombre);
		write(bin, nov);
	end;
	close(bin);
	close(txt);
end;

procedure leerNovela(var n:novela);
begin
	WriteLn('Codigo'); ReadLn(n.code);
	WriteLn('Nombre'); ReadLn(n.nombre);
	WriteLn('Genero'); ReadLn(n.genero);
	WriteLn('Precio'); ReadLn(n.precio);
end;

procedure addNovela(var bin:archivo);
var nov:novela;
begin
	reset(bin);
	seek(bin, fileSize(bin));
	leerNovela(nov);
	Write(bin, nov);
end;

procedure modNovela(var bin:archivo);
var id:Integer; nov:novela; changed:Boolean;
begin
	changed := false;
	WriteLn('Ingrese el codigo de novela que quiere modificar');
	ReadLn(id);
	while not eof(bin) and not changed do begin
		Read(bin, nov);
		if(nov.code = id)then begin
			changed := true;
			leerNovela(nov);
			seek(bin, filePos(bin)-1);
			write(bin, nov);
		end;
	end;
end;

procedure updateBinary(var bin:archivo);
var op:Integer;
begin
	writeLn('[1] Agregar novela');
	writeLn('[2] Modificar novela');
	ReadLn(op);
	case op of
		1: addNovela(bin);
		2: modNovela(bin);
	end;
end;

BEGIN
	
	
END.

