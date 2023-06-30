program parcial;
const
	valorAlto = 9999;
	n = 30;
type
	date = record
		dia:integer;
		mes:integer;
		anio:integer;
	end;
	 ventas = record
		cod_farmaco:integer;
		nombre:String;
		fecha:date;
		cantidad_vendida:integer;
		forma_pago:String;//contado/tarjeta
	end;
	detalle = file of ventas;
	arrSuc = array[1..n] of detalle;
	arrRegDet = array[1..n] of ventas;
	
procedure leerDet(var det:detalle; var reg_d:ventas);
begin
	if(not eof(det))then
		read(det, reg_d)
	else
		reg_d.cod_farmaco := valorAlto;
end;
	
function minFecha(f1:date; f2:date):boolean;
begin
	if(f1.anio < f2.anio)then
		minFecha := true
	else if(f1.anio = f2.anio) and (f1.mes < f2.mes) then
		minFecha := true
	else minFecha := (f1.anio = f2.anio) and (f1.mes = f2.mes) and (f1.dia <= f2.dia)
end;
	
procedure minimo(var arRegD:arrRegDet; var arFileDet:arrSuc; var min:ventas);
var pos,i:integer;
begin
	min.cod_farmaco := valorAlto;
	pos := 0;
	for i:=1 to n do begin
		if(arRegD[i].cod_farmaco <> valorAlto)then begin
			if(arRegD[i].cod_farmaco <= min.cod_farmaco) and (minFecha(arRegD[i].fecha, min.fecha))then begin
				min := arRegD[i];
				pos := i;
			end;
		end;
	end;
	if(min.cod_farmaco <> valorAlto)then begin
		leerDet(arFileDet[pos], arRegD[pos]);
	end;
end;
	
procedure informarCant(var arFileDet:arrSuc);
var arRegD:arrRegDet; min:ventas; i,cod,ventasFarmaco,max,maxFarmaco:integer;
begin
	max := -999;
	maxFarmaco := -1;
	for i:=1 to n do begin
		reset(arFileDet[i]);
		leerDet(arFileDet[i], arRegD[i]);
	end;
	minimo(arRegD, arFileDet, min);
	while(min.cod_farmaco <> valorAlto)do begin
		cod := min.cod_farmaco;
		ventasFarmaco := 0;
		while(cod = min.cod_farmaco)do begin
			//f := min.fecha;
			//while(cod = min.cod_farmaco) and (minFecha(f, min.fecha))do begin
				ventasFarmaco := ventasFarmaco + min.cantidad_vendida;
				minimo(arRegD, arFileDet, min);
			//end;
		end;
		if(ventasFarmaco > max)then begin
			max := ventasFarmaco;
			maxFarmaco := cod;
		end;
	end;
	if(maxFarmaco <> -1)then
		Writeln('El farmaco con mayor numero de ventas es ', maxFarmaco);
end;

procedure exportToTxt(var arFileDet:arrSuc);
var arRegD:arrRegDet; i,cod,cantVendida:integer; min,aux:ventas; f:date; txt:Text;
begin
	assign(txt, 'resumenVentas.txt');
	rewrite(txt);
	for i:=1 to n do begin
		reset(arFileDet[i]);
		leerDet(arFileDet[i], arRegD[i]);
	end;
	minimo(arRegD, arFileDet, min);
	while(min.cod_farmaco <> valorAlto)do begin
		f := min.fecha;
		while(minFecha(f, min.fecha))do begin // f1 = f2
			cantVendida := 0;
			cod := min.cod_farmaco;
			aux := min;
			while(cod = min.cod_farmaco) and (minFecha(f, min.fecha))do begin //misma fecha, min cod_farmaco
				cantVendida := cantVendida + min.cantidad_vendida;
				minimo(arRegD, arFileDet, min);
			end;
			writeln(txt, cod, '', aux.fecha.dia, '', aux.fecha.mes, '', aux.fecha.anio, '', cantVendida, '', aux.nombre);
		end;
	end;
end;

{
procedure loadFecha(var f:date; dia,mes,anio:integer);
begin
	f.dia := dia;
	f.mes := mes;
	f.anio := anio;
end;
}
	
var arDet:arrSuc;
BEGIN
	informarCant(arDet);
	exportToTxt(arDet);
END.
