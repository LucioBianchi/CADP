{9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}

program punto9practica4;

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

procedure leer (var a : alumno); // ----> Se lee solo si a.dni <> -1
begin
	writeln('Ingresar DNI: ');
	readln(a.dni);
	if a.dni <> -1 then begin
		writeln('Ingresar nro de inscripcion: ');
		readln(a.num);
		writeln('Ingresar nombre: ');
		readln(a.nombre);
		writeln('Ingresar apellido: ');
		readln(a.apellido);
		writeln('Ingresar anio de nacimiento: ');
		readln(a.anio);
	end;
end;

procedure cargar (var v : vector; var dL : integer); //----> No siempre se carga todo el vector, asi que se calcula dL
var
	alu : alumno;
begin
	dL := 0;
	writeln('--- ALUMNO ',dL + 1,' ---');
	leer(alu);
	while ((alu.dni <> - 1) and (dL < dF)) do begin
		dL := dL + 1;
		v[dL] := alu;
		writeln('--- ALUMNO ',dL + 1,' ---');
		leer(alu);
	end;
end;

function porcentaje (cant,dL : integer) : real; //----> Se le agregó el parametro dL
begin
	porcentaje := (cant / dL) * 100;
end;

//Se puede mejorar
function esPar (num : integer) : boolean;
var
	paridad : boolean;
begin
	paridad := true;
	while ((num <> 0) and (paridad)) do begin
		paridad := (num MOD 2) = 0); // --> No es necesario hacer num MOD 10, la paridad siempre depende del ultimo digito
		num := num DIV 10;
	end;
	esPar := paridad;
end;

procedure contarDNIPar (dni : integer; var cantPar : integer);
begin
	if esPar(dni) then cantPar := cantPar + 1;
end;
	
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
	i,min1,min2,cantPar,dL : integer;
	nombre1,nombre2,apellido1,apellido2 : string;
BEGIN
	dL := 0;
	min1 := 9999;
	min2 := 9999;
	cantPar := 0;
	nombre1 := '---';	apellido1 := '---';
	nombre2 := '---'; 	apellido2 := '---';
	cargar(valumnos,dL);
	for i := 1 to dL do begin
		contarDNIPAR(valumnos[i].dni,cantPar);
		MaxEdades(valumnos[i].anio,valumnos[i].nombre,valumnos[i].apellido,min1,min2,nombre1,nombre2,apellido1,apellido2);
	end;
	writeln('----RESULTADOS OBTENIDOS----');
	writeln('Porcentaje de alumnos con DNI compuesto solo por digitos pares: ',porcentaje(cantPar,dL):0:2);
	writeln('----------------------------');
	writeln('Los dos alumnos de mayor edad: ');
	writeln('ALUMNO 1: ',nombre1,' ',apellido1);
	writeln('ALUMNO 2: ',nombre2,' ',apellido2)
END.
