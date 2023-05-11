{program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	pc^:= 'un nuevo texto';
	new(pc);
	writeln(pc^);
end.}

. Imprime: ERROR porque se le intenta asignar un valor a la dirección apuntada por pc antes
  de reservar una dirección en la memoria dinámica con new(). pc no inicializada.

{program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	new(pc);
	pc^:= 'un nuevo nombre';
	writeln(sizeof(pc^), ' bytes');
	writeln(pc^);
	dispose(pc);
	pc^:= 'otro nuevo nombre';
end.}

. Imprime: 51 bytes
. Imprime: un nuevo nombre
. Imprime: ERROR, se intenta imprimir el contenido de pc, pero la dirección de memoria se
  liberó previamente con el dispose(pc)

{program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
	pun^:= 'Otro texto';
end;
var
	pc: puntero_cadena;
begin
	new(pc);
	pc^:= 'Un texto';
	writeln(pc^);
	cambiarTexto(pc);
	writeln(pc^);
end.}

. Imprime: Un texto
. Imprime: Otro texto

{program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
	new(pun);
	pun^:= 'Otro texto';
end;
var
	pc: puntero_cadena;
begin
	new(pc);
	pc^:= 'Un texto';
	writeln(pc^);
	cambiarTexto(pc);
	writeln(pc^);
end.}

. Imprime: Un texto
. Imprime: Un texto
