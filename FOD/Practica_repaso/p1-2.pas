program ej2;

type
	archivo = file of integer;

var arc:archivo; filename:String; cant,total,n:integer;
BEGIN
	cant := 0;
	total := 0;
	writeln('Introducir el nombre del archivo anterior');
	readln(filename);
	assign(arc, 'C:\Users\FACU\Desktop\Facultad\FOD\Practica_repaso\' + filename);
	while(not eof(arc))do begin
		read(arc, n);
		if(n < 1500)then begin
			cant := cant + 1;
			total := total + n;
		end;
		writeln(n); //listar el contenido
	end;
	writeln('promedio ', (total/cant)*100);
	close(arc);
END.
