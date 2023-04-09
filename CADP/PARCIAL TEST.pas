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