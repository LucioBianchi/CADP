program punto2ejerciciosadicionales3;

type
	str30 = string[30];
	planta = record
		nombre : str30;
		tiempoVida : integer;
		tipo : str30;
		clima : str30;
		pais : str30;
	end;

procedure leerPlanta (var p : planta);
begin
		writeln('Ingresar nombre cientifico de la especie'); readln(p.nombre);
		writeln('Ingresar tiempo de vida promedio en meses'); readln(p.tiempoVida);
		writeln('Ingresar tipo de especie'); readln(p.tipo);
		writeln('Ingresar clima'); readln(p.clima);
end;

procedure menorCantTipo (cant : integer ; tipo : str30 ; var min : integer ; var menorTipo : str30);
begin
	if cant < min then begin
		min := cant;
		menorTipo := tipo;
	end;
end;	

function calcPromedio (tiempoVida,cantTipo : integer) : real;
begin
	calcPromedio := tiempoVida / cantTipo;
end;

function esArgentina(pais,clima : str30) : boolean;
begin
	esArgentina := ((pais = 'Argentina') and (clima = 'subtropical'));
end;

procedure maxPaises (cant : integer; nombre : str30; var max : integer; var maxNombre : str30);
begin
	if cant > max then begin
		maxNombre := nombre;
	end;
end;

procedure masLongevas (tiempoVida : integer; nombre : str30; var max1,max2 : integer; var maxLong1,maxLong2 : str30);
begin
	if tiempoVida > max1 then begin
		maxLong2 := maxLong1;
		max2 := max1;
		maxLong1 := nombre;
		max1 := tiempoVida;
	end
	else if tiempoVida > max2 then begin
		maxLong2 := nombre;
		max2 := tiempoVida;
	end;
end;			
	
var
	p : planta;
	i,cantTipo,cantPaises,max1,max2,min,max,tiempoVidaTipo :integer;
	tiempoPromedio : real;
	tipoActual,maxNombre,maxLong1,maxLong2,menorTipo : str30;
BEGIN
	
	max := -1;
	max1 := -1;
	max2 := -1;
	min := 32767;
	maxNombre := '---';
	maxLong1 := '---';
	maxLong2 := '---';
	menorTipo := '---';
	
	leerPlanta(p);
	i := 0;
	while (i <= 320) do begin
		tipoActual := p.tipo;
		cantTipo := 0;
		tiempoVidaTipo := 0;
		while ((tipoActual = p.tipo) and (i <= 320)) do begin
			i := i + 1;
			cantTipo := cantTipo + 1;
			tiempoVidaTipo := tiempoVidaTipo + p.tiempoVida;
			cantPaises := 0;
			writeln('Ingresar pais/es donde se encuentra la planta');
			readln(p.pais);
			while (p.pais <> 'zzz') do begin
				cantPaises := cantPaises + 1;
				if esArgentina(p.pais,p.clima) then 
					writeln('La planta ',p.nombre,' se encuentra en un clima subtropical de Argentina');
				writeln('Ingresar pais/es donde se encuentra la planta');
				readln(p.pais);
			end;
			maxPaises(cantPaises,p.nombre,max,maxNombre);
			masLongevas(p.tiempoVida,p.nombre,max1,max2,maxLong1,maxLong2);
			leerPlanta(p);
		end;
		tiempoPromedio := calcPromedio(tiempoVidaTipo,cantTipo);
		writeln('El tiempo promedio de vida del tipo ',tipoActual,' es: ',tiempoPromedio:0:2);
		menorCantTipo(cantTipo,tipoActual,min,menorTipo);
	end;
	writeln('El tipo con la menor cantidad de plantas es: ',menorTipo);
	writeln('Nombres de las dos plantas mas longevas: ',maxLong1,maxLong2);
	writeln('La planta que se encuentra en mas paises es: ',maxNombre);
END.
