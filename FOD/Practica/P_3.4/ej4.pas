program ej4;
const
	valorAlto = 9999;
type
	reg_flor = record
		nombre: String[45];
		codigo:integer;
	end;
	tArchFlores = file of reg_flor;

procedure leer(var a:tArchFlores; var reg:reg_flor);
begin
	if(not eof(a))then
		read(a, reg)
	else
		reg.codigo := valorAlto;
end;

procedure agregarFlor(var a:tArchFlores; nombre:String; codigo:integer);
var
	regm:reg_flor; pos:integer;
begin
	reset(a);
	leer(a, regm);
	if(regm.codigo <> valorAlto) and (regm.codigo <> 0)then
	begin
		seek(a, regm.codigo * -1);
		leer(a, regm);
		pos := regm.codigo;
		regm.codigo := codigo;
		regm.nombre := nombre;
		seek(a, filepos(a) - 1);
		write(a, regm);
		seek(a, 0);
		regm.codigo := pos;
		write(a, regm);
	end;
	close(a);
end;

procedure listar(var a:tArchFlores);
var
	reg:reg_flor; codeZero:integer;
begin
	reset(a);
	leer(a, reg);
	while(reg.codigo <> 0)do
	begin
		seek(a, reg.codigo * -1);
	end;
	codeZero := filepos(a);
	seek(a, 1);
	while(reg.codigo <> valorAlto)do
	begin
		if(reg.codigo >= 0) and (filepos(a) <> codeZero)then//en caso de que sea 0, chequeo que no sea una baja
			writeln(reg.nombre, ' ', reg.codigo);
		leer(a, reg);
	end;
	close(a);
end;
	
BEGIN
	
END.
