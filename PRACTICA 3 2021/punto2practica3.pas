rogram punto2practica3;

type

	// Esto no tiene mucho sentido porque pascal no distingue subrangos en lectura;
	dias = 1..31;
	meses = 1..12;
	anios = 1900..2021;

	fecha = record
		dia : dias;
		mes : meses;
		anio : anios;sin título
	end;
	
procedure leerFecha (var a: fecha);
begin
	writeln('Anio del casamiento: ');
	readln(a.anio);
	if (a.anio = 2017) then begin
		writeln('Mes del casamiento: ');
		readln(a.mes);
		writeln('Dia del casamiento: ');
		readln(a.dia);
	end;
end;

procedure casamientosVerano (mes : meses; var cantVe : integer);
begin
	if ((mes = 1) or (mes = 2) or (mes = 3)) then cantVe := cantVe + 1;
end;	
	
procedure casamientosDiez (dia : dias; var cant10 : integer);
begin
	if (dia <= 10) then cant10 := cant10 + 1;
end;

var
	cas : fecha;
	cantVe,cant10 : integer;
BEGIN
	cantVe := 0;
	cant10 := 0;
	leerFecha(cas);
	while (cas.anio = 2017) do begin
		casamientosVerano(cas.mes,cantVe);
		casamientosDiez(cas.dia,cant10);
		leerFecha(cas);
	end;
	writeln('Cantidad de casamientos en el verano de 2017: ',cantVe);
	writeln('Cantidad de casamientos en los primeros 10 dias del mes: ',cant10);
END.
