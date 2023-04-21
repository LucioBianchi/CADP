{5. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}

program punto5practica4;

const
	dimF = 100;
type
	vector = array [1..dimF] of integer;

procedure cargar (var v: vector; var dimL : integer);
var
	num : integer;
begin
	dimL := 0;
	read(num);
	while ((num <> 0) and (dimL < dimF)) do begin
		dimL := dimL + 1;
		v[dimL] := num;
		if dimL < dimF then read(num); // ---> Sino se lee un numero de más que no cambia el resultado
	end;
end;

procedure intercambio (var v : vector; x,y : integer);
var
	aux : integer;
begin
	aux := v[x];
	v[x] := v[y];
	v[y] := aux;
end;

procedure elementoMaximo (v : vector; var posMax,max,dimL : integer);
var
	i: integer;
begin
	for i := 1 to dimL do begin
		if v[i] > max then begin
			max := v[i];
			posMax := i;
		end;
	end;
end;

procedure elementoMinimo (v : vector; var posMin,min,dimL : integer);
var
	i: integer;
begin
	for i := 1 to dimL do begin
		if v[i] < min then begin
			min := v[i];
			posMin := i;
		end;
	end;
end;

var
	vnum : vector;
	max,min,dimL,posMax,posMin : integer;
begin
	max := -9999;
	min := 9999;
	posMax := -1;
	posMin := -1;
	dimL := 0;
	cargar (vnum,dimL);
	elementoMaximo (vnum,posMax,max,dimL);
	elementoMinimo (vnum,posMin,min,dimL);
	writeln('El elemento maximo ',max,' que se encontraba en la posicion ',posMax,' fue intercambiado con el elemento minimo ',min,' que se encontraba en la posicion ',PosMin);
	intercambio (vnum,max,min);
end.
