program ej11;
const
	valorAlto = 9999;
type
	datos_m = record
		nombre:String;	//nombre de la provincia
		cant:integer;		//cantidad de personas alfabetizadas
		encu:integer;		//total de encuestados
	end;
	datos_d = record
		nombre:String;	//nombre de la provincia
		codeLoc:integer;	//codigo de localidad
		cant:integer;		//cantidad de personas alfabetizadas
		encu:integer;		//total de encuestados
	end;
	maestro = file of detos_m;
	detalle = file of datos_d;

procedure leerMae(var mae:maestro; var reg_m:datos_m);
begin
	if(eof(mae))then
		reg_m.cant := valorAlto
	else
		read(mae, reg_m);
end;

procedure leerDet(var det:detalle; var reg_d:datos_d);
begin
	if(eof(det))then
		reg_d.cant := valorAlto
	else
		read(det, reg_d);
end;

procedure minimo(var d1,d2:detalle; var r_d1,r_d2,min:datos_d);
begin
	if(r_d1.nombre <= r_d2.nombre)then begin
		min := r_d1;
		leerDet(d1, r_d1); 
	end
	else begin
		min := r_d2;
		leerDet(d2, r_d2);
	end;
end;

procedure actualizar(var mae:maestro; var det1:detalle; var det2:detalle);
var
	r_d1,r_d2,min:datos_d;
	r_mae:datos_m;
	nombreAct:String;
	totalEn, totalAl:integer;
begin
	reset(mae); reset(d1); reset(d2);
	leerDet(det1, r_d1);
	leerDet(det2, r_d2);
	minimo(d1, d2, r_d1, r_d2, min);
	//i got the min
	while(min.cant <> valorAlto)do begin
		totalEn := 0;
		totalAl := 0;
		nombreAct := min.nombre;
		while(min.nombre = nombreAct)do begin
			totalEn := totalEn + min.encu;
			totalAl := totalAl + min.cant;
			minimo(d1, d2, r_d1, r_d2, min);
		end;
		read(mae, r_mae);
		while(nombreAct <> r_mae.nombre)do begin
			read(mae, r_mae);
		end;
		seek(mae, filepos(mae)-1);
		r_mae.cant := r_mae.cant + totalAl;
		r_mae.encu := r_mae.encu + totalEn;
		write(mae, r_mae);
	end;
	close(det1);
	close(det2);
	close(mae);
end;

var det1,det2:detalle; mae:maestro;	
BEGIN
	assign(mae, 'maestro.dat');
	assign(det1, 'detalle1.dat');
	assign(det2, 'detalle2.dat');
	actualizar(mae,det1,det2);
END.
