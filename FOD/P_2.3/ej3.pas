program ej3;
const valorAlto = 9999;
type
	prod = record
		codigo:integer;
		nombre:String;
		desc:String;
		stockDisp:integer;
		stockMin:integer;
		precio:real;
	end;
	prod_d = record
		codigo:integer;
		cant:integer;
	end;
	f_maestro = file of prod;
	f_detalle = file of prod_d;
	v_detalle = array[1..30] of f_detalle;
	v_regd = array[1..30] of prod_d;
	
procedure leerDetalle(var arc:f_detalle; var prod:prod_d);
begin
	if(not eof(arc))then
		read(arc, prod)
	else
		prod.codigo = valorAlto;
end;
	
procedure minimo(var vec_d:v_detalle; var vec_reg:v_redg, var min:prod_d);
var
	i,pos:integer;
begin
	for i:=1 to 30 do
	begin
		if(vec_reg[i].codigo < min.codigo)then
		begin
			min := vec_reg[i];
			pos := i;
		end;
	end;
	if(min.codigo <> valorAlto)then
		leerDetalle(vec_d[pos], vec_reg[pos]);
end;
	
procedure processDay(var vec_d:v_detalle; var maestro:f_maestro);
var
	min:prod_d;
	regm:prod;
	i:integer;
	vec_reg:v_regd;
	txt:Text;
begin
	assign(txt, 'stockMin.txt');
	rewrite(txt);
	for (i:=1 to 30)do
	begin
		reset(vec_d[i]);
		leerDetalle(vec_d[i], vec_reg[i]);
	end;
	min.codigo := valorAlto;
	minimo(vec_d, vec_reg, min);
	while(min.codigo <> valorAlto)do
	begin
		leerMaestro(maestro, regm);
		while(min.codigo <> regm.codigo)do
		begin
			leerMaestro(maestro, regm);
		end;
		regm.stockDisp := regm.stockDisp - min.cant;
		seek(maestro, filepos(maestro) - 1);
		write(maestro, regm);
		if(regm.stockDisp < regm.stockMin)then
		begin
			writeln(txt, regm.nombre);
			writeln(txt, regm.desc);
			writeln(txt, regm.stockDisp, ' ', regm.precio);
		end;
		minimo(vec_d, vec_reg, min);
	end;
	close(maestro);
	for i:=1 to 30 do
	begin
		close(vec_d[i]);
	end;
end;
	
BEGIN

END.
