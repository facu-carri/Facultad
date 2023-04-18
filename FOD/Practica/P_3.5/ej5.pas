program ej5;
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
	
procedure eliminarFlor(var a: tArchFlores; flor:reg_flor);
begin
	
end;
	
BEGIN
	
END.
