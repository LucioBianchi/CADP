program prac2parte2punto13;

{procedure cumpleA(c : char; var ok : boolean; var cant : integer);
begin
	ok := (c <> '$');
	cant := cant + 1;
end;}

procedure secuenciaA (var ok : boolean; var cant : integer);
var
	c : char;
begin
	writeln('Ingresar secuencia');
	readln(c);
	while ((c <> '%') and ok) do begin
		if (c = '$') then ok := false
		else 
			readln(c);
			cant := cant + 1;
	end;
end;

function esArroba (c : char) : boolean;
begin
	esArroba := (c = '@');
end;

procedure secuenciaB (var ok : boolean; cant : integer);
var
	c : char; 
	arrobas,cantidad : integer;
begin
	arrobas := 0;
	cantidad := 0;
	writeln('Ingresar secuencia');
	readln(c);
	while(c <> '*') do begin
		cantidad := cantidad + 1;
		if (esArroba(c)) then arrobas := arrobas + 1;
		readln(c);
	end;
	if ((arrobas = 3) or (cantidad <> cant)) then ok := False;
end;

var 
	ok : boolean;
	cant : integer;
BEGIN
	ok := true;
	cant := 0;
	secuenciaA(ok,cant);
	if ok then begin
		secuenciaB(ok,cant);
		if ok then writeln('Se cumple la secuencia correctamente')
		else writeln('No se cumple secuencia B');
	end
	else writeln('No se cumple secuencia A');
END.
