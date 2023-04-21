{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

program punto8practica4;

const
	df = 400;
type
	alumno = record
		num : integer;
		dni : integer;
		apellido : string;
		nombre : string;
		anio : integer;
	end;
	
	vector = array [1..dF] of alumno;

procedure leer (var a : alumno);
begin
	writeln('Ingresar nro de inscripcion: ');
	readln(a.num);
	writeln('Ingresar DNI: ');
	readln(a.dni);
	writeln('Ingresar nombre: ');
	readln(a.nombre);
	writeln('Ingresar apellido: ');
	readln(a.apellido);
	writeln('Ingresar anio de nacimiento: ');
	readln(a.anio);
end;

procedure cargar (var v : vector);
var
	i : integer;
begin
	for i := 1 to dF do begin
		writeln('--- ALUMNO ',i,' ---');
		leer(v[i]);
	end;
end;

function porcentaje (cant : integer) : real;
begin
	porcentaje := (cant / dF) * 100;
end;

function esPar (num : integer) : boolean;
var
	paridad : boolean;
begin
	paridad := true;
	while ((num <> 0) and (paridad)) do begin
		paridad := (num MOD 2 = 0); // --> no es necesario hacer el MOD 10
		num := num DIV 10;
	end;
	esPar := paridad;
end;

// FORMA MAS EFICIENTE
{	while ((num <> 0) and (num MOD 2 = 0)) do
* 		num := num DIV 10;
*	esPar := (num = 0);
* }

procedure contarDNIPar (dni : integer; var cantPar : integer);
begin
	if esPar(dni) then cantPar := cantPar + 1;
end;

// Podria pasar el registro alumnos directamente
procedure MaxEdades (anio : integer; nombre,apellido : string; var min1,min2 : integer; var nombre1,nombre2,apellido1,apellido2 : string);
begin
	if anio < min1 then begin
		min2 := min1;
		nombre2 := nombre1;
		apellido2 := apellido1;
		min1 := anio;
		nombre1 := nombre;
		apellido1 := apellido;
	end
	else if anio < min2 then begin
		min2 := anio;
		nombre2 := nombre;
		apellido2 := apellido;
	end;
end;

var
	valumnos : vector;
	i,min1,min2,cantPar : integer;
	nombre1,nombre2,apellido1,apellido2 : string;
BEGIN
	min1 := 9999;
	min2 := 9999;
	cantPar := 0;
	nombre1 := '---';	apellido1 := '---';
	nombre2 := '---'; 	apellido2 := '---';
	cargar(valumnos);
	for i := 1 to dF do begin
		contarDNIPAR(valumnos[i].dni,cantPar);
		MaxEdades(valumnos[i].anio,valumnos[i].nombre,valumnos[i].apellido,min1,min2,nombre1,nombre2,apellido1,apellido2);
	end;
	writeln('----RESULTADOS OBTENIDOS----');
	writeln('Porcentaje de alumnos con DNI compuesto solo por digitos pares: ',porcentaje(cantPar):0:2);
	writeln('----------------------------');
	writeln('Los dos alumnos de mayor edad: ');
	writeln('ALUMNO 1: ',nombre1,' ',apellido1);
	writeln('ALUMNO 2: ',nombre2,' ',apellido2)
END.
