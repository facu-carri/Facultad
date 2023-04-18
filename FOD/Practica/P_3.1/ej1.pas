program ej1;
const
	valorAlto = 9999;
type
	emple = record
		nro:integer;
		apellido:String;
		nombre:String;
		edad:integer;
		dni:String;
	end;
	archivo = file of emple;

procedure leer(var maestro:archivo; reg:emple);
begin
	if(not eof(maestro))then
		read(maestro, reg)
	else
		reg.nro := valorAlto;
end;

procedure bajaFisica(var maestro:archivo; reg:emple);
var
	regm:emple;
	pos:integer;
begin
	leer(maestro, regm);
	while(regm.nro <> valorAlto) and (regm.nro <> reg.nro)do
	begin
		leer(maestro, regm);
	end;
	if(regm.nro <> valorAlto)then
	begin
		pos := filepos(maestro) - 1;
		seek(maestro, filesize(maestro) - 1);
		read(maestro, reg);
		seek(maestro, pos);
		write(maestro, reg);
		seek(mestro, filesize(maestro) - 1);
		truncate(maestro);
	end;
	close(maestro);
end;

BEGIN

END.
