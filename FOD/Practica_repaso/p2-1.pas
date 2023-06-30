program p1;
const
	valorAlto = 9999;
type
	emple = record
		codigo:integer;
		nombre:String;
		monto:integer;
	end;
	maestro = file of emple;

procedure leer(var mae:maestro; var reg:emple);
begin
	if(eof(mae))then
		reg.codigo := valorAlto
	else
		read(mae, reg);
end;

procedure compactar(var mae,result:maestro);
var act,e:emple;
begin
	rewrite(result);
	reset(mae);
	leer(mae, e);
	while(e.codigo <> valorAlto)do begin
		act := e;
		act.monto := 0;
		while(act.codigo = e.codigo)do begin
			act.monto := act.monto + e.monto;
			leer(mae, e);
		end;
		write(result, act);
	end;
end;

var mae,result:maestro;
BEGIN
	assign(mae, 'maestro.dat');
	assign(result, 'result.dat');
	compactar(mae, result);
END.

