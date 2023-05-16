{4. Utilizando el programa del ejercicio 1, realice los siguientes módulos:

a. maximo : recibe la lista como parámetro y retorna el elemento de valor máximo

b. minimo: recibe la lista como parámetro y retorna el elemento de valor mínimo

c. multiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la lista que
son múltiplos de A.}

program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;
var
	pri : lista;
	valor : integer;
	
procedure armarNodo(var L : lista; v : integer);
var
	aux : lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	L := aux;
end;

{inciso a}
function maximo (l : lista) : integer;
var
	max : integer;
begin
	max := -9999;
	while (l <> nil) do begin
		if l^.num > max then max := l^.num;
		l := l^.sig;
	end;
	maximo := max;
end;

{inciso b}
function minimo (l : lista) : integer;
var
	min : integer;
begin
	min := 9999;
	while (l <> nil) do begin
		if l^.num < min then max := l^.num;
		l := l^.sig;
	end;
	minimo := min;
end;

{inciso c}
function multiplos (l : lista; A : integer);
var
	cant : integer;
begin
	cant := 0;
	while (l <> nil) do begin
		if l^.num MOD A = 0 then cant := cant + 1;
		l := l^.sig;
	end;
	multiplos := cant;
end;

begin
	pri := nil;
	writeln(‘Ingrese un numero’); read(valor);
	while (valor <> 0) then begin
		armarNodo(pri, valor);
		writeln(‘Ingrese un numero’); read(valor);
	end;
. . . { imprimir lista }
end.
