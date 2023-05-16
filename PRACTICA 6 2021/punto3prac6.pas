{3. Utilizando el programa del ejercicio 1, realice los siguientes cambios:

a. Modifique el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás)

b. Modifique el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresado, manteniendo un puntero al último ingresado.

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

{inciso a}
procedure armarNodo(var L : lista; v : integer);
var
	nuevo : lista;
begin
	new(nuevo); nuevo^.num := v; nuevo^.sig := nil;
	if (L = nil) then L := nuevo
	else begin
		aux := L;
		while (aux^.sig <> nil) do
			aux^:= aux^.sig;
		aux^.sig := nuevo;
	end;
	
end;	

{Inciso b}
procedure armarNodo(var L,U : lista; v : integer);
var
	aux : lista;
begin
	new(aux);
	aux^.num := v;
	if (L = nil) then
		L := nuevo
	else
		U^.sig := nuevo;
	U := nuevo;
end;
