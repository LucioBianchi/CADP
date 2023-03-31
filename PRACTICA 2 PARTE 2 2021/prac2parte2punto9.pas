program prac2parte2punto9;

// Debe retornar 2 resultados --> procedure

procedure secuencia(num : integer; var sum,cant : integer);  //INICIALIZAR A 0 SUM Y CANT

begin
	while (num <> 0) do begin
		cant := cant + 1;
		sum := sum + num MOD 10;
		num := num DIV 10;
	end;
end;

var
	num,sum,cant : integer;
BEGIN
	cant := 0;
	repeat
		writeln('Ingresar un numero');
		readln(num);
		sum := 0;
		secuencia(num,sum,cant);
	until (sum = 10);
	writeln('Cantidad de digitos leidos: ',cant);
END.

