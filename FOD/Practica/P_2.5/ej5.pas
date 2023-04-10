program ej5;
const
	valorAlto = 9999;
type
	direccion = record
		calle:String;
		nro:integer;
		piso:integer;
		depto:String;
		ciudad:String;
	end;
	fecha = record
		dia:integer;
		mes:integer;
		anio:integer;
	end;
	nacimiento = record
		dni:integer;
		nro:integer;
		nombre:String;
		apellido:String;
		direc:direccion;
		matricula:integer;
		
		nombreMadre:String;
		apellidoMadre:String;
		dniMadre:integer;
		
		nombrePadre:String;
		apellidoPadre:String;
		dniPadre:integer;
	end;
	fallecimiento = record
		dni:integer;
		nombre:String;
		apellido:String;
		matricula:integer;
		fecha:fecha;
		hora:integer;
		lugar:String;
	end;
	f_nacimientos = file of nacimiento;
	f_fallecimientos = file of fallecimiento;
	delegacion = record
		nacimientos:f_nacimientos;
		fallecimientos:f_fallecimientos;
	end;
	v_deleg = array[1..50] of delegacion;
	v_regd_nac = array[1..50] of nacimiento;
	v_regd_rip = array[1..50] of fallecimiento;
	maestro_r = record
		data:nacimiento;
		ripData:fallecimiento;
	end;
	maestro = file of maestro_r;
	
procedure leer(var arc:f_nacimientos; var reg:nacimiento);
begin
	if(not eof(arc))then
		read(arc, reg)
	else
		reg.dni := valorAlto;
end;

procedure leerMuerte(var arc:f_fallecimientos; var reg:fallecimiento);
begin
	if(not eof(arc))then
		read(arc, reg)
	else
		reg.dni := valorAlto;
end;
	
procedure minimo(var vec:v_deleg; var vec_d:v_regd_nac; var min:nacimiento);
var
	i,pos:integer;
begin
	for i:=1 to 50 do
	begin
		if(vec_d[i].dni < min.dni)then
		begin
			min := vec_d[i];
			pos := i;
		end;
	end;
	if(min.dni <> valorAlto)then
		leer(vec[pos].nacimientos, vec_d[pos]);
end;
	
procedure minimoMuerte(var vec:v_deleg; var vec_d:v_regd_rip; var min:fallecimiento);
var
	i,pos:integer;
begin
	for i:=1 to 50 do
	begin
		if(vec_d[i].dni < min.dni)then
		begin
			min := vec_d[i];
			pos := i;
		end;
	end;
	if(min.dni <> valorAlto)then
		leerMuerte(vec[pos].fallecimientos, vec_d[pos]);
end;
	
procedure crearMaestro(var deleg:v_deleg);
var
	i:integer;
	mae_r:maestro_r;
	mae:maestro;
	min_f:fallecimiento;
	min_n:nacimiento;
	vregd_alive:v_regd_nac;
	vregd_rip:v_regd_rip;
begin
	assign(mae, 'maestro.dat');
	rewrite(mae);
	for i:=1 to 50 do
	begin
		reset(deleg[i].nacimientos);
		leer(deleg[i].nacimientos, vregd_alive[i]);
		leerMuerte(deleg[i].fallecimientos, vregd_rip[i]);
	end;
	min_n.dni := valorAlto;
	minimo(deleg, vregd_alive, min_n);//get min vivo
	min_f.dni := valorAlto;
	minimoMuerte(deleg, vregd_rip, min_f);
	while(min_n.dni <> min_f.dni)do
	begin
		mae_r.data := min_n;
		write(mae, mae_r);//agrego vivos a los vivos mientras busco al muerto
		minimo(deleg, vregd_alive, min_n);//get min vivo
	end;
	//listo, tengo el que ripeo, voy para atras, leo y escribo
	seek(mae, filepos(mae) - 1);
	read(mae, mae_r);
	seek(mae, filepos(mae) - 1);
	mae_r.ripData := min_f;
	write(mae, mae_r);
	//una persona puede nacer en una delegacion y morir en otra
	//chequear si nació y falleció
	//El archivo nacimiento, tiene a la persona, si o si
	//El archivo de fallecimiento, nop
	//2 archivo detalle
	//while fall.codigo <> valorAlto
	//mientras que codigo fallecimiento <> codigo nacimiento, leo y agrego (agrego vivos)
	//leer(delegacion[i], regd_n);
	//regm.data := regd_n;
	//write(maestro, regm);
	//si está, rompo el while, significa que lo agregué y le tengo que poner la data de fallecimiento
	//seek(maestro, filepos(maestro) - 1);
	//read(maestro, regm);
	//regm.ripData := regd_f;
	//seek(maestro, filepos(maestro) - 1);
	//write(maestro, regm);
end;
	
BEGIN

END.
