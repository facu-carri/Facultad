Program heaven_1
var  i,dni,altura,maxHeight_1,maxHeight_2,maxDni_1, maxDni_2:integer;
begin
    maxHeight_1 := -1;
    maxHeight_2 := -1;
    for (i := 1 to 20)do
        read(altura); read(dni); //carga de datos
        if(altura > maxHeight_1)then
            maxHeight_2 := maxHeight_1;
            maxDni_2 := maxDni_1;
            maxDni_1 := dni;
            maxHeight_1 := altura;
        else if(altura > maxHeight_2)then
            maxDni_2 := dni;
            maxHeight_2 := altura;
    write(n);
end.