program prac2parte2punto6;

procedure codigos (cod : integer; precio : real; var mincod1,mincod2 : integer; var minprecio1,minprecio2 : real);  //INCIALIZAR ESTAS VARIABLES
begin
	if (precio < minprecio1) then begin
		minprecio2 := minprecio1;
		mincod2 := mincod1;
		minprecio1 := precio;
		mincod1 := cod;
	end
	else if (precio < minprecio2) then begin
		minprecio2 := precio;
		mincod2 := cod;
	end;
end;

procedure pantalon (cod : integer; precio : real;  var codp : integer; var preciop : real);
begin
	if (precio > preciop) then begin
		preciop := precio;
		codp := cod;
	end;
end;

var 
	cod,mincod1,mincod2,codp,i : integer;
	precio,minprecio1,minprecio2,preciop,prom : real;
	tipo : char;
BEGIN
// No es necesario inicializar los códigos
	mincod1 := 0;
	mincod2 := 0;
	codp := 0;
	minprecio1 := 9999;
	minprecio2 := 9999;
	preciop := -9999;
	prom := 0;
	for i := 1 to 100 do
	begin
		writeln('Ingresar precio, codigo y tipo del producto');
		readln(precio); readln(cod); readln(tipo);
		codigos(cod,precio,mincod1,mincod2,minprecio1,minprecio2);
		if (tipo = 'p') then pantalon(cod,precio,codp,preciop);
		prom := prom + precio;
	end;
	prom := prom / 100;
	writeln('Codigos de los 2 productos mas baratos: ',mincod1,' ',mincod2);
	writeln('Codigo del pantalon mas caro: ',codp);
	writeln('Precio promedio: ',prom);
	
	
END.

