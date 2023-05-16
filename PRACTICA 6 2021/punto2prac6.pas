{2. Dado el siguiente código, identifique los 9 errores.}

program ejercicio2;
type
	lista = ^nodo;
	persona = record
		dni: integer;
		nombre: string;
		apellido: string;
	end;
	nodo = record
		dato: persona;
		sig: lista;
	end;
	
procedure leerPersona(p: persona); // --> Error 1
begin
	read(p.dni);
	if (p.dni <> 0)then begin
		read(p.nombre);
		read(p.apellido);
	end;
end;

{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista; p:persona); // --> Error 2
var
	aux: lista;
begin 
	aux^.dato:= p; // --> Error 3
	aux^.sig:= l;
	l:= aux;
end;

{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
	p: nodo; // --> Error 4
begin
	leerPersona(p);
	while (p.dni <> 0) do begin
		agregarAdelante(l,p); // --> Error 5
	end;
end;

procedure imprimirInformacion(var l: lista); // --> Error 6
begin
	while (l <> nil) do begin
		writeln('DNI: ', l^.dato.dni, 'Nombre:', l^.nombre, 'Apellido:', l^.apellido); // --> Error 7 y 8 
		l:= l^.sig;
	end;
end;

{ programa principal }
var
	l:lista;
begin
	generarLista(l); // --> Error 9
	imprimirInformacion(l);
end.

{ERRORES:}
// 1) linea 16 - var p : persona
// 2) linea 26 - var l : lista
// 3) linea 30 - falta hacer el new(aux)
// 4) linea 38 - p tiene que ser de tipo persona, no nodo
// 5) linea 42 - falta leer la siguiente persona
// 6) linea 46 - l no hay que pasarla por referencia, porque no se debe modificar
// 7) linea 49 - l^.nombre es incorrecto, deberia ser l^.dato.nombre
// 8) linea 49 - l^.apellido es incorrecto, deberia ser l^.dato.apellido
// 9) linea 58 - Falta incializar l := nil

