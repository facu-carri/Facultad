program hell;
type archivo = file of integer;
procedure leerArchivo(var arc_logico:archivo);
var nro:integer;
begin
	reset(arc_logico);
	while not eof(arc_logico) do begin
		read(arc_logico, nro);
		WriteLn('Pos: ', FilePos(arc_logico));
		writeln(nro);
	end;
	WriteLn('Size: ', FileSize(arc_logico));
	close(arc_logico);
end;
var arc_logico:archivo;
	nro:integer;
	arc_fisico:String[40];
BEGIN
	Writeln('Ingrese el nombre del archivo:');
	read(arc_fisico);
	Assign(arc_logico, arc_fisico);
	rewrite(arc_logico);
	read(nro);
	while nro <> 0 do begin
		write(arc_logico, nro);
		read(nro);
	end;
	close(arc_logico);
	leerArchivo(arc_logico);
END.

