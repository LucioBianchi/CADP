{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado).}

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
	nuevo,ant,act : lista;
begin
	new(nuevo);
	nuevo^.num := v;
	ant := pri;
	act := pri;
	while ((act <> nil) and (act^.num < v)) do begin
		ant := act;
		act := act^.sig;
	end;
	if ant = act then pri := nuevo //es el 1er elemento
	else ant^.sig := nuevo; // es un elemento del medio o el ultima
	nuevo^.sig := act; // se repite en los 3 casos
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
