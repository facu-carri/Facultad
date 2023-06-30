program ej3;
const
	valorAlto = 9999;
type
	novela = record
		codigo:integer;
		genero:String;
		nombre:String;
		duracion:integer;
		director:String;
		precio:Real;
	end;
	f_novelas = file of novela;
	
procedure leerNovela(var reg:novela);
begin
	writeln('codigo'); Readln(reg.codigo);
	writeln('genero'); Readln(reg.genero);
	writeln('nombre'); Readln(reg.nombre);
	writeln('duracion'); Readln(reg.duracion);
	writeln('director'); Readln(reg.director);
	writeln('precio'); Readln(reg.precio);
end;
	
procedure crear(var mae:f_novelas);
var
	reg:novela;
begin
	rewrite(mae);
	reg.codigo := 0;
	write(mae, reg);
	leerNovela(reg);
	while(reg.codigo <> -1)do
	begin
		write(mae, reg);
		leerNovela(reg);
	end;
end;

procedure leer(var mae:f_novelas; var reg:novela);
begin
	if(not eof(mae))then
		read(mae, reg)
	else
		reg.codigo := valorAlto;
end;

procedure alta(var mae:f_novelas);
var
	reg, regm:novela; pos:integer;
begin
	reset(mae);
	leerNovela(reg);
	//seek(mae, 0); se pone en 0 con el reset
	leer(mae, regm);
	if(regm.codigo <> valorAlto) and (regm.codigo <> 0)then
	begin
		seek(mae, regm.codigo * -1);	//voy a la pos de la baja
		leer(mae, regm);				//leo el registro que está de baja
		pos := regm.codigo;				//guardo el indice (porque apunta al siguiente)
		seek(mae, filepos(mae) - 1);	//luego de leer, voy una posicion menos
		write(mae, reg);				//escribo en la baja, el nuevo registro (alta)
		seek(mae, 0);
		regm.codigo := pos;				//reutilizo el regm y le asigno el indice
		write(mae, regm);
	end;
	//else begin (en el ejercicio dice "No hay espacio disponible"
		//seek(mae, filesize(mae));//si estoy en el final o no tengo bajas, sobreescribo el eof
		//write(mae, reg);
	//end;
	close(mae);
end;

procedure modificar(var mae:f_novelas);
var
	reg:novela; id:integer;
begin
	reset(mae);
	Writeln('Inserte codigo de novela a modificar');
	readln(id);
	leer(mae, reg);
	while(reg.codigo <> valorAlto) and (reg.codigo <> id)do
	begin
		leer(mae, reg);
	end;
	if(reg.codigo <> valorAlto)then
	begin
		seek(mae, filepos(mae) - 1);
		Writeln('El codigo de novela no sera modificado');//disclaimer?
		leerNovela(reg);
		reg.codigo := id;
		write(mae, reg);
	end;
	close(mae);
end;

procedure bajaFisica(var mae:f_novelas);
var
	reg:novela; id:integer; pos:integer; ceroPos:integer;
begin
	reset(mae);
	Writeln('Inserte codigo de novela a eliminar');
	readln(id);
	leer(mae, reg);
	while(reg.codigo <> valorAlto) and (reg.codigo <> id)do
	begin
		leer(mae, reg);
	end;
	if(reg.codigo <> valorAlto)then
	begin
		pos := filepos(mae) - 1;		//guardo la posicion de baja en pos
		seek(mae, 0);
		leer(mae, reg);
		ceroPos := reg.codigo;			//guardo el indice que está en cero, en ceroPos
		seek(mae, filepos(mae) - 1);	// == seek(mae, 0); again (porque leí)
		reg.codigo := pos * -1;			//utilizo reg y le asigno el indice * -1
		write(mae, reg);				//escribo en la posicion 0
		
		seek(mae, pos);
		reg.codigo := ceroPos;
		write(mae, reg);				//escribo en el indice
		//es un idea y vuelta entre cero y la posicion de la baja ¿se puede optimizar?
	end;
	close(mae);
end;

procedure listar(var mae:f_novelas);
var
	txt:Text;
	reg:novela;
begin
	assign(txt, 'novelas.txt');
	rewrite(txt);
	reset(mae);
	seek(mae, 1);//skip cabecera
	leer(mae, reg);
	while(reg.codigo <> valorAlto)do
	begin
		writeln(txt, reg.codigo, ' ', reg.duracion, ' ', reg.precio, ' ', reg.nombre);
		writeln(txt, reg.genero);
		writeln(txt, reg.director);
		leer(mae, reg);
	end;
	close(mae);
	close(txt);
end;

var arc:f_novelas; opt:char;  name:String;
BEGIN
	writeln('Introduce el nombre del archivo');
	readln(name);
	assign(arc, name);
	Writeln('[a] Crear archivo');
	Writeln('[b] Abrir archivo');
	Writeln('[c] Listar');
	readln(opt);
	case opt of
		'a': crear(arc);
		'b':begin
				Writeln('[1] Alta');
				Writeln('[2] Modificar');
				Writeln('[3] Baja');
				Readln(opt);
				case opt of
					'1': alta(arc);
					'2': modificar(arc);
					'3': bajaFisica(arc);
				end;
			end;
		'c': listar(arc);
	end;
END.
