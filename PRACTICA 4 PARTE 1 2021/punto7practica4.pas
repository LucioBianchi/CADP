{7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:

a. la cantidad de ocurrencias de cada dígito procesado.	

b. el dígito más leído.

c. los dígitos que no tuvieron ocurrencias.}

program punto7practica4;

type
	rango = 0..9;
	vector = array [rango] of integer; 

procedure inicializar (var v : vector);
var
	i : integer;
begin
	for i := 0 to 9 do begin
		v[i] := 0;
	end;
end;

procedure descomponer (var v : vector; num : integer);
var
	digito : rango;
begin
	while num <> 0 do begin
		digito := (num MOD 10);
		v[digito] := v[digito] + 1;
		num := num DIV 10;
	end;
end;

procedure cumple1y2 (v : vector; var max : integer);
var
	i : integer;
begin
	for i := 0 to 9 do begin
		if v[i] > max then
			max := i;
		if v[i] = 0 then
			write(i,' ');
	end;
end;

var
	vnum : vector;
	max,num : integer;
BEGIN
	max := -1;
	inicializar(vnum);
	read(num);
	while num <> -1 do begin
		descomponer(vnum,num);
		read(num);
	end;
	write('Los digitos que no tuvieron occurrencias fueron: ');
	cumple1y2(vnum,max);
	writeln(' ');
	writeln('El numero ',max,' fue el mas leido');
END.

