program ej10;
const
	valorAlto = 9999;
type
	t_cat_length = 1..15;
	t_cat = record
		nro:t_cat_length;
		price:real;
	end;
	empleado = record
		depto:integer;
		division:integer;
		nro:integer;
		cat:t_cat_length;
		cantHoras:integer;
	end;
	cat_price = array[t_cat_length] of real;
	maestro = file of empleado;
	
procedure cargarHoras(var arr:cat_price);
var txt:Text; i:integer; c:t_cat;
begin
	assign(txt, 'horas.txt');
	reset(txt);
	for i:=1 to 15 do begin
		readln(txt, c.nro, c.price);
		arr[c.nro] := c.price;
	end;
	close(txt);
end;
	
procedure leer(var mae:maestro; var reg:empleado);
begin
	if(eof(mae))then
		reg.nro := valorAlto
	else
		read(mae, reg);
end;
	
procedure listar(var mae:maestro; var arr:cat_price);
var m:empleado; deptActual, divActual, nroActual, horasEmple, cat, totalHsDiv, totalHsDepto:integer;
	montoDiv, totalDepto:real;
begin
	reset(mae);
	leer(mae, m);
	while(m.nro <> valorAlto)do begin
		deptActual := m.depto;
		Writeln('Departamento ', deptActual);
		totalHsDepto := 0;
		totalDepto := 0;
		while(m.depto = deptActual)do begin
			divActual := m.division;
			totalHsDiv := 0;
			montoDiv := 0;
			writeln('Division ', divActual);
			while(m.depto = deptActual) and (m.division = divActual)do begin
				writeln('Numero de empleado *Total de Hs. *Importe a cobrar');
				horasEmple := 0;
				nroActual := m.nro;
				cat := m.cat;
				while(m.depto = deptActual) and (m.division = divActual) and (m.nro = nroActual) do begin
					horasEmple := horasEmple + m.cantHoras;
					leer(mae, m);
				end;
				writeln(nroActual, horasEmple, (horasEmple * arr[cat]));
				montoDiv := montoDiv + (horasEmple * arr[cat]);
				totalHsDiv := totalHsDiv + horasEmple;
			end;
			writeln('Total de horas division ', totalHsDiv);
			writeln('Monto total por division ', montoDiv);
			totalHsDepto := totalHsDepto + totalHsDiv;
			totalDepto := totalDepto + montoDiv;
		end;
		writeln('Total horas departamento: ', totalHsDepto);
		writeln('Monto total departamento: ', totalDepto);
	end;
	close(mae);
end;
	
var mae:maestro; arr:cat_price;
BEGIN
	cargarHoras(arr);
	assign(mae, 'maestro.dat');
	listar(mae, arr);
END.
