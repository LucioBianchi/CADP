{6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones.}

program punto6practica4;

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
		if dimL < dimF then read(num);
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

procedure MaximoYMinimo (v : vector; var posMax,max,posMin,min,dimL : integer);
var
	i: integer;
begin
	for i := 1 to dimL do begin
		if v[i] > max then begin
			max := v[i];
			posMax := i;
		end;
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
	MaximoYMinimo (vnum,posMax,max,posMin,min,dimL);
	writeln('El elemento maximo ',max,' que se encontraba en la posicion ',posMax,' fue intercambiado con el elemento minimo ',min,' que se encontraba en la posicion ',PosMin);
	intercambio (vnum,max,min);
end.
