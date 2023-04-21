{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:

a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.

b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.

c) sumaVector: retorna la suma de todos los elementos del vector.

d) promedio: devuelve el valor promedio de los elementos del vector.

e) elementoMaximo: retorna la posición del mayor elemento del vector

f) elementoMinimo: retorna la posicion del menor elemento del vector}

// inciso A
function posicion (x : integer; v : vector) : integer;
var
	i : integer;
	noEncontrado : boolean;
begin
	i := 1;
	noEncontrado := true;
	while ((noEncontrado) and (i <= dimL)) do begin
		if (v[i] = x) then
			noEncontrado := false
		else i := i + 1;
	end;
	if (noEncontrado) then posicion := -1
	else posicion := i;
end;

// inciso B
procedure intercambio (var v : vector; x,y : integer);
var
	aux : integer;
begin
	aux := v[x];
	v[x] := v[y];
	v[y] := aux;
end;

// inciso C
function sumaVector (v : vector) : integer;
var
	suma,i : integer;
begin
	for i := 1 to 100 do  // --> Asumo que estan cargados todas las posiciones
		suma := suma + v[i];
	sumaVector := suma;
end;

// inciso D
function promedio (v : vector) : real; // --> Tambien se podria invocar al proceso sumaVector(v) / 100
var
	suma,i : integer;
begin
	for i := 1 to 100 do
		suma := suma + v[i];
	promedio := suma / 100;
end;

// inciso E
function elementoMaximo (v : vector) : integer;
var
	i,max,posicion : integer;
begin
	posicion := -1;
	max := -9999;
	for i := 1 to 100 do begin
		if v[i] > max then begin
			max := v[i];
			posicion := i;
		end;
	end;
	elementoMaximo := posicion;
end;

// inciso F
function elementoMinimo (v : vector) : integer;
var
	i,min,posicion : integer;
begin
	posicion := -1;
	min := 9999;
	for i := 1 to 100 do begin
		if v[i] < min then begin
			min := v[i];
			posicion := i;
		end;
	end;
	elementoMinimo := posicion;
end;
