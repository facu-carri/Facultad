program hell_0_1;
var i,n1,n2:integer;
begin
	n1 := 0; n2 := 0;
	for i := 1 to 2 do begin
		WriteLn('Escribe un numero ');
		if(n1 = 0)then 
			Read(n1)
		else
			Read(n2);
	end;
	Write('Se ingresaron los valores ', n2); write(' y ', n1);
end.

program hell_0_2_a;
var i,n1,n2,res:integer;
begin
	n1 := 0; n2 := 0;
	for i := 1 to 2 do begin
		WriteLn('Escribe un numero ');
		if(n1 = 0)then 
			Read(n1)
		else
			Read(n2);
	end;
	res := n1 + n2;
	Write('La suma de ambos numeros es ', res);
end.

program hell_0_2_b;
var i,n1,n2:integer;
begin
	n1 := 0; n2 := 0;
	for i := 1 to 2 do begin
		WriteLn('Escribe un numero ');
		if(n1 = 0)then 
			Read(n1)
		else
			Read(n2);
	end;
	Write('La suma de ambos numeros es ', n1 + n2);
end.

program hell_0_3;
var n1,n2,res:real;
begin
	WriteLn('Escribe un numero real '); Read(n1);
	WriteLn('Escribe un numero real '); Read(n2);
	res := n1/n2;
	Write('El resultado de dividir ', n1:0:1); Write(' por ', n2:0:1); Write(' es ', res:0:1);
end.

program hell_0_4_a;
var diam,radio:real;
begin
	WriteLn('Escribe el diametro '); Read(diam);
	radio := diam/2;
	Write('El radio es ', radio:0:1;
end.

program hell_0_4_b;
const
	PI := 3.14;
var diam,radio,area:real;
begin
	WriteLn('Escribe el diametro '); Read(diam);
	radio := diam/2;
	area := PI * (radio * radio);
	Write('El area es ', area:0:1);
end.

program hell_0_4_c;
const
	PI := 3.14;
var diam,perim:real;
begin
	WriteLn('Escribe el diametro '); Read(diam);
	perim := diam*PI;
	Write('El perimetro es ', perim:0:1);
end.

program hell_0_5_a;
var x,y,candySell,resto:integer;
begin
	WriteLn('Cantidad de caramelos del kiosquero '); Read(x);
	WriteLn('Cantidad de clientes '); Read(y);
	candySell := x DIV y;
	WriteLn('A cada cliente le correspondera ', candySell);
	resto := x - (candySell * y);
	WriteLn('Al kiosquero le quedan ', resto);
end.

program hell_0_5_b;
const
	candyPrice = 1.6;
var x,y,candySell:integer; var resto:real;
begin
	WriteLn('Cantidad de caramelos del kiosquero '); Read(x);
	WriteLn('Cantidad de clientes '); Read(y);
	candySell := x DIV y;
	resto := candyPrice * (candySell * y);
	WriteLn('El kiosquero va a cobrar ', cobrar:2:1);
end.

program hell_0_6;
var valorConv,pesos,dolares:real; comision:integer;
begin
	WriteLn('Dolares '); Read(dolares);
	WriteLn('Comision '); Read(comision);
	WriteLn('valor del dolar '); Read(valorConv);
	pesos := dolares * valorConv;
	pesos := pesos + (pesos * (comision/100));
	Write('La transacción será de ', pesos:0:2); Write(' pesos argentinos');
end.

program hell_1_1;
var n1,n2:integer;
begin
	WriteLn('Ingrese un numero '); Read(n1);
	WriteLn('Ingrese un numero '); Read(n2);
	if(n1 = n2)then
		WriteLn('Los numeros leidos son iguales')
	else begin
	    if(n1 > n2)then begin
			Write(n1, ' es mayor que ');
			Write(n2)
		end else
			Write(n2, ' es mayor que '); Write(n1);
	end;
end.

program hell_1_2;
var n:real;
begin
	WriteLn('Ingrese un numero '); Read(n);
	Write('El valor absoluto de |', n:0:2);
	if(n < 0) then
		n := n * -1;
	Write('| es ', n:0:2);
end.

program hell_1_3;
var n1,n2,n3:integer;
begin
	WriteLn('Ingrese un numero '); Read(n1);
	WriteLn('Ingrese un numero '); Read(n2);
	WriteLn('Ingrese un numero '); Read(n3);
	if(n1 > n2)then begin
		if(n1 > n3)then begin
			write(n1, ' ');
			if(n2 > n3)then begin
				write(n2, ' ');
				write(n3)
			end else begin
				write(n3, ' ');
				write(n2)
			end
		end
		else begin
			Write(n3, ' ');
			Write(n1, ' ');
			Write(n2, ' ');
		end
	end
	else if(n2 > n3)then begin
		write(n2, ' ');
		if(n1 > n3)then begin
			write(n1, ' ');
			write(n3)
		end else
			write(n3, ' ');
			write(n1)
		end
	end
	else begin
		write(n3, ' ');
		write(n2, ' ');
		write(n1);
	end
end.

program hell_1_4;
var x,n:real;
begin
	WriteLn('Ingrese un numero '); Read(x);
	WriteLn('Ingrese un numero '); Read(n);
	while(n <> x*2)do begin
		WriteLn('Ingrese un numero '); Read(n);
	end
end.

program hell_1_5;
var x,n:real; i:integer;
begin
	WriteLn('Ingrese un numero '); Read(x);
	WriteLn('Ingrese un numero '); Read(n);
	i := 1;
	while(n <> x*2) and (i < 10)do begin
	    i := i + 1;
		Write('Ingrese un numero - ', i);
		WriteLn();
		Read(n);
	end
	if(n <> x*2)then
		writeLn('No se ha ingresado el doble de ', x);
end.

program hell_1_6;
var legajo,cantAlumn,cantAlumnProm,destacados:integer; promedio,destacadosPorcentaje:real;
begin
	legajo := 0;
	cantAlumn := 0;
	cantAlumnProm := 0;
	destacados := 0;
	WriteLn('Legajo '); Read(legajo);
	while(legajo <> -1)do begin
		WriteLn('Promedio '); Read(promedio);
		cantAlumn := cantAlumn + 1;
		if(promedio > 6.5)then begin
			cantAlumnProm := cantAlumnProm + 1;
			if(promedio > 8.5) and (legajo < 2500)then
				destacados := destacados + 1
		end;
		WriteLn('Legajo ');
		Read(legajo);
	end;
	destacadosPorcentaje := (destacados/cantAlumn)*100;
	WriteLn('Cantidad de alumnos leida ', cantAlumn);
	WriteLn('Promedio supera 6.5 ', cantAlumnProm);
	Write('Promedio supera 8.5 y legajo < 2500 ', destacadosPorcentaje:0:0); Write('%'); 
end.

program hell_1_7;
var code:integer; price,newPrice:real;
begin
	WriteLn('Ingrese el codigo del producto '); Read(code);
	while(code <> 32767)do begin
		WriteLn('Ingrese el precio actual '); Read(price);
		WriteLn('Ingrese el nuevo precio '); Read(newPrice);
		if(newPrice > price + price*(40/100))then begin
			Write('el aumento de precio del producto ', code);
			Write(' es superior al 10%');
		end
		else begin
			Write('el aumento de precio del producto ', code);
			Write(' no supera al 10%');
		end;
		WriteLn();
	    WriteLn('Ingrese el codigo del producto '); Read(code);
	end;
end.

program hell_1_8;
var car:char; var i,vocal:integer;
begin
	i := 0;
	vocal := 0;
	while(i < 3)do begin
	    WriteLn('Ingrese un caracter ');
	    Read(car);
		if(car = 'a') or (car = 'e') or (car = 'i') or (car = 'o') or (car = 'u') or (car = 'A') or (car = 'E') or (car = 'I') or (car = 'O') or (car = 'U') then
			vocal := vocal + 1;
		i := i + 1;
	end;
	if(vocal = 3)then
		WriteLn('Los tres son vocales')
	else
		WriteLn('Al menos un carácter no era vocal');
end.

program hell_1_9;
var car:char; var n,res:integer;
begin
	res := 0;
	WriteLn('Ingrese operación, suma "+" o resta "-" ');
	Read(car);
	if(car = '+') or (car = '-')then begin
		Read(n);
		if(n <> 0)then begin
			res := n;
			Read(n);
			while(n <> 0)do begin
				if(car = '+')then
					res := res + n
				else
					res := res - n;
				Read(n);
			end;
		end
		WriteLn('Resultado ', res);
	end
	else
		WriteLn('ERROR');
end.

program hell_1_10;
var n,total,i:integer;
begin
	total := 0;
	for i := 1 to 10 do begin
		writeLn('Escriba un número '); Read(n);
		total := total + n;
	end;
	WriteLn('La suma total es ', total);
end.

program hell_1_10_a;
var n,total,greater,i:integer;
begin
	total := 0;
	greater := 0;
	for i := 1 to 10 do begin
		writeLn('Escriba un número '); Read(n);
		if(n > 5)then
			greater := greater + 1;
		total := total + n;
	end;
	WriteLn('La suma total es ', total);
	WriteLn('La cantidad de numeros ingresados mayores que 5 es ', greater);
end.

program hell_1_11;
var n,i,nMax:integer;
begin
	for i := 1 to 10 do begin
		writeLn('Escriba un número '); Read(n);
		if(n > nMax)then
			nMax := n;
	end;
	WriteLn('El mayor número leído fue el ', nMax);
end.

program hell_1_11_a;
var n,i,nMax,pos:integer;
begin
	for i := 1 to 10 do begin
		writeLn('Escriba un número '); Read(n);
		if(n > nMax)then begin
			nMax := n;
			pos := i;
		end;
	end;
	Write('El mayor número leído fue el ', nMax); Write(', en la posicion ', pos);
end.

program hell_1_12;
type
	notaType = 1..10;
var nota:notaType; nombre:string; aprobados,notaSiete:integer;
begin
	aprobados := 0;
	notaSiete := 0;
	repeat
		WriteLn('Nombre del alumno '); ReadLn(nombre);
		WriteLn('Nota '); ReadLn(nota);
		if(nota >= 8)then
			aprobados := aprobados + 1;
		if(nota = 7)then
			notaSiete := notaSiete + 1;
	until(nombre = 'Zidane Zinedine');
	WriteLn('La cantidad de alumnos aprobados es ', aprobados);
	WriteLn('La cantidad de alumnos que obtuvieron un 7 es ', notaSiete);
end.

program hell_1_13;
type
	notaType = 1..10;
var n,i,nMin1,nMin2:integer;
begin
	nMin1 := 999;
	nMin2 := 999;
	for i := 1 to 1000 do begin
		WriteLn('Numero '); ReadLn(n);
		if(n < nMin1)then begin
			nMin2 := nMin1;
			nMin1 := n
		end
		else if(n < nMin2)then
			nMin2 := n;
	end;
	Write('Los dos números mínimos leídos son ', nMin1); Write(' y ', nMin2);
end.

program hell_1_13_a;
type
	notaType = 1..10;
var n,i,nMin1,nMin2:integer;
begin
	nMin1 := 999;
	nMin2 := 999;
	repeat
		WriteLn('Numero '); ReadLn(n);
		if(n < nMin1)then begin
			nMin2 := nMin1;
			nMin1 := n
		end
		else if(n < nMin2)then
			nMin2 := n;
	until(n = 0);
	Write('Los dos números mínimos leídos son ', nMin1); Write(' y ', nMin2);
end.

program hell_1_13_b;
type
	notaType = 1..10;
var n,i,nMin1,nMin2:integer;
begin
	nMin1 := 999;
	nMin2 := 999;
	WriteLn('Numero '); ReadLn(n);
	while(n <> 0)do begin
		if(n < nMin1)then begin
			nMin2 := nMin1;
			nMin1 := n
		end
		else if(n < nMin2)then
			nMin2 := n;
		WriteLn('Numero '); ReadLn(n);
	end;
	Write('Los dos números mínimos leídos son ', nMin1); Write(' y ', nMin2);
end.

program hell_1_14;
type
	notaType = 1..10;
var n,nMax,nMin,total:integer;
begin
	nMax := -1;
	nMin := 999;
	total := 0;
	repeat
		WriteLn('Numero '); ReadLn(n);
		if(n > nMax)then
			nMax := n;
		if(n < nMin)then
			nMin := n;
		total := total + n;
	until(n = 100);
	Writeln('Numero maximo leido ', nMax);
	Writeln('Numero minimo leido ', nMin);
	Writeln('Suma total ', total);
end.

program hell_1_15;
type
	codeType = 1..200;
var precio,min1,min2,code1,code2,prods,i:integer; code:codeType;
begin
	min1 := 999;
	min2 := 999;
	prods := 0;
	for i := 1 to 200 do begin
		WriteLn('Codigo del producto ');
		ReadLn(code);
		WriteLn('Precio del producto ');
		ReadLn(precio);
		if(precio > 16) and (precio MOD 2 = 0)then
			prods := prods + 1;
		if(precio < min1)then begin
			min2 := min1;
			min1 := precio;
			code2 := code1;
			code1 := code;
		end
		else if(precio < min2)then begin
			min2 := precio;
			code2 := code;
		end;
	end;
	writeln('ID primer producto más barato: ', code1);
    writeln('ID segundo producto más barato: ', code2);
    writeln('Cantidad de productos de costo mayor a $16 y codigo par: ', prods);
end.

program hell_1_16;
var pilotName,p1first,p2first,p1final,p2final:String; tiempo,max1,max2,min1,min2,i:integer;
begin
	min1 := 999;
	min2 := 999;
	max1 := -1;
	max2 := -1;
	for i := 1 to 100 do begin
		WriteLn('Nombre del piloto'); ReadLn(pilotName);
		WriteLn('Tiempo total'); ReadLn(tiempo);
		if(tiempo < min1)then begin
			min2 := min1;
			min1 := tiempo;
			p2first := p1first;
			p1first := pilotName;
		end
		else if(tiempo < min2)then begin
			min2 := tiempo;
			p2first := pilotName;
		end;
		if(tiempo > max1)then begin
			max2 := max1;
			max1 := tiempo;
			p2final := p1final;
			p1final := pilotName;
		end
		else if(tiempo > max2)then begin
			max2 := tiempo;
			p2final := pilotName;
		end;
	end;
	writeln('Primer puesto: ', p1first);
	writeln('Segundo puesto: ', p2first);
	writeln('Anteultimo puesto: ', p1final);
	writeln('Ultimo puesto: ', p2final);
end.

program hell_1_17;
type
	diaMes = 1..31;
var monto,ventas:integer; i:diaMes;
begin
	for i := 1 to 31 do begin
		ventas := 0;
		WriteLn('Ingrese montos del dia ', i); ReadLn(monto);
		while(monto <> 0)do begin
			ventas := monto + 1;
			ReadLn(monto);
		end;
		Write('El monto total del día ', i); WriteLn(' es ', ventas);
	end;
end.

program hell_1_17_a;
type
	diaMes = 1..31;
var monto,ventas,ventasMax:integer; i,recordVentas:diaMes;
begin
	ventasMax := -1;
	for i := 1 to 31 do begin
		ventas := 0;
		WriteLn('Ingrese montos del dia ', i); ReadLn(monto);
		while(monto <> 0)do begin
			ventas := monto + 1;
			ReadLn(monto);
		end;
		if(ventas > ventasMax)then begin
			ventasMax := ventas;
			recordVentas := i;
		end;
		Write('El monto total del día ', i); WriteLn(' es ', ventas);
	end;
end.

program hell_2_1;
3
21

program hell_2_2;
3
31

program hell_3_2;
type
	fecha = record
		dia:integer;
		mes:integer;
		anio:integer;
	end;
procedure leerFecha(var f:fecha);
begin
	WriteLn('Dia'); ReadLn(f.dia);
	WriteLn('Mes'); ReadLn(f.mes);
	WriteLn('Año'); ReadLn(f.anio);
end;
var	f:fecha; verano,primerosDias:integer;
begin
	verano := 0;
	primerosDias := 0;
	leerFecha(f);
	while(f < 2020)do begin
		if(f.mes >= 0) and (f.mes < 2)then
			verano := verano + 1;
		if(f.dia > 0) and (f.dia < 11)then
			primerosDias := primerosDias + 1;
		leerFecha(f);
	end;
end.

program hell_3_3;
const
	unesco = 23,435;
type
	escuela = record
		cue:integer;
		nombre:String;
		docentes:integer;
		alumnos:integer;
		localidad:String;
	end;
procedure leerEscuela(var f:escuela);
begin
	WriteLn('cue'); ReadLn(f.cue);
	WriteLn('nombre'); ReadLn(f.nombre);
	WriteLn('docentes'); ReadLn(f.docentes);
	WriteLn('alumnos'); ReadLn(f.alumnos);
	WriteLn('localidad'); ReadLn(f.localidad);
end;
function getProporcion(e:escuela):real;
begin
	getProporcion := e.alumnos/e.docentes;
end;
var	e:escuela; i,escSup:integer;
begin
	escSup := 0;
	for i := 1 to 2400 do begin
		leerEscuela(e);
		if(e.localidad = 'la plata') and (getProporcion(e) > unesco)then
			escSup := escSup + 1;
	end;
end.

program hell_3_4;
const
	clientesCant = 9300;
	precioXminuto = 3.40;
	precioXmb = 1.35;
type
	linea = record
		num:integer;
		minutos:integer;
		mb:integer;
	end;
	cliente = record
		code:integer;
		lineas:integer;
		totalMinutos:integer;
		totalMB:integer;
	end;
procedure leerLinea(var l:linea);
begin
	WriteLn('Numero de telefono'); Readln(l.num);
	WriteLn('Minutos consumidos'); Readln(l.minutos);
	WriteLn('MB consumidos'); Readln(l.mb);
end;
procedure leerCliente(var c:cliente);
var l:linea;
begin
	WriteLn('Codigo de cliente'); Readln(c.code);
	WriteLn('Lineas'); Readln(c.lineas);
	c.totalMB := 0; c.totalMinutos := 0;
	for i := 1 to c.lineas do begin
		leerLinea(l);
		c.totalMB = c.totalMB + l.mb;
		c.totalMinutos = c.totalMinutos + l.minutos;
	end;
	c.totalMB := c.totalMB * precioXmb;
	c.totalMinutos := c.totalMinutos * precioXminuto;
end;
var c:cliente; i:integer;
begin
	escSup := 0;
	for i := 1 to clientesCant do begin
		leerCliente(c);
	end;
end.

program hell_3_5;
type
	auto = record
		marca:String;
		modelo:String;
		precio:real;
	end;
procedure cargarAuto(var a:auto);
begin
	WriteLn('Marca'); ReadLn(a.marca);
	WriteLn('Modelo'); ReadLn(a.modelo);
	WriteLn('Precio'); ReadLn(a.precio);
end;
var a,caro:auto; precioActual:real; marcaActual:String; autos:integer;
begin
	marcaActual := 'ZZZ';
	caro.precio = -1;
	precioActual := 0;
	cargarAuto(a);
	while(a.marca <> 'ZZZ')do begin
		if(a.marca <> marcaActual)then begin
			WriteLn('Precio promedio marca ', marcaActual, ' es ', precioActual/autos);
			marcaActual := a.marca;
			precioActual := 0;
			autos := 0;
		end;
		precioActual := precioActual + a.precio;
		autos := autos + 1;
		if(a.precio >= caro.precio)then
			caro := a;
		cargarAuto(a);
	end;
end.

program hell_3_6;
type
	microprocesador = record
		marca:String;
		linea:String;
		cores:integer;
		velocidad:integer;
		nm:integer;
	end;
procedure cargarProcesador(var p:microprocesador);
begin
	Writeln('Marca'); ReadLn(p.marca);
	Writeln('Linea'); ReadLn(p.linea);
	Writeln('Cores'); ReadLn(p.cores);
	Writeln('Velocidad'); ReadLn(p.velocidad);
	Writeln('Nm'); ReadLn(p.nm);
end;
var mp:microprocesador; multiCore, cant,max1,max2:integer; marcaActual,marcaMas1,marcaMas2:string;
begin
	multiCore := 0;
	cant := 0;
	max1 := -1;
	max2 := -1;
	cargarProcesador(mp);
	marcaActual := mp.marca;
	while(mp.cores <> 0)do
	begin
		if(mp.marca <> marcaActual)then
		begin
			if(cant > max1)then begin
				max2 := max1;
				max1 := cant;
				marcaMas2 := marcaMas1;
				marcaMas1 := marcaActual;
			else if(cant > max2)then begin
				max2 := cant;
				marcaMas2 := marcaActual;
			end;
			marcaActual := mp.marca;
			cant := 0;
		end;
			
		if(mp.nm = 14)then
			cant := cant + 1;
		
		if(mp.cores > 2) and (mp.nm <= 22)then
			WriteLn(mp.marca, mp.linea);
			
		if((mp.marca = 'AMD') or (mp.marca = 'Intel')) and (mp.cores > 1) and (mp.velocidad >= 2) then
			multiCore := multiCore + 1;
			
		cargarProcesador(mp);
	end;
end;

program hell_3_7;
type
	centro = record
		nombre:String;
		universidad:String;
		cantInv:integer;
		cantBec:integer;
	end;
procedure cargarCentro(var c:centro);
begin
	WriteLn('Nombre'); ReadLn(c.nombre);
	WriteLn('Universidad'); ReadLn(c.universidad);
	WriteLn('Cantidad de investigadores'); ReadLn(c.cantInv);
	WriteLn('Cantidad de becarios'); ReadLn(c.cantBec);
end;

var c:centro; uniMaxInvs,uniActual,centroMinBecarios1,centroMinBecarios2,centroActual:String; maxInvs,max,centros,becariosCant,min1,min2:integer;
begin
	max := -1;
	min1 := 999;
	min2 := 999;
	maxInvs := 0;
	centros := 0;
	cargarCentro(c);
	uniActual := c.universidad;
	centroActual := c.nombre;
	while(c.cantInv <> 0)do begin
		if(c.universidad <> uniActual)then begin
			WriteLn('Cantidad total de centros de la universidad ', uniActual, ' es ', centros);
			if(maxInvs > max)then begin
				max := maxInvs;
				uniMaxInvs := uniActual;
			end;
			uniActual := c.universidad;
			centroActual := c.nombre;
			centros := 0;
			maxInvs := 0;
		end
		if(c.nombre <> centroActual)then begin
			if(becariosCant < min1)then begin
				min2 := min1;
				min1 := becariosCant;
				centroMinBecarios2 := centroMinBecarios1;
				centroMinBecarios1 := centroActual
			end else if(becariosCant < min2)then begin
				min2 := becariosCant;
				centroMinBecarios2 := centroActual;
			end;
		end;
		cargarCentro(c);
	end;
end.

program hell_3_8;
type
	docente = record
		dni:integer;
		nombre:String;
		email:String;
	end;
	proyecto = record
		codigo:integer;
		titulo:String;
		coordinador:docente;
		alumnos:integer;
		escuela:String;
		localidad:String;
	end;
procedure loadDocente(var d:docente);
begin
	WriteLn('dni'); ReadLn(d.dni);
	WriteLn('nombre'); ReadLn(d.nombre);
	WriteLn('email'); ReadLn(d.email);
end;
procedure loadProyecto(var p:proyecto);
begin
	WriteLn('Codigo del proyecto'); ReadLn(p.codigo);
	if(p.codigo <> -1)then begin
		WriteLn('Titulo'); ReadLn(p.titulo);
		WriteLn('Alumnos'); ReadLn(p.alumnos);
		WriteLn('Escuela'); ReadLn(p.escuela);
		WriteLn('Localidad'); ReadLn(p.localidad);
		loadDocente(p.coordinador);
	end;
end;
function checkDigitos(code:integer):boolean;
var pares,impares,digito:integer;
begin
	pares := 0;
	impares := 0;
	while(code <> 0)do begin
		digito := code MOD 10;
		if(digito MOD 2 = 0)then
			pares := pares + 1
		else
			impares := impares + 1;
		code := code DIV 10;
	end;
	checkDigitos := pares = impares;
end;
var p:proyecto; escuelasLocalidad,maxAlumnos1,maxAlumnos2,escuelasTotal,alumnosParty:integer; localidadActual,escuelaActual:String;
begin
	escuelasTotal := 0;
	maxAlumnos1 := -1;
	maxAlumnos2 := -1;
	loadProyecto(p);
	while(p.codigo <> -1)do begin
		localidadActual := p.localidad;
		escuelasLocalidad := 0;
		while(localidadActual = p.localidad) and (p.codigo <> -1)do begin
			escuelasLocalidad := escuelasLocalidad + 1; {escuelas por localidad, esto es en la actual}
			escuelaActual := p.escuela;
			alumnosParty := 0;
			while(escuelaActual = p.escuela) and (localidadActual = p.localidadActual) and (p.codigo <> -1)do begin
				alumnosParty := alumnosParty + 1;
				if(p.localidad = 'Daireaux') and (checkDigitos(p.codigo))then begin {cada proyecto, posee un titulo y una escuela}
					writeln('EL PROYECTO ', p.titulo, ' TIENE UN CODIGO CON IGUAL CANTIDAD DE DIGITOS PARES E IMPARES.');
				end;
				loadProyecto(p);
			end;
			if(alumnosParty > maxAlumnos1)then begin
				maxAlumnos2 := maxAlumnos1;
				maxAlumnos1 := alumnosParty;
				escuelaMax2 := escuelaMax1;
				escuelaMax1 := escuelaActual
			end else if(alumnosParty > maxAlumnos2)then begin
				maxAlumnos2 := alumnosParty;
				escuelaMax2 := escuelaActual;
			end;
		end;
		escuelasTotal := escuelasTotal + escuelasLocalidad;
	end;
end.

program hell_4_2;
const
	cant_datos = 150;
type
	vdatos = array[1..cant_datos] of real;
procedure cargarVector(var v:vdatos; var dimL:integer);
var num:real;
begin
	WriteLn('Ingrese numero'); ReadLn(num);
	while(dimL < cant_datos) or (num <> 0)do begin
		v[i] := num;
		dimL := dimL + 1;
		WriteLn('Ingrese numero');
		ReadLn(num);
	end;
end;
procedure modificarVectorySumar(var v:vdatos; dimL:integer; n:real; var suma:real);
var i:integer;
begin
	for i:=1 to dimL do begin
		suma := suma + v[i];
		v[i] := v[i] * n;
	end;
end;
var
	datos:vdatos;
	i,dim:integer;
	num,suma:real;
begin
	dim := 0;
	sumaTotal := 0;
	cargarVector(datos,dim);
	writeln(‘Ingrese un valor a sumar’);
	readln(num);
	modificarVectorySumar(datos,dim,num,suma);
	writeln(‘La suma de los valores es: ’, suma);
	writeln(‘Se procesaron: ’,dim, ‘ números’)
end.

program hell_4_3;
type
	vec = array[1..2] of integer;
procedure printVector(v:vec; dimL:integer);
var i:integer;
begin
	printVector4(v, 1, dimL);
	for i:=1 to dimL do begin
		WriteLn(v[i]);
	end;
end;
procedure printVector2(v:vec; dimL:integer);
var i:integer;
begin
	printVector4(v, dimL, 1);
	for i:=dimL downto 1 do begin
		WriteLn(v[i]);
	end;
end;
procedure printVector3(v:vec; dimL:integer);
var i:integer;
begin
	printVector4(v, dimL, (dimL DIV 2 + 1));
	for i:=dimL/2 downto 1 do begin
		WriteLn(v[i]);
	end;
	for i:= (dimL/2) + 1 downto 1 do begin
		WriteLn(v[i]);
	end;
end;
procedure printVector4(v:vec; x,y:integer);
var i:integer;
begin
	if(x < y)then begin
		for i:=x to y do
			WriteLn(v[x]);
	end
	else if(x > y) begin
		for i:=x downto y do
			WriteLn(v[x]);
	end
	else
		writeLn(v[x]);
end;

program hell_4_4;
const
	dimF = 100;
type
	vec = array[1..dimF] of integer;
function posicion(v:vec; pos:integer):integer;
var i:integer; ok:boolean;
begin
	i := 0; ok := false;
	while(i <= 100) and (not ok)do begin
		if(v[i] = pos)then
			ok := true
		else
			i := i + 1;
	end;
	if(ok)then
		posicion := i;
	else
		posicion := -1;
end;
procedure intercambiado(var v:vec; x,y:integer);
var aux:integer;
begin
	aux := v[x];
	v[x] := v[y];
	v[y] := aux;
end;
function suma(v:vec):integer;
var total,i:integer;
begin
	total := 0;
	for i:=1 to 100 do
		total := total + v[i];
	suma := total;
end;
function promedio(v:vec;dimF:integer):real;
begin
	promedio := suma(v)/dimF;
end;
function posMax(v:vec;dimF:integer):integer;
var max:integer;
begin
	max := -1;
	for i:=1 to dimF do begin
		if(v[i] > max)then
			max := v[i];
	end;
	posMax := posicion(max);
end;
function posMin(v:vec;dimF:integer):integer;
var min,p:integer;
begin
	min := 999;
	p := -1;
	for i:=1 to dimF do begin
		if(v[i] < min)then begin
			min := v[i];
			p := i;
		end;
	end;
	posMax := p;
end;
var v:vec;
begin
end.

program hell_4_7;
type
	digitos = array[0..9] of integer;
procedure procesarDigito(var v:digitos;num:integer);
begin
	while(num <> 0)do begin
		digito := num MOD 10;
		v[digito] := v[digito] + 1;
		num := num DIV 10;
	end;
end;
var	num,i,max,maxDig:integer; v:digitos;
begin
	maxDig := -1;
	max := -1;
	for i:=0 to 9 do
		v[i] := 0;
	ReadLn(num);
	while(num <> -1)do begin
		procesarDigito(v,num);
		readLn(num);
	end;
	for i:=0 to 9 do begin
		if(v[i] <> 0)then begin
			WriteLn('Numero ', i, ': ', v[i], ' veces');
			if(v[i] > max)then begin
				max := v[i];
				maxDig := i;
			end;
		end;
	end;
	if(maxDig <> -1) then
		WriteLn('El digito mas leido fue el ', maxDig);
	Write('Los digitos que no tuvieron ocurrencias son: ');
	for i:=0 to 9 do begin
		if(v[i] = 0)then
			Write(i, ', ');
end.

program hell_4_8;
const
	dimF = 400;
type
	alumno = record
		nroInsc:integer;
		dni:integer;
		apellido:String;
		nombre:String;
		anio:integer;
	end;
	alumnos = Array[1..dimF] of alumno;
function dniPar(dni:integer):Boolean;
var ok:Boolean;
begin
	ok := false;
	while(not ok) and (dni <> 0)do begin
		if(not((dni MOD 10) MOD 2 = 0))then
			ok := true;
		dni := dni DIV 10;
	end;
	dniPar := ok;
end;
procedure alumnosMaxEdad(var a1,a2:alumnos; v:alumnos);
var max1,max2:integer;
begin
	max1 := -1; max2 := -1;
	for i:=1 to dimF do begin
		if(v[i].edad > max1)then begin
			max2 := max1;
			max1 := v[i].edad;
			a2 := a1;
			a1 := v[i];
		end
		else if(v[i].edad > max2)then begin
			max2 := v[i].edad;
			a2 := v[i];
		end;
	end;
end.

program hell_4_12;
const
	dimF = 2;
type
	tipos = 1..4;
	galaxia = record
		nombre:String;
		tipo:tipos;
		masa:real;
		distancia:real;
	end;
	galaxias = array[1..dimF] of galaxia;
	galaxiasTipo = Array[tipos] of integer;
procedure loadGalaxia(var g:galaxia);
begin
	WriteLn('Nombre'); Readln(g.nombre);
	WriteLn('Tipo'); Readln(g.tipo);
	WriteLn('Masa'); Readln(g.masa);
	WriteLn('Distancia'); Readln(g.distancia);
end;
procedure loadGalaxias(var g:galaxias);
var i:integer;
begin
	for i:=1 to dimF do
		loadGalaxia(g[i]);
end;
procedure readGalaxia(g:galaxia);
begin
    WriteLn('Nombre ', g.nombre);
    WriteLn('Tipo ', g.tipo);
    WriteLn('Masa ', g.masa);
    WriteLn('Distancia ', g.distancia);
end;
procedure readGalaxias(g:galaxias);
var i:integer;
begin
    for i:=1 to dimF do
        readGalaxia(g[i]);
end;
procedure scanGalaxias(gs:galaxias);
var g:galaxia; i,noIrregulares:integer; masaPrincipales:real;
	gt:galaxiasTipo
begin
	masaPrincipales := 0;
	noIrregulares := 0;
	for i:=1 to 4 do
		gt[i] := 0;
	for i:=1 to dimF do begin
		g := gs[i];
		gt[g.tipo] := gt[g.tipo] + 1;
		if(g.nombre = 'Via lactea') or (g.nombre = 'Andromeda') or (g.nombre = 'Triangulo')then
			masaPrincipales := masaPrincipales + g.masa;
		if(g.tipo < 4) and (g.distancia < 1000)then
			noIrregulares := noIrregulares + 1;
	end;
	masaPrincipales := masaPrincipales/dimF;
end;
var gs:galaxias; gt:galaxiasTipo; i:integer;
begin
    loadGalaxias(gs);
    scanGalaxias(gs);
end.

program hell_4_11;
const
    dimF = 500;
type
    vec = array[1..dimF] of integer;
function existe(v:vec; n:integer):Boolean
var i:integer; ok:boolean;
begin
    i := 1;
    ok := false;
    while(i < dimF) and (not ok)do begin
        if(v[i] = n)then
            ok := true;
        else
            i := i + 1;
    end;
    existe := ok;
end;

function existe(v:vec; n:integer):Boolean
var i:integer;
begin
    i := 1;
    while(i <= dimF) and (v[i] < n) do
        i := i + 1;
    exist := v[i] = n;
end;

program hell_4_12;
const
    dimF = 500;
type
    alumnos = array[1..dimF] of String;

procedure cargar(var a:alumnos; var dimL:integer);
var nombre:String;
begin
    WriteLn('Nombre'); ReadLn(nombre);
    while(dimL <= dimF) and (nombre <> 'ZZZ')do begin
        dimL := dimL + 1;
		a[dimL] := nombre;
        WriteLn('Nombre'); ReadLn(nombre);
    end;
end;

procedure eliminar(var a:alumnos; target:String; dimL:integer);
var found:boolean; i:integer;
begin
    found := false;
    i := 1;
    while(i <= dimL) and (not found)do begin
        if(a[i] = target)then
            found := true;
        else
            i := i + 1;
    end;
    for i := i to dimL-1 do begin
        a[i] := a[i+1];
    end;
end;

procedure printVec(a:alumnos; dimL:integer);
var i:integer;
begin
    for i:= 1 to dimL do
        Write(a[i], ' ');
end;

procedure insertar(var a:alumnos; var dimL:integer; num:integer; nombre:String);
begin
	if(dimL+1 <= dimF) and (num >= 1) and (num <= dimL)then begin
		for i:=dimL downto num do begin
			a[i-1] := a[i];
		end;
		a[num] := nombre;
		dimL := dimL + 1;
	end;
end;

procedure agregar(var a:alumnos; var dimL:integer; nombre:String);
begin
	if(dimL + 1 <= dimF)then begin
		dimL := dimL + 1;
		a[dimL] := nombre;
	end;
end;

var
    a:alumnos; dimL:integer;
begin
    dimL := 1;
    cargar(a, dimL);
    eliminar(a,'Diego',dimL);
    printVec(a,dimL);
end.

program hell_4_13;
const
	dimF = 200;
type
	diaType = 1..31;
	viaje = record
		dia:diaType;
		monto:integer;
		distancia:real;
	end;
	viajes = array[1..dimF] of viaje;

procedure cargarViaje(var v:viaje);
begin
	WriteLn('Distancia'); ReadLn(v.distancia);
	if(v.distancia <> 0)then begin
		WriteLn('Dia'); ReadLn(v.dia);
		WriteLn('Monto'); ReadLn(v.monto);
	end;
end;

procedure cargarViajes(var vs:viajes; var dimL:integer);
var v:viaje;
begin
	cargarViaje(v);
	while(dimL <= dimF) and (v.km <> 0) do begin
		vs[dimL] := v;
		dimL := dimL + 1;
		cargarViaje(v);
	end;
end;

procedure scanVector(vs:viajes; dimL:integer);
type
	diasMes = array[1..31] of integer;
var
	montoProm:real; v,viajeLow:viaje; min:integer; dm:diaMes;
begin
	min := 9999;
	for i:= 1 to 31 do
		dm[i] := 0;
	for i:=1 to dimL do begin
		v := vs[i];
		montoTotal := montoTotal + v.monto;
		if(v.monto < min)then begin
			min := v.monto;
			viajeLow := v;
		end;
		dm[v.dia] := dm[v.dia] + 1;
	end;
	WriteLn('Promedio ', montoTotal/dimF);
	WriteLn('Distancia y dia en el viaje que transportó menos dinero ', viajeLow.distancia, ' ', viajeLow.dia);
	for i:=1 to 31 do
		WriteLn('Viajes realizados el día ', i, ' es ', dm[i]);
end;

procedure eliminar(var vs:viajes; var dimL:integer; pos:integer);
begin
	for i:=pos to dimL-1 do
		v[i] := v[i+1];
	dimL := dimL - 1;
end;

procedure scanVector2(var vs:viajes; var dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		if(vs[i].distancia = 100)then
			eliminar(vs,dimL,i);
	end;
end;

program hell_4_14;
const
	dimF = 1000;
type
	alumno = record
		nro:integer;
		nombre:String;
		apellido:String;
		asistancias:integer;
	end;
	alumnos = array[1..dimF] of alumno;

function getPosicion(a:alumnos; dimL:integer; nro:integer):integer;
var i:integer;
begin
    i := 1;
	while(i <= dimL) and (a[i].nro < nro) do
		i := i + 1;
	if(a[i].nro = nro)then
		getPosicion := i
	else
		getPosicion := -1;
end;

procedure agregarAlumno(var a:alumnos; var dimL:integer; al:alumno);
begin
	if(dimL + 1 < dimF)then begin
		dimL := dimL + 1;
		a[dimL] := al;
	end;
end;

procedure eliminarAlumnoPos(var a:alumnos; var dimL:integer; pos:integer);
var i:integer;
begin
	if(pos >= 1) and (pos <= dimL)then begin
		for i:=pos to dimL-1 do
			a[i] := a[i+1];
	end;
end;

procedure eliminarAlumnosSearch(var a:alumnos; var dimL:integer; nro:integer);
begin
	eliminarAlumnoPos(a,dimL,getPosicion(a,dimL,nro));
end;

procedure eliminarAsistenciaCero(var a:alumnos; var dimL:integer);
var i:integer;
begin
	for i:=1 to dimL do begin
		if(a[i].asistancias = 0)then
			eliminarAlumnoPos(a,dimL,i);
	end;
end;

begin

end.

program hell_4_15;
const
	dimF = 500;
type
	catType = 'A'..'F';
	cityCode = 1..2400;
	fecha = record
		dia:1..31;
		mes:1..12;
		anio:integer;
	cliente = record
		fechaFirma:fecha;
		categoria:catType;
		codigoCiudad:cityCode;
		monto:integer;
	end;
	clientes = array[1..dimF] of cliente;
	vMeses = array[1..12] of integer;
	vAnios = array[2006..2022] of vMeses;
	clientesMonotributo = array[catType] of integer;

procedure cargarFecha(var f:fecha);
begin
	write('Dia: ');
	readln(f.dia);

	write('Mes: ');
	readln(f.mes);

	write('Año: ');
	readln(f.anio);
end;

procedure cargarCliente(var c:cliente);
begin
	WriteLn('Fecha de la firma'); fecha(c.fecha);
	WriteLn('Categoria'); ReadLn(c.categoria);
	WriteLn('CodigoCiudad'); ReadLn(c.codigoCiudad);
	WriteLn('Monto'); ReadLn(c.monto);
end;

procedure cargarVectorOrden(var cs:clientes);
var c:cliente;
begin
	for i:=1 to dimF do begin
		cargarCliente(c);
	end;
end;

procedure scanVector(c:clientes);
var i,j,anioMax,max,totalAnual:integer; vAn:vAnios; vMo:clientesMonotributo; b:catType;
begin
	max := -1;
	anioMax := 0;
	for b:='A' to 'F' do
		vMo[i] := 0;
	for i:=2006 to 2022 do begin
		for j:=1 to 12 do
			vAn[i][j] := 0;
	end;
	for i:=1 to dimF do begin
		vAn[c.fecha.anio][c.fecha.mes] := vAn[c.fecha.anio][c.fecha.mes] + 1;
		vMo[c.categoria] := vMo[c.categoria] + 1;
	end;
	for i:=2006 to 2022 do begin
		totalAnual := 0;
		for j:=1 to 12 do begin
			totalAnual := totalAnual + vAn[i][j];
			WriteLn('Contratos del mes ', j, ' son ', vAn[i][j]);
		end;
		if(totalAnual > max)then begin
			max := totalAnual;
			anioMax := i;
		end;
		WriteLn('Contratos del anio ', i, ' es ', totalAnual);
	end;
	if(anioMax > 0)then
		WriteLn('Anio en el que se firmaron mas contrato es ', anioMax);
	for b:='A' to 'F' do
		WriteLn('Cantidad de clientes en la categoria ', b, ' es ', vMo[b]);
end;
//LA INFORMACION SE INGRESA ORDENADA POR FECHA DE FIRMA
//MAS ANTIGUOS PRIMEROS, los mas recientes ultimos

1) La memoria estática es aquella que no cambia durante la ejecución del programa.
Se almacenan las variables locales y globales del programa.
2) La memoria dinámica es aquella que varía durante la ejecución del programa.
Es la parte de la memoria que se reserva o libera durante la ejecución.
3) Una variable de tipo puntero es un tipo de dato, que su contenido es una posición de memoria.
4) La operación "New", reserva espacio en memoria dinámica para el tipo de dato que sea el puntero.
5) La operación "Dispose" libera el espacio que ocupa la variable de tipo puntero en memoria dinámica;

1) 4 bytes, 
2) 4 bytes, 22 bytes, 4 bytes, 22 bytes, 22 bytes, 22 bytes
3) 4 bytes, 20000 bytes, 20000 bytes, 20000 bytes
4) Error, 15 bytes, 15

8) a) MD 0, ME 46 b) MD 0, ME 46
	c) MD 40, ME 46 d) MD 40, ME 46

program ordenarVector;

procedure ordenar(var v:vector; dimL:integer);
var i,p,item:integer;
begin
	for i:=1 to dimL do begin
		p := i;
		for j:=i+1 to dimL do begin
			if(v[j] < v[p])then //si v[j] es mas chico que mi elemento actual o mi elemento mas chico encontrado hasta el j momento (siendo j < dimL)
				p := j;
		end;
		item := v[i];
		v[i] := v[p];
		v[p] := item;
	end;
end;

procedure insertar(var v:vector; var dimL:integer; pos:integer; val:integer);
begin
	if(dimL + 1 <= dimF) and (pos > 1) and (pos <= dimL) then begin
		for i:=dimL downto pos do
			v[i] := v[i-1];
		v[pos] := val;
		dimL := dimL + 1;
	end;
end;

procedure busquedaDicotomica(v:vector; dimL:integer; val:integer; var ok:boolean);
var pri,ult,medio:integer;
begin
	pri := 1;
	ult := dimL;
	medio := (pri + ult) DIV 2;
	while(pri < ult) and (v[medio] <> val) do begin
		if(val < v[medio])then
			ult := medio - 1;
		else
			pri := medio + 1;
		medio := (pri + ult) DIV 2;
	end;
	ok := v[medio] = val;
end;

program hell_6_1;

procedure leerLista(l:lista);
begin
	while(l <> nil)do begin
		writeLn(l^.num);
		l := l.sig;
	end;
end;

function maximo(l:lista):integer;
var max:integer;
begin
	max := -1;
	while(l <> nil)do begin
		if(l^.dato.dni > max)then
			max := l^.dato.dni;
		l := l^.sig;
	end;
	maximo := max;
end;

function minimo(l:lista):integer;
var min:integer;
begin
	min := 999;
	while(l <> nil)do begin
		if(l^.dato.dni < min)then
			min := l^.dato.dni;
		l := l^.sig;
	end;
	maximo := min;
end;

function multiplos(l:lista; num:integer):integer;
var mul:integer;
begin
	mul := 0;
	while(l <> nil)do begin
		if(l^.dato.dni MOD num = 0)then
			mul := mul + 1;
		l := l^.sig;
	end;
	multiplos := mul;
end;

program hell_6_5;
type
	producto = record
		code:integer;
		desc:String;
		stockAct:integer;
		stockMin:integer;
		precio:real;
	end;
	lista := ^nodo;
	nodo = record
		prod:producto;
		sig:lista;
	end;

procedure cargarProducto(var p:producto);
begin
	WriteLn('Codigo'); Readln(p.code);
	if(p.code <> -1)then begin
		WriteLn('Descripcion'); Readln(p.desc);
		WriteLn('Stock Actual'); Readln(p.stockAct);
		WriteLn('Stock Minimo'); Readln(p.stockMin);
		WriteLn('Precio'); Readln(p.precio);
	end;
end;

procedure agregarAdelante(var l:lista; p:producto);
var aux:lista;
begin
	new(aux);
	aux^.prod := p;
	aux^.sig := l;
	l := aux;
end;

procedure cargarLista(var l:lista);
var aux:lista; p:producto;
begin
	cargarProducto(p);
	while(p.code <> -1)do begin
		agregarAdelante(l,p);
		cargarProducto(p);
	end;
end;

procedure scanLista(l:lista);
var
	p:producto;
	prodTotal,prodStock,barato1,barato2:integer;
	min1,min2:real;
function getDigitosPares(num:integer):integer
var digPares:integer;
begin
	digPares := 0;
	while(num <> 0)do begin
		if((num MOD 10) MOD 2 = 0)then
			digPares := digPares + 1;
		num := num DIV 10;
	end;
	getDigitosPares := digPares;
end;
begin
	prodTotal := 0;
	prodStock := 0;
	min1 := 999;
	min2 := 999;
	while(l <> nil) do begin
		p := l^.prod;
		prodTotal := prodTotal + 1;
		if(p.stockAct < p.stockMin)then
			prodStock := prodStock + 1;
		if(getDigitosPares(p.code) >= 3)then
			WriteLn(p.desc);
		if(p.precio <= min1) then begin
			barato2 := barato1;
			barato1 := p.code;
			min2 := min1;
			min1 := p.precio;
		end else if(p.precio <= min2)then begin
			min2 := p.precio;
			barato2 := p.code;
		end;
		l := l^.sig;
	end;
	WriteLn('Codigo de los dos productos mas baratos ', barato1, ' ', barato2);
	WriteLn('Porcentaje de los productos con stock actual menor al minimo %', (prodStock/prodTotal)*100);
end;

program hell_6_6;
type
	espectro = 1..7;
	sonda = record
		nombre:String;
		duracion:integer;
		costoConst:real;
		costoMantem:real;
		rangoEspectro:espectro;
	end;
	lista = ^nodo;
	nodo = record
		s:sonda;
		sig:lista;
	end;

procedure cargarFinal(var l:lista; s:sonda; var l:lista);
var aux:lista;
begin
	new(aux);
	aux^.s := s;
	aux^.sig := nil;
	if(l = nil)then
		l := aux;
	else
		ult^.sig := aux;
	end;
	ult := aux;
end;

procedure cargarFinal(var l:lista; s:sonda);
var nuevo,aux:lista;
begin
	new(nuevo); nuevo^.sig := nil; nuevo^.s := s;
	if(l = nil)then
		l := nuevo;
	else begin
		aux := l;
		while(aux^.sig <> nil)do
			aux := aux^.sig;
		aux^.sig := nuevo;
end;

procedure cargarSonda(var s:sonda);
begin
	(...)
end;

procedure cargarLista(var l:lista);
var s:sonda; ult:lista;
begin
	repeat
		cargarSonda(s);
		cargarFinal(l,s,ult);
	until(s = 'GAIA');
end;
begin
end.

procedure armarNodo(var l:lista; valor:integer);
var nuevo,ant,act:lista;
begin
	new(nuevo); nuevo^.sig := nil; nuevo^.elem := valor;
	act := l;
	ant := l;
	while(act <> nil) and (act^.elem < valor)do begin
		ant := act;
		act := act^.sig;
	end;
	if(act = act)then
		l := nuevo;
	else
		ant^.sig := nuevo;
	nuevo^.sig := act;
end;

procedure cargarFinal(var l:lista; value:integer);
var nuevo,aux:lista;
begin
	new(nuevo); nuevo^.sig := nil; nuevo^.elem := value;
	if(l = nil)then
		l := nuevo;
	else begin
		aux := l;
		while(aux^.sig <> nil)do //el proximo elemento es el ultimo? entonces freno
			aux := aux^.sig;
		aux^.sig := nuevo;
	end;
end;

procedure cargarFinal (var l:lista; value:integer);
var nuevo,aux:lista;
begin
	new(nuevo); nuevo^.sig := nil; nuevo^.elem := value;
	if(l = nil)then
		l := nuevo;
	else begin
		aux := l;
		while(aux <> nil)do begin
			aux := aux^.sig;
		end;
		aux := nuevo;
	end;
end;

procedure cargarFinal(var l:lista; var ult:lista; value:integer);
var nuevo:lista;
begin
	new(nuevo); nuevo^.sig := nil; nuevo^.elem := value;
	if(l = nil)then
		l := nuevo;
	else
		ult^.sig := nuevo;
	ult := nuevo;
end;

procedure eliminar(var l:lista; value:integer);
var ant,act:lista;
begin
	act := l;
	ant := l;
	while(act <> nil) and (act.elem <> value)do begin
		ant := act;
		act := act^.sig;
	end;
	if(act <> nil)then begin
		if(act = l)then
			l := l^.sig;
		else
			ant^.sig := act^.sig;
		dispose(act);
	end;
end;

procedure eliminarRepetidos(var l:lista; value:integer);
var ant,act:lista;
begin
	act := l;
	ant := l;
	while(act <> nil)do begin
		if(act^.elem = value)then begin
			ant^.sig := act^.sig;
			act := ant^.sig;
			dispose(act);
		end else begin
			ant := act;
			act := act^.sig;
		end;
	end;
end;

1)  a c / globales
	b 	/ local al programa
	a b / a por valor, b por referencia

	a := 15
	b:= 20
	c:= 5 (b-a);
	calcular(a,c);
	calcular(15,5);
		b = 15 a = 5 (parametros)
		c := c + b / c := 5 + 15 = 20;
		a := (b + c) * 5 / a := (15 + 20) * 5 = 35 * 5 = 175; //trampa
		b := (a + b) MOD 10 / b := (175 + 15) MOD 10 = 0;
		writeLn(175, 0, 175);
	WriteLn(15, 20, 175);

2) v,f,f,v,f,f,v,f

procedure eliminarElemVector(var v:vector; elem:integer);
var pos:integer;
begin
	while(pos <= dimL) and (v[pos] < elem) do begin
		pos := pos + 1;
	end;
	if(pos <> dimL) and (v[pos] = elem) then begin
		for i:=pos to dimL-1 do begin
			v[i] := v[i+1];
		end;
		dimL := dimL - 1;
	end;
end;

program hell_parcial1;
type
	rubroType = 1..20;
	producto = record
		codigo:integer;
		nombre:String;
		rubro:rubroType;
		precio:real;
	end;
	rubros = array[rubroType] of integer;
	listaProductos = ^nodo;
	nodo = record
		prod:producto;
		sig:lista;
	end;
procedure cargarProducto(var p:producto);
begin
	WriteLn('Codigo'); ReadLn(p.codigo);
	WriteLn('Nombre'); ReadLn(p.nombre);
	WriteLn('Rubro'); ReadLn(p.rubro);
	WriteLn('Precio'); ReadLn(p.precio);
end;

procedure agregarAdelante(var l:lista; p:producto);
var aux:lista;
begin
	new(aux);
	aux^.prod := p;
	aux^.sig := l;
	l := aux;
end;

procedure guardarProducto(var l:lista);
var p:producto; v:rubros;
begin
	for i:=1 to 20 do
		v[i] := 0;
	while(true)do begin
		cargarProducto(p);
		if(v[p.rubro] >= 10)then
			agregarAdelante(l,p);
		else
			v[p.rubro] := v[p.rubro] + 1;
	end;
end;

program hell_parcial;
const
	dimF = 5000;
type
	fecha = record
		dia:integer;
		mes:integer
	end;
	typeCat = 1..5;
	participante = record
		dni:integer;
		nombre:string;
		apellido:string;
		categoria:typeCat;
		fechaInscrip:fecha;
	end;
	vecPart = array[1..dimF] of participante;
	vecCat = array[typeCat] of integer;
	lista = ^nodo;
	nodo = record
		elem:participante;
		sig:lista;
	end;

procedure agregarAtras(var l:lista; var ult:lista; p:producto);
begin
	new(nuevo); nuevo^.sig := nil; nuevo^.elem := p;
	if(l = nil)then
		l := nuevo;
	else
		ult^.sig := nuevo;
	ult := nuevo;
end;

procedure filtrarVector(v:vector; dimL:integer; var l:lista);
var p:participante; i:integer; vc:vecCat; ult:lista;
begin
	for i:=1 to 5 do
		vc[i] := 0;
	for i:=1 to dimL do
		vc[v[i].categoria] := vc[v[i].categoria] + 1;
	for i:=1 to dimL do begin
		if(vc[v[i].categoria] >= 50)then
			agregarAtras(l,ult,v[i]);
	end;
end;

3) inval, inval, val, val, val, inval, inval

4) valor, referencia y variables globales.

procedure ordenarVector(var v:vector; dimL:integer);
var p,i,j,aux:integer;
begin
	for i:=1 to dimL do begin
		p := i;
		for j:= i + 1 to dimL do begin
			if(v[j] < v[p])then
				p := j;
		end;
		aux := v[p];
		v[p] := v[i];
		v[i] := aux;
	end;
end;

function existeValorOrdenado(v:vector; num:integer):boolean;
begin
	while(pos <= dimL) and (v[pos] < num)do
		pos := pos + 1;
	existeValorOrdenado := v[pos] = num;
end;

program ejem;
const
  dimF = 20;
type
	vector = array[1..dimF] of integer;

procedure eliminarValorRepetido(var v:vector; var dimL:integer; valor:integer);
var i,j,diff:integer;
begin
	i := 1;
	diff := 0;
	while(i <= dimL) and (v[i] < valor) do
		i := i + 1;
	j := i + 1;
	while(j <= dimL) and (v[j] = valor) do
		j := j + 1;
	diff := j - i;
	dimL := dimL - diff;
	for j := i to dimL do
		v[j] := v[j + diff];
end;

procedure cargarVector(var v:vector; var dimL:integer);
var i:integer;
begin
	for i:=1 to dimF do begin
		dimL := dimL + 1;
		v[i] := Random(20);
	end;
end;

procedure ordenarVector(var v:vector; dimL:integer);
var i,p,j,aux:integer;
begin
	for i:=1 to dimL do begin
		p := i;
		for j:=i+1 to dimL do begin
			if(v[j] < v[p])then
				p := j;
		end;
		aux := v[p];
		v[p] := v[i];
		v[i] := aux;
	end;
end;

procedure printVector(v:vector; dimL:integer);
var i:integer;
begin
	for i:=1 to dimL do begin
		Write(v[i], ' ');
	end;
end;

var v:vector; dimL:integer; // 0 2 2 3 3 4 4 4 5 5 5 6 6 6 7 8 8 8 8 9
begin
  dimL := 0;
  cargarVector(v, dimL);
  ordenarVector(v, dimL);
  printVector(v, dimL);
  WriteLn();
  eliminarValor(v, dimL, 12);
  printVector(v, dimL);
end.

//       a       b
// 1 2 3 4 5 5 5 6 7 8

program Hello;

type
    lista = ^nodo;
    nodo = record
        elem:integer;
        sig:lista;
    end;
    
procedure agregarFinal(var l:lista; val:integer);
var nuevo:lista;
begin
    new(nuevo); nuevo^.sig := nil; nuevo^.elem := val;
    if(l = nil)then
        l := nuevo
    else
        nuevo^.sig := l;
    l := nuevo;
end;
    
procedure cargarLista(var l:lista);
var i:integer;
begin
    for i:=1 to 20 do begin
        agregarFinal(l,Random(10));
    end;
end;

procedure printLista(l:lista);
begin
    while(l <> nil)do begin
        Write(l^.elem, ' ');
        l := l^.sig;
    end;
end;

procedure eliminarRepetidos(var l:lista; value:integer);
var ant,act:lista;
begin
    act := l;
    ant := l;
    while(act <> nil)do begin
        if(act^.elem <= value)then begin
            if(act = l) then begin
                l := l^.sig;
                ant := l;
                dispose(act);
                act := l
            end else begin
                ant^.sig := act^.sig;
                dispose(act);
                act := ant^.sig;
            end;
        end else begin
            ant := act;
            act := act^.sig;
        end;
    end;
end;
var l:lista;
begin
    l := nil;
   cargarLista(l);
   printLista(l);
   WriteLn();
   WriteLn('---------------');
   eliminarRepetidos(l,4);
   printLista(l);
end.

i := 0; 1 UT
suma := 0; 1 UT
PP = 2 UT;
while = 3N + 2 + NxCuerpo
	N = 50;
	Cuerpo = 5;
	3*50 + 2 + 50*5 = 150 + 2 + 250 = 402;
repeat until = 402 UT;
while = 3N + 2 +  NxCuerpo
	N = 50;
	Cuerpo = 5;
	3*50 + 2 + 50*5 = 402;
total = 806;

for = 3N + 2 + N*Cuerpo
while = Condicion/es*(N + 1) + N*Cuerpo

Condiciones = 3;
Cuerpo = 5;
N = 50;
3*(51) + 50*5 = 153 + 250 = 403;

Condiciones = 1;
Cuerpo = 5;
N = 50;
1(50+1) + 50*5 = 51 + 250 = 301

repeat until = Cuerpo + N*Cuerpo
5 + 5*50 = 255;
3*50 = 150; = 405;

writeLn(a,b,c) = 15,20,175

program Hello;
var a,c:integer;
procedure calcular(b:integer; var a:integer);
begin
    c := c + b;
    a := (b+c)*5; //siempre te referis a la "a" del parametro, y esta apunta a c (global)
    WriteLn('a:', a, ' c:',c); //en este punto, "a" y "c" valen lo mismo
	b := (a+b) MOD 10;
    WriteLn('Calcular a:',a , ' b:',b , ' c:',c);
end;
var b:integer;
begin
    a := 15;
    b := 20;
    c := b - a;
    calcular(a,c);
    WriteLn('PP a:',a , ' b:',b , ' c:',c);
end.

a 15
b 20
c 5
calcular(a,c);
	var a = 5;
	b = 15
	c (global) := 5 + 15 = 20;
	a (ref a c) := 35 * 5 = 175;
	b := 175 + 15 MOD 10 = 0;
	writeLn(a,b,c) = 175, 0, 175