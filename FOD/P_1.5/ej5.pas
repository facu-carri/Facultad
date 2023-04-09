{
   5. Realizar un programa para una tienda de celulares, que presente un menú con opciones para:
   
	a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos
		ingresados desde un archivo de texto denominado “celulares.txt”. Los registros
		correspondientes a los celulares, deben contener: código de celular, el nombre,
		descripción, marca, precio, stock mínimo y el stock disponible.
		
	b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al stock mínimo.
	
	c. Listar en pantalla los celulares del archivo cuya descripción contenga una cadena de caracteres proporcionada por el usuario.
	
	d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado
		“celulares.txt” con todos los celulares del mismo. El archivo de texto generado
		podría ser utilizado en un futuro como archivo de carga (ver inciso a), por lo que
		debería respetar el formato dado para este tipo de archivos en la NOTA 2.
	
	NOTA 1: El nombre del archivo binario de celulares debe ser proporcionado por el usuario.
	
	NOTA 2: El archivo de carga debe editarse de manera que cada celular se especifique en
	tres líneas consecutivas: en la primera se especifica: código de celular, el precio y
	marca, en la segunda el stock disponible, stock mínimo y la descripción y en la tercera
	nombre en ese orden. Cada celular se carga leyendo tres líneas del archivo
	“celulares.txt”.
}


program ej5;
type
	celular = record
		code:integer;
		nombre:String;
		desc:String;
		marca:String;
		precio:Real;
		stockMin:integer;
		stockDisp:integer;
	end;
	archivo = file of celular;

procedure crearArchivo(var a:archivo);
var filename:String; txt:Text; cel:celular;
begin
	WriteLn('Ingrese el nombre del archivo a crear');
	ReadLn(filename);
	assign(a, filename);
	assign(txt, 'celulares.txt');
	rewrite(a);
	reset(txt);
	while not eof(txt) do begin
		ReadLn(txt, cel.code, cel.precio, cel.marca);
		ReadLn(txt, cel.stockDisp, cel.stockMin, cel.desc);
		ReadLn(txt, cel.nombre);
		Write(a, cel);
	end;
	close(txt);
	close(a);
end;

procedure leerCelular(var c:celular);
begin
	WriteLn('----------');
	Write('Code '); ReadLn(c.code);
	Write('Nombre '); ReadLn(c.nombre);
	if(c.nombre <> 'fin')then begin
		Write('Descripcion '); ReadLn(c.desc);
		Write('Marca '); ReadLn(c.marca);
		Write('Precio '); ReadLn(c.precio);
		Write('Stock Minimo '); ReadLn(c.stockMin);
		Write('Stock Disponible '); ReadLn(c.stockDisp);
	end;
end;

procedure crearBase();
var txt:Text; cel:celular;
begin
	assign(txt, 'celulares.txt');
	rewrite(txt);
	leerCelular(cel);
	while(cel.nombre <> 'fin')do begin
		WriteLn(txt, cel.code, ' ', cel.precio, ' ', cel.marca);
		WriteLn(txt, cel.stockDisp, ' ', cel.stockMin, ' ', cel.desc);
		WriteLn(txt, cel.nombre);
		leerCelular(cel);
	end;
	close(txt);
end;

procedure imprimirCelular(c:celular);
begin
	WriteLn('Codigo de celular ', c.code);
	WriteLn('Nombre ', c.nombre);
	WriteLn('Descripcion ', c.desc);
	WriteLn('Marca ', c.marca);
	WriteLn('Precio ', c.precio);
	WriteLn('Stock Minimo ', c.stockMin);
	WriteLn('Stock Disponible ', c.stockDisp);
end;

procedure listarStock(var a:archivo);
var cel:celular;
begin
	reset(a);
	while not eof(a) do begin
		Read(a, cel);
		if(cel.stockDisp < cel.stockMin)then
			imprimirCelular(cel);
	end;
	close(a);
end;

procedure searchDesc(var a:archivo);
var desc:String; cel:celular;
begin
	WriteLn('Escriba la descripcion que busca');
	Readln(desc);
	desc := Concat(' ', desc);
	reset(a);
	while not eof(a) do begin
		read(a, cel);
		if(cel.desc = desc)then
			imprimirCelular(cel);
	end;
	close(a);
end;

procedure exportToTxt(var a:archivo);
var txt:text; cel:celular;
begin
	assign(txt, 'celulares.txt');
	reset(a);
	rewrite(txt);
	while not eof(a) do begin
		read(a, cel);
		writeln(txt, cel.code, '', cel.precio, '', cel.marca);
		writeln(txt, cel.stockDisp, '', cel.stockMin, '', cel.desc);
		writeln(txt, cel.nombre);
	end;
	close(a);
	close(txt);
end;

procedure agregarItem(var a:archivo);
var cel:celular;
begin
	leerCelular(cel);
	reset(a);
	seek(a, fileSize(a));
	while(cel.nombre <> 'fin')do begin
		Write(a, cel);
		leerCelular(cel);
	end;
	close(a);
end;

procedure ModificarStock(var a:archivo);
var fin:Boolean; nro:Integer; cel:celular;
begin
	fin := false;
	WriteLn('Ingrese el numero de producto');
	ReadLn(nro);
	reset(a);
	while not eof(a) and not fin do begin
		Read(a, cel);
		if(cel.code = nro)then begin
			fin := true;
			WriteLn('Ingresar stock disponible');
			ReadLn(cel.stockDisp);
			seek(a, filePos(a)-1);
			write(a, cel);
		end;
	end;
	close(a);
end;

procedure exportNoStock(var a:archivo);
var txt:Text; c:celular;
begin
	assign(txt, 'sinStock.txt');
	rewrite(txt);
	reset(a);
	while not eof(a) do begin
		read(a, c);
		if(c.stockDisp = 0)then
			WriteLn(txt, c.nombre, '', c.marca);
	end;
	close(a);
	close(txt);
end;

var notEnd:Boolean; id:Integer; a:archivo;
BEGIN
	notEnd := true;
	while notEnd do begin
		WriteLn('Elija una opción');
		WriteLn('[0] Crear base');
		WriteLn('[1] Crear archivo');
		WriteLn('[2] Listar en pantalla stock menor al min');
		WriteLn('[3] Listar descripcion user');
		WriteLn('[4] Exportar');
		WriteLn('[5] Añadir celulares');
		WriteLn('[6] Modificar Stock');
		WriteLn('[7] Exportar sin stock');
		WriteLn('[8] Finalizar');
		ReadLn(id);
		case id of
			0: crearBase();
			1: crearArchivo(a);
			2: listarStock(a);
			3: searchDesc(a);
			4: exportToTxt(a);
			5: agregarItem(a);
			6: ModificarStock(a);
			7: exportNoStock(a);
			else notEnd := false;
		end;
	end;
	
END.

