{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el
promedio obtenido durante toda su carrera.
Implementar un programa que:

a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.

b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados
que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado (de mayor
a menor)}

program punto11prac6;
type
	nota = 1..10;
	alumno = record
		num : integer;
		apellido : string;
		promedio : nota;
	end;
	lista = ^nodo;
	nodo = record
		dato : alumno;
		sig : lista;
	end;

{MODULOS INCISO A}

procedure leer(var a : alumno);
begin
	write('Ingresar nro de alumno: ');
	readln(a.num);
	if a.num <> 0 then begin
		write('Ingresar apellido: ');
		readln(a.apellido);
		write('Ingresar promedio: ');
		readln(a.promedio);
	end;
end;

{Inserta ordenado de forma descendente}
procedure insertarOrdenado (var pri : lista; a : alumno);
var
	nuevo,ant,act : lista;
begin
	new(nuevo);
	nuevo^.dato := a;
	act := pri;
	ant := pri;
	{Recorro mientras no se termine al lista y no haya encontrado la posicion correcta}
	while ((act <> nil) and (act^.dato.promedio > a.promedio)) do begin
		ant := act;
		act := act^.sig;
	end;
	{Si es el primer elemento}
	if ant = act then pri := nuevo
	{Si es uno del medio o el ultimo}
	else ant^.sig := nuevo;
	nuevo^.sig := act;
end;

procedure cargarLista (var pri : lista);
var
	a :  alumno;
begin
	writeln('INGRESAR ALUMNO');
	leer(a);
	while a.num <> 0 do begin
		insertarOrdenado(pri,a);
		writeln('INGRESAR ALUMNO');
		leer(a);
	end;
end;

{MODULO INCISO B}

procedure imprimirLista (pri : lista);
var
	cant : integer;
begin
	cant := 0;
	while ((pri <> nil) and (cant <= 10)) do begin
		cant := cant + 1;
		writeln('ALUMNO N: ',cant);
		writeln(pri^.dato.apellido);
		writeln(pri^.dato.num);
		pri := pri^.sig;
	end;
end;

var
	pri : lista;
BEGIN
	cargarLista(pri);
	imprimirLista(pri);
END.
