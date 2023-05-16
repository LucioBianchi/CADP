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

begin
	pri := nil;
	writeln(‘Ingrese un numero’); read(valor);
	while (valor <> 0) then begin
		armarNodo(pri, valor);
		writeln(‘Ingrese un numero’); read(valor);
	end;
. . . { imprimir lista }
end.

{a. Indicar ¿Qué hace el programa?}
	El programa agrega nodos adelante, mientras el valor que se ingrese sea distinto de 0
	
{b. Indicar ¿Cómo queda conformada la lista si se lee la siguiente secuencia de números? 10 21 13 48 0}
	[48|--]-> [13|--]-> [21|--]-> [10|nil]
	   L

{c. Implemente un módulo que imprima los números enteros guardados en la lista generada.}
procedure imprimir (L : lista);
begin
	while (L <> nil) do begin
		writeln(L^.num);
		L := L^.sig;
	end;
end;

{d. Implemente un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.}
procedure incisod (L : lista; valor : integer);
begin
	while (L <> nil) do begin
		L^.num := L^.num + valor;
		L := L^.sig;
	end;
end;
