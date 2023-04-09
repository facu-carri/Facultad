program heaven_5_a;
procedure checkDoble(a:integer; b:integer; ok:Boolean);
begin
    checkDoble := b/a = 2;
end;
var n1,n2:integer; ok:Boolean;
begin
    ok := false;
    read(n1); read(n2);
    checkDoble(n1,n2,ok);
    if(ok)then
        write(n2, ' es el doble de ', n1)
    else
        write(n2, ' no es el doble de ', n1);
end.

program heaven_5_b;
procedure checkDoble(a:integer; b:integer; var ok:Boolean);
begin
    ok := b/a = 2;
end;
var n1,n2,pares,paresPar:integer; ok:Boolean;
begin
    pares := 0;
    paresPar := 0;
    read(n1); read(n2);
    while(n1 <> 0) and (n2 <> 0)do
    begin
        ok := false;
        pares := pares + 1;
        checkDoble(n1,n2,ok);
        if(ok)then
            paresPar := paresPar + 1;
        read(n1); read(n2);
    end;
    writeln('cantidad de pares leídos ', pares);
    writeln('cantidad de pares en los que numB es el doble de numA ', paresPar);
end.

program heaven_5_b_2;
function checkDoble(a:integer; b:integer):Boolean;
begin
    checkDoble := b/a = 2;
end;
var n1,n2,pares,paresPar:integer;
begin
    pares := 0;
    paresPar := 0;
    read(n1); read(n2);
    while(n1 <> 0) and (n2 <> 0)do
    begin
        pares := pares + 1;
        if(checkDoble(n1,n2))then
            paresPar := paresPar + 1;
        read(n1); read(n2);
    end;
    writeln('cantidad de pares leídos ', pares);
    writeln('cantidad de pares en los que numB es el doble de numA ', paresPar);
end.

program heaven_12;
function checkVocal(l:Char):Boolean;
begin
    checkVocal := (l = 'a') OR (l = 'e') OR (l = 'i') OR (l = 'o') OR (l = 'u');
end;

function isNumber(l:Char):Boolean;
begin
    isNumber := ('0' >= l) and (l <= '9');
end;

function checkAlpha(l:Char):Boolean;
begin
    checkAlpha := (not checkVocal(l)) and (not isNumber(l));
end;

procedure readVocals(var ok:Boolean);
var l:Char;
begin
    WriteLn('Ingrese vocal');
    readln(l);
    while(l <> '$') and (ok) do begin
        if(not checkVocal(l))then begin
            ok := false;
        end
        else
            readln(l);
    end;
end;

procedure readAlphas(var ok:Boolean);
var l:Char;
begin
    WriteLn('Ingrese Alpha');
    readln(l);
    while(l <> '#') and (ok)do begin
        if(not checkAlpha(l))then begin
            ok := false;
        end
        else
            readln(l);
    end;
end;

var ok:Boolean;
begin
    ok := true;
    readVocals(ok);
    if(ok)then begin
        readAlphas(ok);
        if(ok)then
            Write('Cumple la secuencia')
        else
            Write('No Cumple Con B');
    end
    else
        Write('No Cumple Con A');
end.

program heaven_13;
procedure check_A(var ok:Boolean; var len:Integer);
var c:Char;
begin
    WriteLn('Escribir partrón');
    readLn(c);
    while(c <> '%') and (ok)do begin
        if(c = '$')then begin
            ok := false;
        end
        else begin
            len := len + 1;
            readLn(c);
        end;
    end;
end;

procedure check_B(var ok:Boolean; len:Integer);
var count, i:Integer; c:Char;
begin
    count := 0;
    i := 0;
    WriteLn('Escribir partrón');
    readLn(c);
    while(c <> '*') and (ok)do begin
        i := i + 1;
        if(c = '@')then
            count := count + 1;
        if(i > len)then
            ok := false;
        readLn(c);
    end;
    if(count = 0) or (i < len)then
        ok := false;
end;

var ok:Boolean; len:Integer;
begin
    ok := true;
    len := 0;
    check_A(ok, len);
    if(ok)then begin
        check_B(ok, len);
        if(ok)then begin
            WriteLn('La secuencia cumple');
        end
        else
            WriteLn('La secuencia no cumple B');
    end
    else
        WriteLn('La secuencia no cumple A');
end.

program Heaven_14_a;
function rendimiento(ha:integer; zone:Integer; price:Real):Real;
begin
    case (zone) of
        1: rendimiento := 6*ha*price;
        2: rendimiento := 2.5*ha*price;
        3: rendimiento := 1.4*ha*price;
    end;
end;

program Heaven_14_b;
function rendimiento(ha:integer; zone:Integer; price:Real):Real;
begin
    case (zone) of
        1: rendimiento := 6*ha*price;
        2: rendimiento := 2.5*ha*price;
        3: rendimiento := 1.4*ha*price;
    end;
end;
var localidad, locMaxRend, locMinRend:String;
    ha, zone, tresFeb:Integer; actualRend, maxRend, minRend:Real;
begin
    maxRend := -1; minRend := 99999; tresFeb := 0;
    repeat
        WriteLn('localidad'); ReadLn(localidad);
        WriteLn('Ha'); ReadLn(ha);
        WriteLn('Zona'); ReadLn(zone);
        actualRend := rendimiento(ha, zone, 320);
        if(localidad = 'Tres de Febrero') and (actualRend > 10000)then
            tresFeb := tresFeb + 1;
        if(actualRend > maxRend)then begin
            locMaxRend := localidad;
            maxRend := actualRend;
        end;
        if(actualRend < minRend)then begin
            locMinRend := localidad;
            minRend := actualRend;
        end;
    until((ha = 900) and (localidad = 'Saladillo'));
    WriteLn('La cantidad de campos de la localidad Tres de Febrero con rendimiento superior ', tresFeb);
    WriteLn('Localidad con mayor rendimiento ', locMaxRend);
    WriteLn('Localidad con menor rendimiento ', locMinRend);
end.

program Heaven_3_1;
var a:alumno; i:Integer; maxProm:Real; maxPromName:str20;
begin
    i := 0;
    maxProm := -1;
    maxPromName := 'None';
    leer(a);
    while(a.codigo <> 0)do begin
        i := i + 1;
        if(a.promedio < maxProm)then begin
            maxPromName := a.nombre;
            maxProm := a.promedio;
        end;
        leer(a);
    end;
    WriteLn('Cant de alumnos ', i);
    writeln('El alumno con mejor promedio fue: ', maxPromName);
end.

program Heaven_3_2;
type
    fecha = record
            anio:Integer;
            mes:Integer;
            dia:Integer;
    end;
procedure leerFecha(var dmy:fecha);
begin
    WriteLn('Ingrese Día '); ReadLn(dmy.dia);
    WriteLn('Ingrese Mes '); ReadLn(dmy.mes);
    WriteLn('Ingrese Año '); ReadLn(dmy.anio);
end;
var fechaWedd:fecha; first10Days, cantWedd, cantWeddSummer:Integer;
begin
    cantWedd := 0; cantWeddSummer := 0; first10Days := 0;
    leerFecha(fechaWedd);
    while(fechaWedd.anio <> 2020)do begin
        cantWedd := cantWedd + 1;
        if(fechaWedd.mes <= 3)then
            cantWeddSummer := cantWeddSummer + 1;
        if(fechaWedd.dia <= 10)then
            first10Days := first10Days + 1;
        leerFecha(fechaWedd);
    end;
    WriteLn('Cantidad de casamientos ', cantWedd);
    WriteLn('Casamientos en verano ', cantWeddSummer);
    WriteLn('Casamientos en los primeros 10 días ', first10Days)
end.

program Heaven_3_3;
const unesco = 23.435;
type
    escuela = record
        cue:Integer;
        nombre:String;
        docentes:Integer;
        alumnos:Integer;
        localidad:String;
    end;
function relAlumDoc(alumn:Integer, docentes:Integer):Real;
begin
    relAlumDoc := alumn / docentes;
end;
procedure leer(var es:escuela);
begin
    WriteLn('Codigo de establecimiento '); Read(es.cue);
    WriteLn('Nombre '); Read(es.nombre);
    WriteLn('Cantidad de docentes '); Read(es.docentes);
    WriteLn('Cantidad de alumnos'); Read(es.alumnos);
    WriteLn('Localidad '); Read(es.localidad);
end;
var cue1, cue2, cantEscSup, i:Integer; esc:escuela; max1, max2, rel:Real;
begin
    cantEscSup := 0; cue1 := 0; cue2 := 0;
    max1 := -1; max2 := -1;
    for i := 1 to 2400 do begin
        leer(esc);
        rel := relAlumDoc(esc.alumnos, esc.docentes);
        if(rel > unesco)then
            cantEscSup := cantEscSup + 1;
        if(rel > max1)then begin
            max2 := max1;
            cue2 := cue1;
            max1 := rel;
            cue2 := esc.cue;
        end
        else if(rel > max2)then
        begin
            max2 := rel;
            cue2 := esc.cue;
        end;
    end;
end.

program Heaven_3_4;
const clientes = 9300;
const c_min = 3.4;
const c_mb = 1.35;
type
    cliente = record
        code:Integer;
        lineas:Integer;
        totalMb:Real;
        totalMin:Real;
    end;
    linea = record
        numero:Integer;
        min:Integer;
        mb:Integer;
    end;
procedure leerLinea(var l:linea);
begin
    WriteLn('Numero de telefono '); Read(l.numero);
    WriteLn('Cantidad de minutos consumidos '); Read(l.min);
    WriteLn('MB consumidos x mes '); Read(l.mb);
end;
procedure leerCliente(var cl:cliente);
var i:Integer; l:linea;
begin
    WriteLn('Codigo de cliente '); Read(cl.code);
    WriteLn('Cantidad de lineas '); Read(cl.lineas);
    cl.totalMb := 0;
    cl.totalMin := 0;
    for i := 1 to cl.lineas do begin
        leerLinea(l);
        cl.totalMb := cl.totalMb + (l.mb * c_mb);
        cl.totalMin := cl.totalMin + (l.min * c_min);
    end;
end;
var cl:cliente; i:Integer;
begin
    for i := 1 to clientes do begin
        leerCliente(cl);
        WriteLn('Monto total de minutos a facturar ', cl.totalMin);
        WriteLn('Monto total mb a facturar ', cl.totalMb);
    end;
end.
program Heaven_3_5;
type
    auto = record
        marca:String;
        modelo:String;
        precio:Real;
    end;
procedure leer(var a:auto);
begin
    WriteLn('Marca'); ReadLn(a.marca);
    if(a.marca <> 'ZZZ')then
    begin
        WriteLn('modelo'); ReadLn(a.modelo);
        WriteLn('precio'); ReadLn(a.precio);
    end;
end;
var a:auto; marcaActual:String; precioMarca:Real; autoPorMarca:Integer;
    marcaGucci, modeloGucci:String; maxPrice:Real;
begin
    precioMarca := 0; autoPorMarca := 0; maxPrice := -1;
    marcaActual := 'asd';
    leer(a);
    while(a.marca <> 'ZZZ')do begin
        if(a.marca <> marcaActual)then
        begin
            Write('Precio promedio de la marca ', marcaActual, ' es ', autoPorMarca/precioMarca);
            marcaActual := a.marca;
            autoPorMarca := 0;
            precioMarca := 0;
        end;
        if(a.precio > maxPrice)then
        begin
            maxPrice := a.precio;
            marcaGucci := a.marca;
            modeloGucci := a.modelo;
        end;
        precioMarca := precioMarca + a.precio;
        autoPorMarca := autoPorMarca + 1;
        leer(a);
    end;
end.

program Heaven_3_6;
type
    microProcesador = record
        marca:String;
        linea:String;
        cores:Integer;
        velocidad:Real;
        nm:Integer;
    end;
procedure leer(var mp:microProcesador);
begin
    WriteLn('marca'); ReadLn(mp.marca);
    WriteLn('linea'); ReadLn(mp.linea);
    WriteLn('cores'); ReadLn(mp.cores);
    if(mp.cores <> 0)then
    begin
        WriteLn('velocidad'); ReadLn(mp.velocidad);
        WriteLn('nm'); ReadLn(mp.nm);
    end;
end;
var mp:microProcesador; nmGt14_1, nmGt14_2:String;
maxNm_1, maxNm_2:Integer; cantMulticoreAMD, cantMulticoreIntel:Integer;
begin
    maxNm_1 := -1; maxNm_2 := -1; cantMulticoreAMD := 0;
    cantMulticoreIntel := 0;
    leer(mp);
    while(mp.cores <> 0)do begin
        if(mp.cores > 2) and (mp.nm >= 22) then
            Write(mp.marca, ' de la linea ', mp.linea, ' Tiene mas de 2 cores y a lo sumo 22 nm');
        if(mp.nm = 14) then begin
          if(mp.core > maxNm_1) then begin
                maxNm_2 := maxNm_1;
                nmGt14_2 := nmGt14_1;
                maxNm_1 := mp.core;
                nmGt14_1 := mp.marca;
            end
            else if(mp.core > maxNm_2) then begin
                maxNm_2 := mp.core;
                nmGt14_2 := mp.marca;
            end;
        end;
        if(mp.marca = 'AMD') and (mp.velocidad > 2)then
            cantMulticore := cantMulticore + 1;
        if(mp.marca = 'Intel') and (mp.velocidad > 2)then
            cantMulticore := cantMulticore + 1;
        leer(mp);
    end;
end.

program Heaven_3_7;
type
    centro = record
        apodo:String;
        uni:String;
        investigadores:Integer;
        becarios:Integer;
    end;
procedure leer(var c:centro);
begin
    WriteLn('Nombre abreviado '); ReadLn(c.apodo);
    WriteLn('Universidad '); ReadLn(c.uni);
    WriteLn('Cantidad de investigadores'); ReadLn(c.investigadores);
    WriteLn('Cantidad de becarios'); ReadLn(c.becarios);
end;
var
c:centro; uniMaxInves, uniActual:String; maxInves, cantCentros:Integer;
minBec_1, minBec_2:Integer; cMinBec_1, cMinBec_2:String;
begin
    minBec_1 := 9999; minBec_2 := 9999; maxInves := -1;
    cantCentros := 0;
    leer(c);
    uniActual := c.uni;
    while(c.investigadores <> 0)do begin
        if(c.uni <> uniActual)then begin
            WriteLn('Cantidad total de centros de la universidad ', uniActual, ' es ', cantCentros);
            uniActual := c.uni;
            cantCentros := 0;
        end
        else
            cantCentros := cantCentros + 1;
        if(c.investigadores > maxInves)then begin
            maxInves := c.investigadores;
            uniMaxInves := c.uni;
        end;
        if(c.becarios < minBec_1)then then
        begin
            minBec_2 := minBec_1;
            cMinBec_2 := cMinBec_1;
            minBec_1 := c.becarios;
            cMinBec_1 := c.apodo;
        end
        else if(c.becarios < minBec_2)then
        begin
            minBec_2 := c.becarios;
            cMinBec_2 := c.apodo;
        end;
        leer(c);
    end;
end.

Program Heaven_3_8;
type
    docenteInfo = record
        dni:Integer;
        nombre:String;
        apellido:String;
        email:String;
    end;
    proyecto = record
        codigo:Integer;
        titulo:String;
        docente:docenteInfo;
        cantAlumnos:Integer;
        escuela:String;
        localidad:String;
    end;
procedure leerDocente(d:docenteInfo);
begin
    WriteLn('Dni'); ReadLn(d.dni);
    WriteLn('nombre'); ReadLn(d.nombre);
    WriteLn('apellido'); ReadLn(d.apellido);
    WriteLn('email'); ReadLn(d.email);
end;
procedure leerProyecto(var p:proyecto);
begin
    WriteLn('Codigo'), ReadLn(p.codigo);
    if(p.codigo <> -1)then
    begin
      WriteLn('Titulo'), ReadLn(p.titulo);
        leerDocente(p.docente);
        WriteLn('Cantidad de alumnos'), ReadLn(p.cantAlumnos);
        WriteLn('Nombre de la escuela'), ReadLn(p.escuela);
        WriteLn('localidad'), ReadLn(p.localidad);
    end;
end;
function eqParImpar(code:Integer):Boolean;
var par,impar:Integer;
begin
    par := 0; impar := 0;
    while(code <> 0)do begin
        if(code MOD 2 = 0)then begin
            par := par + 1;
        end
        else
            impar := impar + 1;
        code := code DIV 10;
    end;
    eqParImpar := par = impar;
end;
var p:proyecto; cantEscLoc, cantEscTotal:Integer;
maxAlum_1, maxAlum_2, cantActual:Integer; escMaxAlum_1, escMaxAlum_2:String;
tituloDaire, locActual, escActual:String;
begin
    cantEscTotal := 0;
    maxAlum_1 := -1; maxAlum_2 := -1;
    leerProyecto(p);
    while(p.code <> -1)do begin
        locActual := p.localidad;
        cantEscLoc := 0;
        while(locActual = p.localidad) and (p.code <> -1)do begin
            escActual := p.escuela;
            cantActual := 0;
            cantEscLoc := cantEscLoc + 1;
            while(escActual = p.escuela) and (locActual = p.localidad) and (p.code <> -1)do begin
                cantActual := cantActual + p.cantAlumnos;
                if(p.escuela = 'Daireaux')then begin
                    if(eqParImpar(p.codigo))then
                        WriteLn('El proyecto ', p.titulo, ' TIENE UN CODIGO QUE POSEE IGUAL CANTIDAD DE DIGITOS PARES E IMPARES.')
                end;
                leerProyecto(p);
            end;
            if(cantActual >= maxAlum_1)then
            begin
                maxAlum_2 := maxAlum_1;
                escMaxAlum_2 := escMaxAlum_1;
                maxAlum_1 := cantActual;
                escMaxAlum_1 := escActual;
            end
            else if(cantActual >= maxAlum_2)then
            begin
                maxAlum_2 := cantActual;
                escMaxAlum_2 := escActual;
            end;
        end;
        writeln('Las dos escuelas con mayor cantidad de alumnos participantes en ', locActual, ' son ', escMaxAlum_1, ' y ', escMaxAlum_2);
        cantTotalEscuelas := cantTotalEscuelas + cantEscLoc;
        WriteLn('Cantidad de escuelas en la localidad de ', locActual, ' es ', cantEscLoc);
    end;
    writeln('Cantidad total de escuelas: ', cantEscTotal);
end.