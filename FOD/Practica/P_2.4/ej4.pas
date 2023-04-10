program ej4;
const
	valorAlto = 9999;
type
	fecha = record
		dia:integer;
		mes:integer;
		anio:integer;
	end;
	sesion = record
		codigo:integer;
		fecha:fecha;
		tiempo:integer;//tiempo_total_de_sesiones_abiertas
	end;
	log = file of sesion;
	logs = array[1..5] of log;
	vec_reg = array[1..5] of sesion;
	//5 máquinas
	//semanalmente, cada maquina genera un log de sesiones
	//semana 1 -> [log] [log] [log] [log] [log]
	//log file de usuario
	
procedure leer(var arc:log; var reg:sesion);
begin
	if(not eof(arc))then
		read(arc, reg)
	else
		reg.codigo := valorAlto;
end;
	
function checkFecha(f1:fecha; f2:fecha; op:String):Boolean;
begin
	case op of
		'lt': checkFecha := (f1.anio < f2.anio) or ((f1.anio = f2.anio) and (f1.mes < f2.mes)) or ((f1.anio = f2.anio) and (f1.mes = f2.mes) and (f1.dia < f2.dia));
		'eq': checkFecha := (f1.anio = f2.anio) and (f1.mes = f2.mes) and (f1.dia = f2.dia);
	end;
end;
	
procedure minimo(var maquinas:logs; var v_regd:vec_reg; var min:sesion);
var
	i,pos:integer;
begin
	for i:=1 to 5 do
	begin
		if(v_regd[i].codigo < min.codigo) and (checkFecha(v_regd[i].fecha, min.fecha, 'lt'))then begin
			min := v_regd[i];
			pos := i;
		end;
	end;
	if(min.codigo <> valorAlto)then
		leer(maquinas[pos], v_regd[pos]);
end;
	
procedure generarMaestro(var maquinas:logs);
var
	i:integer;
	v_regd:vec_reg;
	min,actual:sesion;
	mae:log;
begin
	assign(mae, '/var/log.dat');
	rewrite(mae);
	for i:=1 to 5 do
	begin
		reset(maquinas[i]);
		leer(maquinas[i], v_regd[i]);
	end;
	min.codigo := valorAlto;
	minimo(maquinas, v_regd, min);
	while(min.codigo <> valorAlto)do
	begin
		actual := min;
		while(actual.codigo = min.codigo)do
		begin
			actual.tiempo := 0;
			while(checkFecha(actual.fecha, min.fecha, 'eq'))do
			begin
				actual.tiempo := actual.tiempo + min.tiempo;
				minimo(maquinas, v_regd, min);
			end;
			write(mae, actual);
		end;
	end;
	for i:=1 to 5 do
		close(maquinas[i]);
	close(mae);
end;

BEGIN
	
END.
