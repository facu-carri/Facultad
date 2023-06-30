program ej9;
const
	valorAlto = 9999;
type
	mesa = record
		codigoProv:integer;
		codigoLoc:integer;
		nro:integer;
		votos:integer;
	end;
	maestro = file of mesa;
	
procedure leer(var mae:maestro; var reg:mesa);
begin
	if(eof(mae))then
		reg.nro := valorAlto
	else
		read(mae, reg);
end;
	
procedure listar(var mae:maestro);
var reg_m, act:mesa; votosLoc, votosProv, votosTotal:integer;
begin
	votosTotal := 0;
	reset(mae);
	leer(mae, reg_m);
	while(reg_m.nro <> valorAlto)do begin
		act := reg_m;
		writeln('Codigo de provincia ', act.codigoProv);
		votosProv := 0;
		while(reg_m.codigoProv = act.codigoProv)do begin
			writeln('Codigo de localidad ', act.codigoProv);
			votosLoc := 0;
			while(reg_m.codigoProv = act.codigoProv) and (reg_m.codigoLoc = act.codigoLoc)do begin
				votosLoc := votosLoc + reg_m.votos;
				leer(mae, reg_m);
			end;
			Writeln('Total de votos ', votosLoc);
			votosProv := votosProv + votosLoc;
		end;
		writeln('Total de votos Provincia: ', votosProv);
		votosTotal := votosTotal + votosProv;
	end;
	Writeln('Total General de Votos: ', votosTotal);
end;
	
var mae:maestro;
BEGIN
	assign(mae, 'maestro.dat');
	reset(mae);
	listar(mae);
END.
