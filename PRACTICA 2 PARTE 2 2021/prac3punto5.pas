program prac3punto5a;

function parEncontrado (a : integer; b : integer) : boolean;
begin
	parEncontrado := ((a = 0) and (b = 0));
end;

function esDoble (a : integer; b : integer) : boolean;
begin
	esDoble := ((a*2) = b);
end;

var 
	cant,dobles,a,b : integer;
BEGIN
	cant := 0; dobles := 0;
	writeln('Ingresar a y b');
	read(a); read(b);
	while (not parEncontrado(a,b)) do begin
		if (esDoble(a,b)) then
			dobles := dobles + 1;
		cant := cant + 1;
		writeln('Ingresar a y b');
		read(a); read(b);
	end;
	writeln('Se leyeron ',cant,' pares, y ',dobles,' eran pares');
END.

