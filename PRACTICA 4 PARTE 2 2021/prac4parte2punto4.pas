{Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:

a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.

b. Un módulo que reciba un alumno y lo inserte en el vector.

c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.

d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector

e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.

Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con
datos leídos de teclado.}

program prac4parte2punto4;
const
	dimF = 1000;
type
	alumno = record;
		nro : integer;
		nombre : string;
		apellido : string;
		asistencias : integer;
	end;
	vector = array[1..dimF] of alumno;

//inciso a
function buscarnro (v :vector; dimL : integer; num : integer) : integer;
var
	pos : integer;
begin
	pos := 1;
	while ((dimL <= dimF) and (num < v[pos])) do
		pos := pos + 1;
	if dimL <= dimF and num = v[pos] then 
		buscarnro := pos;
	else
		buscarnro := -1; //no se encontro
end;

//inciso b
procedure insertar (var v : vector; var dimL : integer; a : alumno; pos : integer);
var
	i :integer;
begin
	if ((dimL < dimF) and (pos >= 1) and (pos <= dimL)) then begin
		for i := dimL downto pos do
			v[i+1] := v[i];
		v[pos] := a;
		dimL := dimL + 1;
	end;
end;

//inciso c
procedure eliminar (var v : vector; var dimL : integer; pos : integer);
var
	i : integer;
begin
	if pos >= 1 and pos <= dimL then begin
		for i := pos to dimL - 1 do
			a[i] := a[i+1];
		dimL := dimL - 1;
	end;
end;

//inciso d
procedure eliminaralumno (var v : vector; var dimL : integer; nro : integer);
var
	i,posAlumno : integer;
begin
	posAlumno := busquedanro(v,dimL,nro);
	if posAlumno <> - 1 then
		if posAlumno >= 1 and posAlumno <= dimL then
			for i := posAlumno to dimL - 1 do
				a[i] := a[i+1];
			dimL := dimL - 1;
	else
		writeln('El alumno no se encontraba en el vector');
end;

//inciso e
procedure asistencias0 (var v : vector; var dimL : integer);
var
	i,eliminador : integer;
begin
	eliminados := 0;
	for i := 1 to dimL do begin
		if (v[i].asitencias = 0) then begin
			eliminar(v,dimL,i-eliminados);
			eliminados := eliminados + 1;
		end;
	end;
end;

var
	v : vector;
	dimL,pos,posAlumno,num : integer;
	a : alumno;
BEGIN
	dimL := 0;
	cargar(v,dimL); // se dispone
	{inciso a}
	readln(num);
	posAlumno := busquedanro(v,dimL,num);
	{inciso b}
	leer(a); // se dispone
	readln(pos);
	insertar(v,dimL,a,pos);
	{inciso c}
	readln(pos);
	eliminar(v,dimL,pos);
	{inciso d}
	readln(num)
	eliminaralumno(v,dimL,num);
	{inciso e}
	asistencias0(v,dimL);
	
END.

