program punto5practica3;

// Hay que reescribirlo con corte de control
// Ya escribir pseudocodigo abajo

type
	auto = record
		precio : real;
		marca : string;
		modelo : string;
	end;

procedure leerAuto (var a : auto);
begin
	writeln('Ingresar marca, modelo y precio del auto');
	readln(a.marca);
	if (a.marca <> 'ZZZ') then begin
		readln(a.modelo);
		readln(a.precio);
	end;
end;

function mismaMarca (nuevaMarca : string; var marca : string ): boolean;
begin
	mismaMarca := (nuevaMarca = marca);
end;

//Intentar que imprima fuera del procedimiento
procedure promedio (var cant : integer; var prom : real; precio : real; nuevaMarca : string; var marca : string);
begin
	if (cant = 0) then begin
		marca := nuevaMarca;
		cant := 1;
		prom := precio;
	end
	else begin
		if (mismaMarca(nuevaMarca,marca)) then begin
			prom := prom + precio;
			cant := cant + 1;
		end
		else begin 
			writeln('El precio promedio de ',marca,' es: ',(prom / cant):0:2);
			cant := 1;
			marca := nuevaMarca;
			prom := precio;
		end;
	end;
end;

procedure masCaro (a : auto; var max : real; var maxMarca,maxModelo : string);
begin
	if a.precio > max then begin
		maxMarca := a.marca;
		maxModelo := a.modelo;
		max := a.precio;
	end;
end;

var
	maxMarca, maxModelo, marca : string;
	cant : integer;
	prom, preciomax : real;
	a: auto;
BEGIN
	cant := 0;
	preciomax := -1;
	leerAuto(a);
	while (a.marca <> 'ZZZ') do begin
		promedio(cant,prom,a.precio,a.marca,marca);
		masCaro(a,preciomax,maxMarca,maxModelo);
		leerAuto(a);
	end;
	writeln('La marca y el modelo del auto mas caro es: ',maxMarca,' - ',maxModelo);
	
END.

{
* while a.marca <> ZZZ do begin
* 	marcaActual := a.marca;
* 	cantMarca := 0
* 	precioMarca := 0;
*	while (a.marca <> ZZZ and marcaActual <> a.marca) do begin
* 		cantMarca := cantMarca + 1;
* 		precioMarca := precioMarca + a.precio;
* 		masCaro(.....);
* 		leer(a)
* 	end;
* 	writeln('El promedio de ',marcaActual,' es: ' calcPromedio(precioMarca,cantMarca));
* 	....
* 
* }
