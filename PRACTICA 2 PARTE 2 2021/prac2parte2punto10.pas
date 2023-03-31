program prac2parte2punto10;

// Necesito devolver suma de pares y cant d digitos --> procedure

 procedure sumPares(num : integer; var suma,cant : integer);
var
	dig : integer;
begin
	dig := 0;
	while (num <> 0) do begin
		dig := num MOD 10;
		if (dig MOD 2 = 0) then
			suma := suma + dig
		else cant := cant + 1;;
		num := num DIV 10;
	end;
end;
var
	suma,cant : integer;
	num : LongInt;
BEGIN
	writeln('Ingresar un numero');
	readln(num);
	while (num <> 123456) do begin;
		cant := 0;
		suma := 0;
		sumPares(num,suma,cant);
		writeln('Suma de los digitos pares: ',suma);
		writeln('Cantidad de digitos impares: ',cant);
		writeln('Ingresar un numero');
		readln(num);
	end;
END.
