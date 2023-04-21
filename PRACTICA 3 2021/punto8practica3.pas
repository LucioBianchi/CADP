program punto8practica3;

type

	docente = record
		dni : integer;
		nombre : string;
		apellido : string;
		mail : string;
	end;
	
	proyecto = record
		codigo : integer;
		titulo : string;
		coordinador : docente;
		alumnos : integer;
		escuela: string;
		localidad: string;
	end;

procedure leerDocente (var d : docente);
begin
	writeln('Ingresar DNI , nombre, apellido y mail del docente a cargo');
	readln(d.dni);
	readln(d.nombre);
	readln(d.apellido);
	readln(d.mail);
end;

procedure leerProyecto(var p : proyecto);
begin
	writeln('Ingresar codigo, titulo, cantidad de alumnos , escuela, localidad y coordinador del proyecto');
	readln(p.codigo);
	if p.codigo <> -1 then begin
		readln(p.titulo);
		readln(p.alumnos);
		readln(p.escuela);
		readln(p.localidad);
		leerDocente(p.coordinador);
	end;
end;

procedure maxParticipantes (participantes : integer; var max: integer);
begin
	if participantes > max then max := participantes;
end;

procedure maxEscuelas (nombre : string ; participantes : integer; var max1,max2 : integer; var maxEsc1,maxEsc2 : string );
begin
	if participantes > max1 then begin
		maxEsc2 := maxEsc1;
		max2 := max1;
		maxEsc1 := nombre;
		max1 := participantes;
	end
	else if participantes > max2 then begin
		maxEsc2 := nombre;
		max2 := participantes;
	end;
end;

function cantDigitos (num : integer) : boolean;
var
	pares, impares, dig : integer;
begin
	pares := 0;
	impares := 0;
	while (num > 0) do begin
		dig := num MOD 10;
		if (dig MOD 2 = 0) then pares := pares + 1
		else impares := impares + 1;
		num := num DIV 10;
	end;
	cantDigitos := (pares = impares);
end;

function esDaireaux(localidad : string; codigo : integer): boolean;
begin
	esDaireaux :=  ((localidad = 'Daireaux') and (cantDigitos(codigo))); 
end;

var
	p : proyecto;
	max,max1,max2,cantLocalidad,cantTotal : integer;
	escActual,locActual,maxEsc1,maxEsc2 : string;
BEGIN
	max1 := -1;
	max2 := -1;
	maxEsc1 := '---';
	maxEsc2 := '---';
	
	leerProyecto(p);
	cantTotal := 0;
	while p.codigo <> - 1 do begin
		locActual := p.localidad;
		cantLocalidad := 0;
		while (p.codigo <> -1) and (locActual = p.localidad) do begin
			max := -1;
			escActual := p.escuela;
			cantTotal := cantTotal + 1;
			cantLocalidad := cantLocalidad + 1;
			while (p.codigo <> - 1) and (escActual = p.escuela) do begin
				if esDaireaux(p.localidad,p.codigo) then
					writeln('Titulo: ',p.titulo);
				maxParticipantes(p.alumnos,max);
				leerProyecto(p);
			end;
			maxEscuelas(p.escuela,max,max1,max2,maxEsc1,maxEsc2);
		end;
		writeln('Cantidad de escuelas en ',locActual,': ',cantLocalidad);
	end;
	writeln();
	writeln('----RESULTADOS OBTENIDOS----');
	writeln('Cantidad total de escuelas: ',cantTotal);
	writeln('Nombres de las 2 escuelas con mayor cantidad de participantes: ',maxEsc1,' y ',maxEsc2);
	
END.

