{Realice un programa que resuelva los siguientes incisos:

a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.

b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.

c. Lea un nombre y lo inserte en la posición 4 del vector.

d. Lea un nombre y lo agregue al vector.

Nota: Realizar todas las validaciones necesarias.}


program practica4parte2punto2;

const
	dimF = 500;
type
	vector = array[1..dimF] of string;

procedure cargar (var v :vector; var dimL : integer);
var
	nombre : string;
begin
	dimL := 0;
	readln(nombre);
	while ((dimL <= dimF) and (nombre <> 'ZZZ')) do begin
		dimL := dimL +1;
		v[dimL] := nombre;
		readln(nombre);
	end;
end;

procedure eliminar (var v : vector; var dimL : integer);
var
	i,pos : integer;
	nombre : string;
begin
	write('Ingresar nombre para eliminar:');
	readln(nombre);
	pos := 1;
	while (pos <= dimL) and (nombre <> v[pos]) do
		pos := pos + 1;
	if (pos <= dimL) then begin
		for i := pos to dimL - 1 do
			v[i] := v[i+1];
		dimL := dimL - 1;
	end;
end;

procedure insertar (var v : vector; var dimL : integer; pos : integer);
var
	nombre : string;
	i : integer;
begin
	write('Ingresar nombre para insertar:');
	readln(nombre);
	if ((dimL < dimF) and (pos >= 1) and (pos <= dimL)) then begin
		for i := dimL downto pos do
			v[i+1] := v[i];
		v[pos] := nombre;
		dimL := dimL + 1;
	end;
end;

procedure agregar (var v :vector; var dimL : integer);
var
	nombre : string;
begin
	write('Ingresar nombre para agregar:');
	readln(nombre);
	if (dimL < dimF) then begin
		dimL := dimL + 1;
		v[dimL] := nombre;
	end;
end;

procedure imprimir (v : vector; dimL : integer);
var
	i : integer;
begin
	for i := 1 to dimL do
		writeln(v[i]);
end;

var
	v : vector;
	dimL : integer;
BEGIN
	dimL := 0;
	//inciso a
	cargar(v,dimL);
	imprimir(v,dimL);
	writeln();
	//inciso b
	eliminar(v,dimL);
	imprimir(v,dimL);
	writeln();
	//inciso c
	insertar(v,dimL,4);
	imprimir(v,dimL);
	writeln();
	//inciso d
	agregar(v,dimL);
	imprimir(v,dimL);
END.

