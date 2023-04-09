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
   cargarLista(l);
   printLista(l);
   WriteLn();
   WriteLn('---------------');
   eliminarRepetidos(l,4);
   printLista(l);
end.

procedure agregarAdelante(var l:lista; val:integer);
var nuevo:lista;
begin
	new(nuevo);
	nuevo^.elem := val;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure agregarFinal(var l:lista; var ult:lista; value:integer);
var nuevo:lista;
begin
	new(nuevo); nuevo^.sig := nil; nuevo^.elem := value;
	if(l = nil)then
		l := nuevo;
	else
		ult^.sig := nuevo;
	utl := nuevo;
end;

procedure agregarFinal2(var l:lista; value:integer);
var nuevo,aux:lista;
begin
	new(nuevo); nuevo^.sig := nil; nuevo^.elem := value;
	if(l = nil)then
		l := nuevo;
	else begin
		aux := l;
		while(aux^.sig <> nil)do
			aux := aux^.sig;
		aux^.sig := nuevo;
	end;
end;

procedure ingresarOrdenado(var l:lista; value:integer);
var ant,act,nuevo:lista;
begin
	new(nuevo); nuevo^.sig := nil; nuevo^.elem := value;
	ant := l;
	act := l;
	while(act <> nil) and (act^.elem < value)do begin
		ant := act;
		act := act^.sig;
	end;
	if(act = nil)then
		l := nuevo;
	else
		ant^.sig := nuevo;
	nuevo^.sig := act;
end;

procedure eliminarOrdenado(var l:lista; value:integer);
var ant,act:lista;
begin
	ant := l;
	act := l;
	while(act <> nil) and (act^.elem < value)do begin
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

procedure insertar(var v:vector; var dimL:integer; pos:integer);
var i:integer;
begin
	if(dimL + 1 <= dimF) and (pos >= 1) and (pos <= dimL)then begin
		for i:=dimL downto pos do
			v[i+1] := v[i];
		v[pos] := value;
		dimL := dimL + 1;
	end;
end;

procedure eliminar(var v:vector; var dimL:integer; pos:integer);
begin
	if(pos >= 1) and (pos <= dimL)then begin
		dimL := dimL - 1;
		for i:=pos to dimL do
			v[i] := v[i+1];
	end;
end;

procedure insertar(var v:vector; var dimL:integer; pos:integer);
begin
	if(dimL + 1 <= dimF) and (pos >= 1) and (pos <= dimL)then begin
		for i:=dimL downto pos do
			v[i+1] := v[i];
		v[pos] := value;
		dimL := dimL + 1;
	end;
end;

procedure insertar
begin
	if(dimL + 1 < dimF) and (pos >= 1) and (pos <= dimL)then begin
		for i:=dimL downto pos do
			v[i+1] := v[i];
		v[pos] := value;
		dimL := dimL + 1;
	end;
end;

procedure eliminar();
begin
	if(pos >= 1) and (pos <= dimL)then
		dimL := dimL - 1;
		for i:=pos to dimL do
			v[i] := v[i+1];
	end;
end;












































