program punto3ejerciciosadicionales2;

// se podria definir un type codigo, pero no funciona en la lectura en pascal

procedure codigos(cod : integer; precio : real; var codmin1,codmin2 : integer; var pmin1,pmin2 : real);
begin
	if precio < pmin1 then begin
		codmin2 := codmin1;
		pmin2 := pmin1;
		codmin1 := cod;
		pmin1 := precio;
	end
	else if precio < pmin2 then begin
		pmin2 := precio;
		codmin2 := cod;
	end;
end;

function EsPar (cod : integer) : boolean;
begin
	EsPar := (cod MOD 2 = 0);
end;

procedure producto16(cod : integer; precio : real; var cant : integer);
begin
	if ((EsPar(cod)) and (precio > 16)) then cant := cant + 1;
end; 
var
	precio,pmin1,pmin2 : real;
	cod,codmin1,codmin2,cant,i : integer;
BEGIN
	cant := 0;
	codmin1 := -1;
	codmin2 := -1;
	pmin1 := 9999;
	pmin2 := 9999;
	for i := 1 to 4 do begin
		writeln('Ingresar codigo del producto');
		readln(cod);
		writeln('Ingresar precio del producto');
		readln(precio);
		codigos(cod,precio,codmin1,codmin2,pmin1,pmin2);
		producto16(cod,precio,cant);
	end;
	writeln('Codigos de los productos mas baratos: ',codmin1,' ',codmin2);
	writeln('Cantidad de productos con codigo par y precio > 16: ',cant);
		
END.

