{15. La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con todos
los alumnos que cursaron EPA. De cada alumno se conoce su DNI, apellido, nombre y la nota obtenida. Escribir
un programa que procese la información de alumnos disponible y los distribuya en turnos utilizando los
siguientes criterios:

- Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
- Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.

Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribución de alumnos debe ser lo más equitativa posible.
}


program punto15prac6;
type
	rango = 1..10;
	alumno = record
		dni : integer;
		apellido : string;
		nombre : string;
		nota : rango;
	lista : ^nodo; // -> Se dispone
	nodo = record
		dato : alumno;
		sig : lista;
	vector = array[1..5] of lista;
	vCant = array[1..5] of integer;

procedure agregar (var pri : lista; aux : lista);
begin
	aux^.sig := pri;
	pri := aux;
end;

function condicionA (nota : rango) : boolean;
begin
	condicionA := nota >= 8;
end;

function condicionB (nota : rango) : boolean;
begin
	condicionB := ((nota >= 5)and(nota < 8));
end;

procedure inicializarv (var v: vector);
var
	i : integer;
begin
	for i := 1 to 5
		v[i] := nil;
end;

procedure inicializarvCant (var v : vCant);
var
	i : integer;
begin
	for i := 1 to 5 do
		v[i] := 0;
end;

procedure contarTurno (var v : vCant; turno : integer);
begin
	v[turno] := v[turno] + 1;
end;

procedure imprimirAlumno(a : alumno);
begin
	write('DNI: ',a.dni);
	write('NOMBRE: ',a.nombre);
	write('APELLIDO: ',a.apellido);
	write('NOTA: ',a.nota);
end;
procedure imprimirLista(pri : lista);
begin
	while pri <> nil do begin
		imprimirAlumno(pri^.dato);
		writeln('-------------');
		pri := pri^.sig;
	end;
end;

procedure imprimirTurnos (vP : vector);
var
	i : integer;
begin
	for i := 1 to 5 do begin
		writeln('TURNO ',i,': ');
		imprimirLista(vP[i]);
	end;
end;

var
	pri,aux : lista;
	vP : vector;
	vC : vCant;
BEGIN
	pri := nil;
	cargar(pri); // -> Se dispone
	inicializarv(vP);
	inicializarvCant(vC);
	aux := pri;
	while aux <> nil do begin
			if condicionA(aux^.dato.nota) then begin
				if vC[1] <= vC[4] then begin
					contarTurno(vC,1);
					agregar(vP[1],aux);
				end	
				else begin
					contarTurno(vC,4);
					agregar(vP[4],aux);
				end;
			end
			else if condicionB(aux^.dato.nota) then begin
				if vC[2] <= vC[3] then begin
					contarTurno(vC,2);
					agregar(vP[2],aux);
				end
				else if vC[5] <= vC[3] then begin
					contarTurno(vC,5);
					agregar(vP[5],aux);
				end
				else begin
					contarTurno(vC,3);
					agregar(vP[3],aux);
				end;
			end;
			aux := aux^.sig;
	end;
	imprimirTurnos(vP);
END.

