program untitled;
const
	valorAlto = 9999;
type
	cliente = record
		codigo:integer;
		nya:String;
		monto:real;
		anio:integer;
		mes:1..12;
		dia:1..31;
	end;
	maestro = file of cliente;
//Tengo un archivo de ventas
//Necesito hacer un archivo con las ventas organizadas por cliente

procedure leer(var mae:maestro; var reg:cliente);
begin
	if(eof(mae))then
		reg.codigo := valorAlto
	else
		read(mae, reg);
end;

procedure report(var mae:maestro);
var reg_m, act:cliente; totalEmpresa,totalAnio:real;
begin
	totalEmpresa := 0;
	reset(mae);
	leer(mae, reg_m);
	while(reg_m.codigo <> valorAlto)do
	begin
		Writeln('>Codigo: ', reg_m.codigo);
		Writeln('>Nombre y apellido: ', reg_m.nya);
		act := reg_m;
		act.monto := 0;
		while(act.codigo = reg_m.codigo)do
		begin
			totalAnio := 0;
			writeln('>Anio: ', reg_m.anio);
			while(act.anio = reg_m.anio) and (act.codigo = reg_m.codigo)do
			begin
				writeln('>Mes: ', reg_m.mes);
				while(act.mes = reg_m.mes) and (act.anio = reg_m.anio) and (act.codigo = reg_m.codigo)do
				begin
					act.monto := act.monto + reg_m.monto;
					leer(mae, reg_m);
				end;
				writeln('>>Monto total del mes: ', act.monto);
				totalAnio := totalAnio + act.monto;
			end;
			totalEmpresa := totalEmpresa + totalAnio;
			writeln('>>Monto total del anio: ', totalAnio);
		end;
	end;
	Writeln('>Total Empresa: ', totalEmpresa);
	close(mae);
end;

var mae:maestro;
BEGIN
	assign(mae, 'maestro.dat');
	report(mae);
END.
