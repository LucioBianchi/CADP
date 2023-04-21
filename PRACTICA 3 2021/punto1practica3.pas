rogram Registros;
type
	str20 = string[20];
	alumno = record
		codigo : integer;
		nombre : str20;
		promedio : real;
	end;

procedure leer(var alu : alumno);
begin
	writeln('Ingrese el codigo del alumno');
	readln(alu.codigo);
	if (alu.codigo <> 0) then begin
		writeln('Ingrese el nombre del alumno'); readln(alu.nombre);
		writeln('Ingrese el promedio del alumno'); readln(alu.promedio);
	end;
end;

function mejorPromedio (promedio : real; maxprom : real) : boolean;
begin
	mejorPromedio := (promedio > maxprom);
end;

{ declaración de variables del programa principal }
var
	a : alumno;
	cant : integer;
	maxprom : real;
	maxalu : str20;
	
{ cuerpo del programa principal }
begin
	maxalu := '---';
	maxprom := -1;
	cant := 0;
	leer(a);
	while (a.codigo <> 0) do begin
		cant := cant + 1;
		if (mejorPromedio(a.promedio, maxprom)) then begin
			maxprom := a.promedio;
			maxalu := a.nombre;
		end;
		leer(a);
	end;
	writeln('El alumno con mejor promedio es: ',maxalu);
	
end.

