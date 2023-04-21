program punto7practica3;

// El punto donde se imprime cantidad de centros puede estar mal

type
	centro = record
		nombre : string;
		universidad: string;
		investigadores : integer;
		becarios : integer;
	end;

function mismaUniversidad (anterior,nueva : string) : boolean;
begin
	mismaUniversidad := (anterior = nueva);
end;

procedure maxInvestigadores (uni : string; investigadores : integer; var maxInv : integer; var maxUni : string);
begin
	if investigadores > maxInv then begin
		maxInv := investigadores;
		maxUni := uni;
	end;
end;

procedure maxBecarios (centro : string; becarios : integer; var maxBec1,maxBec2 : integer; maxCentro1,maxCentro2 : string);
begin
	if becarios > maxBec1 then begin
		maxBec2 := maxBec1;
		maxCentro2 := maxCentro1;
		maxBec1 := becarios;
		maxCentro1 := centro;
	end
	else if becarios > maxBec2 then begin
		maxBec2 := becarios;
		maxCentro2 := centro;
	end;
end;

procedure Leer (var c : centro);
begin
	writeln('Cantidad de investigadores, nombre, universidades y cantidad de becarios del centro');
	readln(c.investigadores);
	if c.investigadores <> 0 then begin
		readln(c.nombre);
		readln(c.universidad);
		readln(c.becarios);
	end;
end;

var
	c : centro;
	maxBec1,maxBec2,maxInv,cantCentros : integer;
	maxCentro1,maxCentro2,maxUni,anterior : string;
BEGIN
	maxBec1 := -1;
	maxBec2 := -1;
	maxInv := -1;
	cantCentros := 0;
	maxCentro1 := '---';
	maxCentro2 := '---';
	maxUni := '---';
	leer(c);
	anterior := c.universidad;
	while (c.investigadores <> 0) do begin
		if mismaUniversidad(anterior,c.universidad) then
			cantCentros := cantCentros + 1
		else begin
			writeln();
			writeln('Cantidad de centros de ',anterior,' es :',cantCentros);
			writeln();
			cantCentros := 1;
			anterior := c.universidad;
		end;
		maxInvestigadores(c.universidad,c.investigadores,maxInv,maxUni);
		maxBecarios(c.nombre,c.becarios,maxBec1,maxBec2,maxCentro1,maxCentro2);
		leer(c);
	end;
	writeln('Univeridad con max investigadores: ',maxUni);
	writeln('Centros con mas becarios: ',maxCentro1,' ',maxCentro2);
	
END.

