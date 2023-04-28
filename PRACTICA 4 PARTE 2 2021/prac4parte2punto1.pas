{ a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un
valor n y retorne si n se encuentra en el vector o no.

b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}

program practica4parte2ejercicio1;

const
	dimF = 500;
type
	vector = array[1..500] of integer;

{Este proceso NO hay que escribirlo, el enunciado ya nos lo da, es solo para probar los demas modulos}
procedure cargar(var v: vector; var dimL : integer);
var
	num : integer;
begin
	dimL := 0;
	read(num);
	while (dimL <= dimF) and (num <> -1) do begin
		dimL := dimL + 1;
		v[dimL] := num;
		read(num);
	end; 
end;


//inciso A
function busqueda (v : vector; dimL,num : integer) : boolean;
var
	pos : integer;
begin
	pos := 1;
	while (pos <= dimL) and (num <> v[pos]) do 
		pos := pos + 1;
	busqueda := (pos <= dimL);
end;

//inciso B
function busquedaMejorada (v : vector ; dimL,num : integer) : boolean;
var
	pos : integer;
begin
	pos := 1;
	while (pos <= dimL) and (v[pos] < num) do
		pos := pos + 1;
	busquedaMejorada := ((pos <= dimL) and (num = v[pos]));
end;

//busqueda binaria
function busquedaBinaria (v: vector; dimL,num : integer) : boolean;
var
	first,last,medium : integer;
begin
	first := 1; last := dimL;
	medium := (first + last) DIV 2;
	while (first <= last) and (v[medium] <> num) do begin
		if (num < v[medium]) then
			last := medium - 1
		else first := medium + 1;
		medium := (first + last) DIV 2;
	end;
	busquedaBinaria := ((first <= last) and (num = v[medium])); // --> La segunda condicion no es necesaria creo
end;

var
	v : vector;
	dimL,num : integer;
BEGIN
	dimL := 0;
	cargar(v,dimL);
	writeln('Ingresar numero que se quiere buscar');
	read(num);
	if busqueda(v,dimL,num) then writeln('Encontrado por busqueda desordenada');
	if busquedaMejorada(v,dimL,num) then writeln('Encontrado por busqueda mejorada');
	if busquedaBinaria(v,dimL,num) then writeln('Encontrado por busqueda binaria'); // --> No funciona
END.

//9 23 8 7 5 3 0 2 32 45 46 48 49 54 26 -1
