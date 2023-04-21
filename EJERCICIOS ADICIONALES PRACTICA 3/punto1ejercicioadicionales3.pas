program punto1ejercadicionales3;

type
	candidato = record
		localidad : string;
		apellido : string;
		cantVotos : integer;
		locVotantes : integer;
	end;

procedure leerCandidato (var c : candidato);
begin
	writeln('Ingresar localidad, apellido, cantidad de votos obtenidos y cantidad de votantes de la localidad');
	readln(c.localidad);
	if c.localidad <> 'Zarate' then begin
		readln(c.apellido);
		readln(c.cantVotos);
		readln(c.locVotantes);
	end;
end;

procedure masVotos (votos : integer; apellido : string; var max : integer; var ganador : string);
begin
	if votos > max then begin
		max := votos;
		ganador := apellido;
	end;
end;

procedure masPorcentaje (votos,votantes : integer; apellido : string; var maxPorcentaje : real; var ganador : string);
var 
	porcentaje : real;
begin
	porcentaje := (votos / votantes) * 100;
	if porcentaje > maxPorcentaje then begin
		maxPorcentaje := porcentaje;
		ganador := apellido;
	end;
end;

var
	maxPorcentaje : real;
	max : integer;
	ganadorPorcentaje, ganadorVotos : string; 
	c : candidato;
BEGIN
	maxPorcentaje := 0;
	max := -1;
	ganadorPorcentaje := '---';
	ganadorVotos := '---';
	leerCandidato(c);
	while (c.localidad <> 'Zarate') do begin
		masVotos(c.cantVotos,c.apellido,max,ganadorVotos);
		masPorcentaje(c.cantVotos,c.locVotantes,c.apellido,maxPorcentaje,ganadorPorcentaje);
		leerCandidato(c);
	end;
	writeln(); writeln('----RESULTADOS OBTENIDOS----');
	writeln('El candidato con mas votos es: ',ganadorVotos);
	writeln('El candidato con mayor porcentaje del total de los votoes es: ',ganadorPorcentaje);
	
END.

