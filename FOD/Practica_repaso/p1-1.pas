program ej1;

type
	archivo = file of integer;

var filename:String; n:integer; arc:archivo;
BEGIN
	Writeln('Introduzca el nombre del archivo:');
	Readln(filename);
	assign(arc, filename);
	rewrite(arc);
	readln(n);
	while(n <> 3000)do
	begin
		write(arc, n);
		readln(n);
	end;
	close(arc);
END.
