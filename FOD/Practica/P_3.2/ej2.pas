program ej2;
const
	valorAlto = 9999;
type
	asistente = record
		nro:integer;
		apellido:String;
		nombre:String;
		email:String;
		telefono:integer;
		dni:String;
	end;
	maestro = file of asistente;

procedure loadReg(var reg:asistente);
begin
	writeln('nombre'); readln(reg.nombre);
	writeln('apellido'); readln(reg.apellido);
	writeln('nro'); readln(reg.nro);
	writeln('email'); readln(reg.email);
	writeln('telefono'); readln(reg.telefono);
	writeln('dni'); readln(reg.dni);
end;

procedure bajaLogica(var mae:maestro);
var
	reg:asistente;
begin
	leer(mae, reg);
	while(mae.nro <> valorAlto)do
	begin
		if(mae.nro < 1000)then
		begin
			reg.nombre := concat('@', reg.nombre);
			seek(mae, filepos(mae) - 1));
			write(mae, reg);
		end;
		leer(mae, reg);
	end;
	close(mae);
end;

BEGIN

END.
