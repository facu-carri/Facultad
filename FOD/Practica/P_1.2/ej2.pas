{
	Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
	creados en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el
	promedio de los números ingresados. El nombre del archivo a procesar debe ser
	proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
	contenido del archivo en pantalla.
}
program ej2;
type
	archivo = file of integer;
	
procedure processFile(var arc:archivo);
var n,nro,total:integer; prom:Real;
begin
	n := 0;
	total := 0;
	while not eof(arc) do begin
		Read(arc, nro);
		total := total + 1;
		if(nro < 1500)then
			n := n + 1
	end;
	prom := (total/n) * 100;
	WriteLn('El archivo tiene ', n, ' numeros menores a 1500');
	WriteLn('El promedio de numeros menores a 1500 es ', prom:1:0, '%');
end;
	
var filename:String; arc:archivo;
BEGIN
	Write('Ingrese el nombre del archivo: '); //es test.dat
	ReadLn(filename);
	filename := '..\P_1.1\test.dat'; //queda en otra ruta, ja
	assign(arc, filename); //asigno ruta a arc
	reset(arc); //indica que el archivo ya existe
	processFile(arc);
	close(arc);
END.
