program ej6;

const
	valorAlto = 9999;
type
	detalle = record
		codigo_loc:integer;
		codigo_cepa:integer;
		casos_act:integer;
		casos_nue:integer;
		casos_rec:integer;
		fallecidos:integer;
	end;
	maestro = record
		codigo_loc:integer;
		nombre_loc:String;
		codigo_cepa:integer;
		nombre_cepa:String;
		casos_act:integer;
		casos_nue:integer;
		casos_rec:integer;
		fallecidos:integer;
	end;
		
	f_maestro = file of maestro;
	f_detalle = file of detalle;
	v_det = array[1..10] of f_detalle;
	v_regd = array[1..10] of detalle;
	
procedure leerDetalle(var arc:f_detalle; var reg:detalle);
begin
	if(not eof(arc))then
		read(arc, reg)
	else
		reg.codigo_loc := valorAlto;
end;

procedure leerMaestro(var arc:f_maestro; var reg:maestro);
begin
	if(not eof(arc))then
		read(arc, reg)
	else
		reg.codigo_loc := valorAlto;
end;
	
procedure minimo(var vec:v_det; var vec_regd:v_regd; var min:detalle);
var
	i,pos:integer;
begin
	for i:=1 to 10 do
	begin
		if(vec_regd[i].codigo_loc < min.codigo_loc) and (vec_regd[i].codigo_cepa < min.codigo_cepa)then
		begin
			min := vec_regd[i];
			pos := i;
		end;
	end;
	if(min.codigo_loc <> valorAlto)then
		leerDetalle(vec[pos], vec_regd[pos]);
end;
	
procedure update(var vec:v_det; var mae:f_maestro);
var
	vec_regd:v_regd;
	i:integer;
	min:detalle;
	regm:maestro;
begin
	reset(mae);
	for i:=1 to 10 do
	begin
		reset(vec[i]);
		leerDetalle(vec[i], vec_regd[i]);
	end;
	minimo(vec, vec_regd, min);
	while(min.codigo_loc <> valorAlto)do
	begin
		leerMaestro(mae, regm);
		while(regm.codigo_loc <> min.codigo_loc) and (regm.codigo_cepa <> min.codigo_cepa)do
		begin
			leerMaestro(mae, regm);
		end;
		regm.fallecidos := regm.fallecidos + min.fallecidos;
		regm.casos_rec := regm.casos_rec + min.casos_rec;
		regm.casos_act := min.casos_act;
		regm.casos_nue := min.casos_nue;
		seek(mae, filepos(mae) - 1);
		write(mae, regm);
		minimo(vec, vec_regd, min);
	end;
end;

BEGIN

END.
