{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:

a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en
caso contrario.

b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota:
la lista podría no estar ordenada.

c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos
los elementos de la lista L mayores que A y menores que B.

d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera
ascendente.

e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera
descendente.}

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

{INCISO A}
function estaOrdenada (l : lista) : boolean;
var
	ordenada : boolean;
	num : integer;
begin
	ordenada := true;
	num := l^.num;
	while (l <> nil) and ordenada do begin
		if num > l^.num then ordenada := false;
		num := l^.num;
		l := l^.sig;
	end;
	estaOrdenada := ordenada;
end;

{INCISO B}
procedure eliminar (var pri : lista; v : integer);
var
	act,ant : lista;
begin
	ant := pri;
	act := pri;
	while ((act <> nil) and (act^.num <> v)) do begin
		ant := act;
		act := act^.sig;
	end;
	if act <> nil then begin 				// existe el elemento
		if pri = act then pri := act^.sig 	// es el primer elemento
		else ant^.sig := act^.sig; 			// el anterior apunta al que le sigue al actual
		dispose(act);
	end;
end;

{INCISO C} // Pascal deja devolver listas (porque es un puntero) pero es incorrecto
procedure sublista (pri : lista; A,B : integer; var newl : lista);
begin
	while (pri <> nil) do begin
		if ((pri^.num > A) and (pri^.num < B)) then armarNodo(newl,pri^.num);
		pri := pri^.sig;
	end;
end;

{INCISO D}
procedure sublistaAscendente (pri : lista; A,B : integer; var newl : lista);
begin
	while ((pri <> nil) and (pri^.num < A)) do
		pri := pri^.sig;
	if pri <> nil then begin
		while ((pri <> nil) and (pri^.num < B)) do begin
			armarNodo(newl,pri^.num);
			pri := pri^.sig;
		end;
	end;
end;

{INCISO E}
procedure sublitasDescendente (pri : lista; A,B : integer; var newl : lista);
begin
	while ((pri <> nil) and (pri^.num > B)) do
		pri := pri^.sig;
	if pri <> nil then begin
		while ((pri <> nil) and (pri^.num > A)) do begin
			armarNodo(newl,pri^.num);
			pri := pri^.sig;
		end;
	end;
end;

begin
	pri := nil;
	writeln('Ingrese un numero'); read(valor);
	while (valor <> 0) do begin
		armarNodo(pri, valor);
		writeln('Ingrese un numero'); read(valor);
	end;
. . . { imprimir lista }
end.

