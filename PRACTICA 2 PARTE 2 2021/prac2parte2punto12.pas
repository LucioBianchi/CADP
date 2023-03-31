program prac2parte2punto11;

// Boolean A
function esVocal(c : char) : boolean;
begin
	esVocal := (c = 'a')or(c = 'e')or(c = 'i')or(c = 'o')or(c = 'u');
end;
// Se cumple A
procedure secuenciaA (var ok : boolean); // Podría ser una función
var
	c : char;
begin
	writeln('Ingresar secuencia');
	readln(c);
	while ((c <> '$') and esVocal(c)) do readln(c);
	ok := (c = '$');
end;
// Boolean B
function esLetra (c : char) : boolean;
begin
	esLetra := (((c >= 'b') and (c <= 'd')) or ((c >= 'f') and (c <= 'h')) or ((c >= 'j') and (c <= 'n')) or ((c >= 'p') and (c <= 't')) or ((c >= 'v') and (c <= 'z')));
end;
// Se cumple B
procedure secuenciaB(var ok : boolean);
var
	c : char;
begin
	writeln('Ingresar secuencia');
	readln(c);
	while ((c <> '#') and esLetra(c))do readln(c);
	ok := (c = '#');
end;

var 
	ok : boolean;
BEGIN
	ok := True;
	secuenciaA(ok);
	if ok then begin
		secuenciaB(ok);
		if ok then writeln('Se cumplio correctamente la secuencia')
		else writeln('No se cumplio la secuencia B');
	end
	else writeln('No se cumplio la secuencia A');
END.
