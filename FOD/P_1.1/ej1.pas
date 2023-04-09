{
	Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
	incorporar datos al archivo. Los números son ingresados desde teclado. El nombre del
	archivo debe ser proporcionado por el usuario desde teclado. La carga finaliza cuando
	se ingrese el número 30000, que no debe incorporarse al archivo.
}
program ej1;
type
	archivo = file of integer;
	
procedure loadFile(var arc:archivo);
var nro:integer;
begin
	Write('Ingrese un numero: ');
	ReadLn(nro);
	while(nro <> 3000)do begin
		write(arc, nro);
		Write('Ingrese un numero: ');
		ReadLn(nro);
	end;
end;
	
var filename:String; arc:archivo;
BEGIN
	Write('Ingrese el nombre del archivo: ');
	ReadLn(filename);
	assign(arc, filename); //asigno ruta a arc
	rewrite(arc); //creo el archivo
	loadFile(arc);
	close(arc);
END.
