program Vectores;
const cant_datos = 150;
type
    vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var dato:Real;
begin
    WriteLn('Value'); ReadLn(dato);
    while(dato <> 0) and (dimL < cant_datos)do begin
        dimL := dimL + 1;
        v[dimL] := dato;
        WriteLn('Value'); ReadLn(dato);
    end;
end;
procedure modificarVectorySumar(var v:vdatos; dimL:integer; n:real; var suma:real);
var i:Integer;
begin
    for i := 1 to dimL do begin
        v[i] = v[i] + n;
        suma := suma + v[i];
    end;
end;

var datos : vdatos; i, dim : integer; num, suma : real;
begin
    dim := 0;
    sumaTotal := 0;
    cargarVector(datos, dim);
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(datos, dim, num, suma);
    writeln('La suma de los valores es: ', suma);
    writeln('Se procesaron: ',dim, ' números')
end.

program Heaven_4_3;
const cant_datos = 40;
type
    vector = array[1..cant_datos] of Integer;
    
procedure imprimirVector(v:vector; dimL:Integer);
var i:Integer;
begin
    WriteLn('Desde el principio al final');
    for i := 1 to dimL do begin
        WriteLn('i: ', i, ' value: ', v[i]);
    end;
end;
procedure imprimirVectorDown(v:vector; dimL:Integer);
var i:Integer;
begin
    WriteLn('Desde el final al principio');
    for i := dimL downTo 1 do begin
        WriteLn('i: ', i, ' value: ', v[i]);
    end;
end;
procedure imprimirVectorDownMiddle(v:vector; dimL:Integer);
var middle:Integer; i:Integer;
begin
    WriteLn('Desde la mitad al final');
    middle := dimL DIV 2;
    for i := middle downto 1 do
        WriteLn('i: ', middle, ' value: ', v[middle]);
    WriteLn('Desde la mitad mas uno al final');
    for i := middle + 1 to dimL do
        WriteLn('i: ', i, ' value: ', v[i]);
end;
procedure recorrerXY(v:vector; x, y:Integer);
var i:Integer;
begin
    WriteLn('Desde ', x, ' hasta ', y);
    if(x < y)then begin
        for i := x to y do
            WriteLn('i: ', i, ' value: ', v[i]);
    end
    else begin
        for i := x downto y do
            WriteLn('i: ', i, ' value: ', v[i]);
    end;
end;
procedure cargarVector(var v:vector; var dimL:Integer);
var i:Integer;
begin
    for i := 1 to cant_datos do begin
        dimL := dimL + 1;
        v[i] := i;
    end;
end;
var v:vector; dimL:integer;
begin
    dimL := 0;
    cargarVector(v, dimL);
    recorrerXY(v, 10, 14);
end.

program Heaven_4_4;
const dimF = 100;
type
    vector = array[1..dimF] of integer;
function posicion(v:vector; x:integer):Integer;
var i:Integer; ok:Boolean;
begin
    i := 1; ok := false;
    while(i < dimF) and (not ok)do begin
        if(v[i] = x)then begin
            ok := true;
        end
        else
            i := i + 1;
    end;
    if(ok)then begin
        posicion := i;
    end
    else
        posicion := -1;
end;
procedure intercambio(x,y:Integer; var v:vector);
var Vx:Integer;
begin
    Vx = v[x];
    v[x] = v[y];
    v[y] = Vx;
end;
function sumaVector(v:vector):Integer;
var total,i:Integer;
begin
    total := 0;
    for i := 1 to dimF do
        total := total + v[i];
    sumaVector := total;
end;
function promedio(v:vector):Real;
begin
    promedio := sumaVector / dimF;
end;
function elementoMax(v:vector):Integer;
var i, eIndex ,max:Integer;
begin
    max := -1; eIndex := -1;
    for i := 1 to dimF do begin
        if(v[i] > max)then
        begin
            max := v[i];
            eIndex := i;
        end;
    end;
    elementoMax := eIndex;
end;
function elementoMin(v:vector):Integer;
var i,eIndex,min:Integer;
begin
    min := 9999; eIndex := -1;
    for i := 1 to dimF do begin
        if(v[i] < min)then
        begin
            min := v[i];
            eIndex := i;
        end;
    end;
    elementoMin := eIndex;
end;
program Heaven_4_5;
type
    vector = array[1..dimF];
procedure insertData(var v:vector);
var data, elemMax, elemMin, i:Integer;
begin
    readLn(data);
    while(data <> 0) and (i < dimF)do begin
        i := i + 1;
        v[i] := data;
        readLn(data);
    end;
    elemMax := elementoMax(v);
    elemMin := elementoMin(v);
    intercambio(elemMax,elemMin,v);
    WriteLn('El elemento máximo ', elemMax, ' que se encontraba en la posicion ', posicion(elemMin), ' fue intercambiado con el elemento mínimo ', elemMin, ' que se encontraba en la posición ', posicion(elemMax));
end;

program Heaven_4_6;
procedure minMax(v:vector; var min,max:integer);
var min, max, vMin, vMax, i:Integer;
begin
    min := 9999; max := -1; vMin := 0; vMax := 0;
    for i := 1 to dimF do begin
        if(v[i] > max)then begin
            max := v[i];
            vMax := i;
        end;
        if(v[i] < min)then begin
            min := v[i];
            vMin := i;
        end;
    end;
end;

Program Heaven_4_7;
type
    vector = array[0..9] of Integer;
procedure sacarDigito(var num,dig:Integer);
begin
    dig := num MOD 10;
    num := num DIV 10;
end;
procedure leerEnteros(var v:vector; num:Integer);
var dig:Integer;
begin
    dig := 0;
    while(num <> 0) do begin
        sacarDigito(num,dig);
        v[dig] := v[dig] + 1;
    end;
end;
var v:vector; i,dato:Integer; max, maxNum:Integer;
begin
    max := -1; maxNum := 0;
    for i := 1 to 9 do begin
        v[i] := 0;
    end;
    ReadLn(dato);
    while(dato <> -1)do begin
        leerEnteros(v, dato);
        ReadLn(dato);
    end;
    for i := 1 to 9 do begin
        if(v[i] <> 0)then
        begin
            WriteLn('Número ', i, ': ', v[i], ' veces');
        end;
        if(v[i] > max)then begin
            max := v[i];
            maxDig := i;
        end;
    end;
    WriteLn('El digito que se repitió mas veces fue ', maxDig);
    write('Los digitos que no tuvieron ocurrencias son: ');
    for i := 1 to 9 do begin
        if(v[i] = 0) then
            write(i, ', ');
    end;
end;

Program Heaven_4_8;
const total = 400;
type
    alumno = record
        num:Integer;
        dni:Integer;
        nombre:String;
        apellido:String;
        año:Integer;
    end;
    vector = array[1..total] of alumno;
procedure leerAlumno(var a:alumno);
begin
    WriteLn('Numero de inscripcion'), ReadLn(a.num);
    WriteLn('Dni'); ReadLn(a.dni);
    WriteLn('Nombre'); ReadLn(a.nombre);
    WriteLn('Apellido'); ReadLn(a.apellido);
    WriteLn('Año de nacimiento'); ReadLn(a.año);
end;
procedure leer(var v:vector);
var a:alumno; i:Integer;
begin
    leerAlumno(a);
    for i := 1 to total do begin
        v[i] = a;
        leerAlumno(a);
    end;
end;
function esPar(dni:Integer):Boolean;
begin
    esPar := dni MOD 2 = 0;
end;
procedure todoPar(dni:Integer, var ok:Boolean);
var dig:Integer;
begin
    dig := 0;
    while(dni <> 0)do begin
        if(not esPar(dni MOD 10))then begin
            ok := false;
        end
        dni := dni DIV 10;
    end;
end;
procedure scanVector(v:vector; var dniPares:Integer; var a1,a2:alumno);
var i:integer; max,max2:Integer;
begin
    var max := 2020; max2 := 2020;
    for i := 1 to total do begin
        if(todoPar(v[i].dni))then
            dniPares := dniPares + 1;
        if(v[i].año < max)then then
        begin
            max2 := max;
            a2 := a1;
            max := v[i].año;
            a1 := v[i];
        end
        else
        begin
            max2 := v[i].año;
            a2 := v[i];
        end;
    end;
end;
var v:vector; dniPares:Integer; a1,a2:alumno;
begin
    dniPares := 0;
    leer(v);
    scanVector(v,dniPares, a1, a2);
end;

Program Heaven_4_12;
const cantGalax = 5;
type
    galaxia = record
        nombre:String[40];
        tipo:1..4;
        masa:Integer;
        distancia:Real;
    end;
    vG = array[1..cantGalax] of galaxia;
    vGType = array[1..4] of Integer;
procedure leerGalaxia(var g:galaxia);
begin
    WriteLn('Nombre'); ReadLn(g.nombre);
    WriteLn('Tipo'); ReadLn(g.tipo);
    WriteLn('Masa'); ReadLn(g.masa);
    WriteLn('Distancia'); ReadLn(g.distancia);
end;
procedure loadGalaxias(var v:vG);
var i:Integer;
begin
    for i := 1 to cantGalax do begin
        leerGalaxia(v[i]);
    end;
end;
function porcentaje(x,y:Integer):Real;
begin
    porcentaje := (x*100) DIV y;
end;
procedure scanVector(v:vG);
var i:Integer; noIrregulares, masaSelect, masaTotal:Integer; vType:vGType; g:galaxia;
mayorMasa1, mayorMasa2, menosMasa1, menosMasa2:String; max1,max2,min1,min2:Integer;
begin
    masaSelect := 0; masaTotal := 0; noIrregulares := 0;
    max1 := -1; max2 := -1; min1 := 9999; min2 := 9999;
    mayorMasa1 := 'Ninguna'; mayorMasa2 := 'Ninguna';
    menosMasa1 := 'Ninguna'; menosMasa2 := 'Ninguna';
    for i := 1 to 4 do begin
        vType[i] := 0;
    end;
    for i := 1 to cantGalax do begin
        g := v[i];
        vType[g.tipo] := vType[g.tipo] + 1;
        if(g.nombre = 'Vía Láctea') OR (g.nombre = 'Andrómeda ') OR (g.nombre = 'Triángulo') then
        begin
            masaSelect := masaSelect + g.masa;
        end;
        if(g.tipo <> 4) and (g.distancia < 1000)then begin
            noIrregulares := noIrregulares + 1;
        end;
        if(g.masa > max1)then begin
            max2 := max1;
            mayorMasa2 := mayorMasa1;
            max1 := g.masa;
            mayorMasa1 := g.nombre;
        end
        else if(g.masa > max2) then begin
            max2 := g.masa;
            mayorMasa2 := g.nombre;
        end;
        if(g.masa < min1)then begin
            min2 := min1;
            menosMasa2 := menosMasa1;
            min1 := g.masa;
            menosMasa1 := g.nombre;
        end
        else if(g.masa < min2) then begin
            min2 := g.masa;
            menosMasa2 := g.nombre;
        end;
        masaTotal := masaTotal + g.masa;
    end;
    for i := 1 to 4 do begin
        WriteLn('La Cantidad de galaxias del tipo', i, ' son', vType[i]);
    end;
    WriteLn('Porcentaje de la masa de las 3 principales galaxias',porcentaje(masaSelect,masaTotal));
    WriteLn('Galaxias No irregulares con PC menor a 1000', noIrregulares);
    WriteLn('Galaxias con mayor masa', mayorMasa1, 'y', mayorMasa2);
    WriteLn('Galaxias con menor masa', menosMasa1, 'y', menosMasa2);
end;
var v:vG;
begin
    loadGalaxias(v);
    scanVector(v);
end.

Program Heaven_4_13;
const totalAnios = 50; totalLugares = 100;
type
    vLugar = array[1..totalLugares] of Real;
    anio = record
        anio:Integer;
        lugaresTemp:vLugar;
        tempAnual:Real;
    end;
    vAnio = array[1..totalAnios] of anio;
procedure leerAnio(var a:anio);
var i:Integer; v:vLugar; sumaTemp:Real;
begin
    sumaTemp := 0;
    WriteLn('Anio'); ReadLn(a.anio);
    WriteLn('Temperatura de cada lugar');
    for i := 1 to totalLugares do begin
        ReadLn(v[i]);
        sumaTemp := sumaTemp + v[i];
    end;
    a.lugaresTemp := v;
    a.tempAnual := sumaTemp / totalLugares
end;
procedure cargarVector(var v:vAnio);
var i:Integer; dato:anio;
begin
    for i := 1 to totalAnios do begin
        leerAnio(v[i]);
    end;
end;
procedure scanVector(v:vAnio);
var i, j, anioMaxProm, anioMaxTemp:integer; a:anio; maxProm, maxTemp:Real;
begin
    maxProm := -1; anioMaxProm := 0;
    maxTemp := -1; anioMaxTemp := 0;
    for i := 1 to totalAnios do begin
        a := v[i];
        if(a.tempAnual > maxProm)then begin
            maxProm := a.tempAnual;
            anioMaxProm := a.anio;
        end;
        for j := 1 to totalLugares do begin
            if(a.lugaresTemp[i] > maxTemp)then begin
                maxTemp := a.lugaresTemp[i];
                anioMaxTemp := a.anio;
            end;
        end;
    end;
    WriteLn('El anio con mayor temperatura promedio fue ', anioMaxProm);
    WriteLn('El anio con temperatura detectada en algún punto del planeta en los últimos 50 anios fue ', anioMaxTemp);
end;
var v:vAnio;
begin
    cargarVector(v);
    scanVector(v);
end.

program Heaven_4_14;
const totalProyectos = 1000;
type
    code = 1..5;
    proyecto = record
    participante = record
        pais:String[40];
        rol:code;
        horas:Integer;
    end;
    vDesarrollares = array[code] of participante;
    vProyectos = array[1..totalProyectos] of vDesarrollares;
procedure leerDev(var dev:participante);
begin
    WriteLn('Pais'); ReadLn(dev.pais);
    WriteLn('Rol')
end;
procedure cargarDesarrolladores(vdev:vDesarrolladores);
var i:Integer; dev:participante;
begin
    for i := 1 to 5 do begin
        leerDev(dev);
        vdev[i] = dev;
    end;
end;
procedure cargarProyectos(var v:vProyectos);
var i:Integer; vdev:vDesarrolladores;
begin
    for i := 1 to totalProyectos do begin
        cargarDesarrolladores(vdev);
        v[i] := vdev;
    end;
end;

program Heaven_4_2_1;
const maxVector = 500;
type
    vector = array[1..maxVector] of Integer;
function scanVector(v:vector; n:Integer):Boolean
var i:Integer;
begin
    i := 0;
    while(i < maxVector) and (not ok) do begin
        i := i + 1;
        if(v[i] = n)then begin
            ok := true;
        end;
    end;
    scanVector := ok;
end;

program Heaven_4_2_2;
const dimF = 500;
type
    vector = array[1..dimF] of String[40];
procedure leer(var v:vector);
var i:Integer; dato:String[40];
begin
    i := 0;
    WriteLn('Nombre'); ReadLn(dato);
    while (i < dimF) and (dato <> 'ZZZ') do begin
        i := i + 1;
        v[i] = dato;
        WriteLn('Nombre'); ReadLn(dato);
    end;
end;
procedure remover(var v:vector; i:Integer);
begin
    if(i <= dimF)then begin
        for i := i to dimF do
            v[i] := v[i+1];
    end;
end;
procedure eliminarElemento(var v:vector; n:String[40]);
var i:Integer; ok:Boolean
begin
    ok := false; i := 0;
    repeat
        i := i + 1;
        if(v[i] = n)then begin
            ok := true;
        end;
    until((i >= dimF) OR (ok));
    for i := 1 to dimF do begin
        if(v[i] = n)
            remover(v,i);
            ok := true;
        end;
    end;
end;
procedure insert(var v:vector; n:String[40], pos:Integer , var dimL:Integer);
var i:Integer; dataInPos:String;
begin
    if(pos <= dimL)then begin
        dimL := dimL + 1;
        for i := dimL downto pos + 1 do
            v[i] := v[i-1];
        v[pos] = n;
    end;
end;
procedure agregar(var v:vector; str:String[40]; var dimL:Integer);
var i:integer;
begin
    if(dimL + 1 <= dimF)then begin
        dimL := dimL + 1;
        v[dimL] := str;
    end;
end;

program Heaven_4_2_3;
const dimF = 200;
type
    mes:1..31;
    viaje = record
        dia:mes;
        monto:Integer;
        distancia:Integer;
    end;
    vector = array[1..dimF] of viaje;
    viajesMes = array[mes] of Integer;
procedure leerViaje(var v:viaje);
begin
    WriteLn('Dia'); ReadLn(v.dia);
    WriteLn('Monto'); ReadLn(v.monto);
    WriteLn('Distancia'); ReadLn(v.distancia);
end;
procedure cargarVector(var v:vector, var dimL:Integer);
var i:Integer; dato:viaje;
begin
    i := 0;
    leerViaje(dato);
    while(i < dimF) and (dato.distancia <> 0)do begin
        i := i + 1;
        v[i] := dato;
        leerViaje(dato);
    end;
    dimL := i;
end;
function promedio(a,b:Integer):Real
begin
    promedio := a/b;
end;
procedure scanVector(v:vector; dimL:Integer);
var i:Integer; sumaMonto:Integer; d,lowMoney:viaje; min:Integer; vm:viajesMes;
begin
    sumaMonto := 0; min := 9999;
    for i := 1 to 31 do
        vm[i] := 0;
    for i := 1 to dimL do begin
        d := v[i];
        sumaMonto := sumaMonto + d.monto;
        if(d.monto < min) then begin
            min := d.monto;
            lowMoney = d;
        end;
        vm[d.dia] := vm[d.dia] + 1;
    end;
    WriteLn('El monto promedio transportado de los viajes realizados es ', promedio(sumaMonto, dimL));
    WriteLn('El viaje que menos transportó dinero recorrió una distancia de ', lowMoney.distancia, 'km, el día ', lowMoney.dia);
    for i := 1 to 31 do
        WriteLn('El día ',i, ' se realizaron ', vm[i], ' viajes');
end;
procedure deleteViajes(var v:vector; dist:Integer, var dimL:Integer);
var i:Integer;
begin
    for i := 1 to dimL do begin
        if(v[i].distancia = dist)do begin
            v[i] := v[i+1];
            dimL := dimL - 1;
        end;
    end;
end;

program Heaven_4_2_4;
const maxAlum = 1000;
type
    str40 = String[40];
    alumno = record
        numero:Integer;
        apellido:str40;
        nombre:str40;
        asistencias:Integer;
    end;
    vector = array[1..maxAlum] of alumno;
function posicion(v:vector; num:Integer, dimL:Integer):Integer;
var i:Integer; ok:Boolean;
begin
    i := 0; ok := false;
    while(i < dimL) and (not ok)do begin
        i := i + 1;
        if(v[i].numero = n)then begin
            ok := true;
        end;
    end;
    if(ok)then
        posicion := i;
    else
        posicion := -1;
end;
procedure eliminarAlumno(var v:vector; n:Integer, dimL:Integer);
begin
    dimL := dimL - 1;
    for n := n to dimL do begin
        v[n] := v[n+1];
    end;
end;
procedure eliminarAlumnoPorNumero(var v:vector, n:Integer, dimL:integer);
var i:Integer;
begin
    i := posicion(v,n,dimL);
    eliminarAlumno(v, i, dimL);
end;
procedure eliminarAsistenciaCero(var v:vector, dimL:Integer);
var i:Integer; eliminados:Integer;
begin
    eliminados := 0;
    for i := 1 to dimL to begin
        if(v[i].asistencias = 0)then begin
            while(v[i+eliminados].asistencias = 0)do
                eliminados := eliminados + 1;
        end
        if(i+eliminados <= dimL)then
            v[i] := v[i+eliminados];
    end;
    dimL := dimL - eliminados;
end;

program Heaven_6_1;
type
    lista = ^nodo;
    nodo = record
        num:Integer;
        sig:lista;
    end;
procedure leerLista(l:lista);
begin
    while(l <> nil)do begin
        WriteLn(l^.num);
        l := l^.sig;
    end;
end;
procedure incrementarLista(var l:lista, n:Integer);
begin
    while(l <> nil)do begin
        l^.num := l^.num + n;
        l := l^.sig;
    end;
end;

program Heaven_6_3;
type
    lista = ^nodo;
    nodo = record
        num:Integer;
        sig:lista;
    end;
procedure armarNodoAtras(var l:lista, n:Integer);
var aux:lista; nuevo:lista;
begin
    new(nuevo);
    nuevo^.num := n;
    nuevo^.sig := nil;
    if(l = nil)then
        l := nuevo;
    else begin
        aux := l;
        while(aux.^sig <> nil) do begin
            aux := aux^.sig;
        end;
        aux^.sig := nuevo;
    end;
end;
procedure armarNodoAtras(var l,ult:lista, n:Integer);
var aux:lista; nuevo:lista;
begin
    new(nuevo);
    nuevo^.num := n;
    nuevo^.sig := nil;
    if(l = nil)then
        l := nuevo;
    else
        ult^.sig := nuevo;
    ult := nuevo;
end;

program Heaven_6_4;
type
    lista = ^nodo;
    nodo = record
        num:Integer;
        sig:lista;
    end;
procedure scanLista(l:lista, var max,min,multiplo,n:Integer);
begin
    max := -1; min := 9999; multiplo := 0;
    while(l <> nil)do begin
        if(l^.num > max)then
            max := l^.num;
        if(l^.num > min)then
            min := l^.num;
        if(l^.num MOD multiplo = 0)then
            multiplo := multiplo + 1;
        l := l^.sig;
    end;
end;

program Heaven_6_5;
type
    str40 = String[40];
    producto = record
        code:Integer;
        desc:str40;
        stockAct:Integer;
        stockMin:Integer;
        precio:Real;
    end;
    lista = ^nodo;
    nodo = record
        prod:producto;
        sig:lista;
    end;
procedure cargarProducto(var p:producto);
begin
    WriteLn('Codigo'); ReadLn(p.code);
    if(p.code <> -1)then begin
        WriteLn('Descripcion'); ReadLn(p.desc);
        WriteLn('Stock Actual'); ReadLn(p.stockAct);
        WriteLn('Stock Minimo'); ReadLn(p.stockMin);
        WriteLn('Precio'); ReadLn(p.precio);
    end;
end;
procedure agregarLista(var l,ult:lista; p:producto);
var aux:lista;
begin
    new(aux);
    aux^.prod := p;
    aux^.sig := nil;
    if(l = nil) then
        l := aux;
    else
        ult^.sig := aux;
    ult := aux;
end;
procedure cargarLista(var l:lista);
var p:producto;
begin
    cargarProducto(p);
    while(p.code <> -1)do begin
        agregarLista(l,p);
        cargarProducto(p);
    end;
end;
function scanList(l:lista):Real;
var sumaStock,totalProd:Integer;
begin
    sumaStock := 0; totalProd := 0;
    while(l <> nil)do begin
        totalProd := totalProd + 1;
        if(l^.prod.stockAct < l^.prod.stockMin)then
            sumaStock := sumaStock + l^.prod.stockAct;
        l := l^.sig;
    end;
    scanList := sumaStock DIV totalProd;
end;
function digitoPar(n:Integer, cant:Integer):Boolean
var dig:Integer; cantInt:Integer; ok:Boolean;
begin
    ok := false; dig := 0; cantInt := 0;
    while(n <> 0) and (not ok)do begin
        dig := n MOD 10;
        if(dig MOD 2 = 0)then begin
            cantInt := cantInt + 1;
            if(cantInt = cant)then
                ok := true;
        end;
        n := n DIV 10;
    end;
    digitoPar := ok;
end;
procedure scanDesc(l:list);
begin
    while(l <> nil)do begin
        if(digitoPar(l^.prod.code,3))then
            WriteLn(l^.prod.desc);
        l := l^.sig;
    end;
end;

program Heaven_6_6;
type
    lista = ^nodo;
    str40 = String[40];
    rSonda = record
        nombre:str40;
        duracion:Integer;
        costoCons:Real;
        costoMant:Real;
        rango:1..7;
    end;
    nodo = record
        sonda:rSonda;
        sig:lista;
    end;
procedure leerSonda(var s:rSonda);
begin
    WriteLn('Nombre'); ReadLn(s.nombre);
    if(s.nombre <> 'GAIA')then begin
        WriteLn('Duracion'); ReadLn(s.duracion);
        WriteLn('Costo Construcción'); ReadLn(s.costoCons);
        WriteLn('Costo Mantenimiento'); ReadLn(s.costoMant);
        WriteLn('Rango del espectro electromagnético'); ReadLn(s.rango);
    end;
end;
procedure agregar(var l:lista; s:rSonda);
var aux:lista;
begin
    new(aux);
    aux^.sonda := s;
    aux^.sig := l;
    l := aux;
end;
procedure cargarLista(var l:lista);
var s:rSonda;
begin
    leerSonda(s);
    while(s.nombre <> 'GAIA')do begin
        agregar(l,s);
        leerSonda(s);
    end;
end;
program Heaven_6_8;
type
    lista = ^nodo;
    nodo = record
        num:Integer;
        sig:lista;
    end;
procedure armarNodo(var l:lista; n:Integer);
var aux:lista;
begin
    new(aux);
    aux^.num := n;
    aux^.sig := l;
    l := aux;
-------------------------------
    new(aux);
    aux^.num := n;
    aux^.sig := nil;
    if(l = nil)
        l := aux;
    else begin
        l^.sig := aux;
        l := aux;
    end;
end;

program Heaven_6_9;
function listaOrdenada(l:lista):Boolean;
var ok:true; aux:integer;
begin
    if(l <> Nil)then begin
        aux := l^.num;
        l := l^.sig;
        while(l <> Nil) and (ok)do begin
            if(l^.num < aux)then begin
                ok := false;
            aux := l^.num;
            l := l^.sig;
        end;
        listaOrdenada := ok;
    end;
    listaOrdenada := not ok;
end;
procedure eliminar(var l:lista, n:Integer);
var act, ant:lista; ok:false;
begin
    ant := l;
    act := l;
    while(act <> nil) and (not ok)do begin
        if(act^.num = n)then begin
            ant^.sig := act^.sig;
            ok := true;
        end;
        ant := act;
        act := act^.sig;
    end;
end;

program Heaven_testing;
type
    tipoCuenta = 1..2;
    rFecha = record
        anio:Integer;
        mes:Integer;
        dia:Integer;
    end;
    cuenta = record
        cbu:Integer;
        tipo:tipoCuenta;
        saldo:Real;
    end;
    vCuentas = array[1..10] of cuenta;
    cliente = record
        nro:Integer;
        dni:Integer;
        apellido:String;
        nombre:String;
        fecha:rFecha;
        cuentas:vCuentas;
        dimL:Integer;
    end;
    lista = ^nodo;
    nodo = record
        item:cliente;
        sig:lista;
    end;
procedure leerCuenta(var c:cuenta);
begin
    WriteLn('Cbu'); ReadLn(c.cbu);
    if(c.cbu <> 111)then begin
        WriteLn('Tipo de cuenta'); ReadLn(c.tipo);
        WriteLn('Saldo'); ReadLn(c.saldo);
    end;
end;
procedure cargarCuentas(var v:vCuentas; var dimL:Integer);
var i:Integer; c:cuenta;
begin
    i := 0;
    leerCuenta(c);
    while(i <= 10) and (c.cbu <> 111)do begin
        i := i + 1;
        v[i] := c;
        leerCuenta(c);
    end;
    dimL := i;
end;
procedure cargarFecha(var f:rFecha);
begin
    WriteLn('Día'); ReadLn(f.dia);
    WriteLn('Mes'); ReadLn(f.mes);
    WriteLn('Año'); ReadLn(f.anio);
end;
procedure cargarCliente(var c:cliente);
var f:rFecha; v:vCuentas; dimL:Integer;
begin
    dimL := 0;
    WriteLn('Nro de cliente'); ReadLn(c.nro);
    if(c.nro <> -1)then begin
        WriteLn('Dni'); ReadLn(c.dni);
        WriteLn('Apellido'); ReadLn(c.apellido);
        WriteLn('Nombre'); ReadLn(c.nombre);
        cargarFecha(f);
        c.fecha := f;
        cargarCuentas(v, dimL);
        c.cuentas := v;
        c.dimL := dimL;
    end;
end;
procedure cargarLista(var l,ult:lista; c:cliente);
var aux:lista;
begin
    new(aux);
    aux^.item := c;
    aux^.sig := nil;
    if(l = nil)then
        l := aux;
    else begin
        ult^.sig := aux;
    end;
    utl := aux;
end;
procedure cargarClientes(var l:lista);
var c:cliente; ult:lista;
begin
    cargarCliente(c);
    while(c.nro <> -1)do begin
        cargarLista(l,ult,c);
        cargarCliente(c);
    end;
end;
function dniParImparCompare(n:Integer):Boolean
var dig,pares,impares:Integer;
begin
    pares := 0; impares := 0; dig := 0;
    while(n <> 0)do begin
        dig := n MOD 10;
        if(dig MOD 2 = 0)then
            pares := pares + 1;
        else
            impares := impares + 1;
        n := n DIV 10;
    end;
    if(pares > impares)then
        dniParImparCompare := true;
    else
        dniParImparCompare := false;
end;
procedure scanLista(var l:lista);
var i:Integer; saldoTotal:Real; min1,min2:Integer; nro1,nro2:Integer; c:cliente;
begin
    nro1 := 0; nro2 := 0; min1 := 9999; min2 := 9999; saldoTotal := 0;
    while(l <> nil)do begin
        saldoTotal := 0;
        c := l^.item;
        for i := 1 to c.dimL do begin
            saldoTotal := saldoTotal + c.cuentas[i].saldo;
            if(c.cuentas[i].cbu = 112233445566) and (c.nro = 777)then begin
                c.cuentas[i].saldo := c.cuentas[i].saldo + 1000;
            end;
        end;
        if(c.dimL < min1)then begin
            min2 := min1;
            nro2 := nro1;
            min1 := c.dimL;
            nro1 := c.nro;
        end
        else if(c.dimL < min1)begin
            min2 := c.dimL;
            nro2 := c.nro;
        end;
        if(dniParImparCompare(c.dni))then begin
            WriteLn('Cliente con mas digitos pares que impares, Nombre ', c.nombre, ' Apellido ', c.apellido);
        end;
        WriteLn('Saldo total ', saldoTotal);
    end;
end;
var l:lista;
begin
    cargarClientes(l);
    scanLista(l);
end;

program Heaven_9;
procedure eliminar(var l:lista);
var act,ant:lista; ok:Boolean;
begin
    ok := false;
    act := l;
    ant := l;
    while(act <> Nil) and (not ok)do begin
        if(n = act^.num)then begin
            ant^.sig := act^.sig;
        end;
        ant := act;
        act := act^.sig;
    end;
end;
procedure listaOrdenada(v:lista);
var ant,act:lista; ok:Boolean;
begin
    ok := false;
    ant := l;
    act := l;
    while(act <> Nil) and (not ok)do begin
        if(ant^.num > act^.num)then
            ok := true;
        ant := act;
        act := act^.sig;
    end;
end;
procedure listaOrdenada(v:lista);
var aux:Integer; ok:Boolean;
begin
    ok := false;
    aux := l^.num;
    l := l^.sig;
    while(act <> Nil) and (not ok)do begin
        if(aux > l^.num)then
            ok := true;
        aux := l^.num;
        l := l^.sig;
    end;
end;
procedure sublista(var l:lista; a,b:Integer);
var start:lista; ok:Boolean;
begin
    ok := false; start := nil;
    while(l <> Nil) and (not ok)do begin
        if(l^.num > a) and (start = nil)then
            start := l;
        if(l^.num < b) and (l^.sig <> Nil) and (l^.sig^.num >= b) and (start <> nil)then
            l^.sig := nil;
        l := l^.sig;
    end;
    l := start;
end;
procedure sublista(l:lista; a,b:Integer; var nueva:lista);
var aux:lista; ok:Boolean
begin
    ok := false; aux := nil;
    while(l <> Nil)do begin
        if(l^.num > a) and (l^.num < b)then begin
            new(aux);
            aux^.sig := nil;
            aux^.num := l^.num;
            if(nueva = nil)then
                nueva := aux;
            else
                nueva^.sig := aux;
        end;
        l := l^sig;
    end;
end;