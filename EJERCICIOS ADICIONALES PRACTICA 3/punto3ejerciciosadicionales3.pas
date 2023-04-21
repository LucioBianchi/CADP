program punto11ejericiosadicionales3;

//CORREGIR, SE LEE POR CODIGO DE AVION, DESPUES POR SALIDAS

type
	avion = record
		cod : integer;
		salida : string;
		llegada : string;
		km : real;
		ocupacion : real;
	end;

// Leer datos del registro avion
procedure leerAvion (var a : avion);
begin
	writeln('Ingresar codigo del avion');
	readln(a.cod);
	if a.cod <> 44 then begin
		writeln('Ingresar pais de Salida');
		readln(a.salida);
		writeln('Ingresar pais de Llegada');
		readln(a.llegada);
		writeln('Ingresar cantidad de km recorridos');
		readln(a.km);
		writeln('Ingresar porcentaje de ocupacion');
		readln(a.ocupacion);
	end;
end;

// Calcular vuelos de mas de 5000km que no alcanzaron 60% de ocupacion
procedure vuelos5k (km,ocupacion : real; var cant : integer);
begin
	if ((km > 5000) and (ocupacion < 60)) then cant := cant + 1;
end;		

// Calcular vuelos de mas de 10000km que llegaron a Australia o NZ
procedure vuelos10k (km : real; llegada : string; var cant : integer);
begin
	if ((km < 10000) and ((llegada = 'Australia') or (llegada = 'Nueva Zelanda'))) then
		cant := cant + 1;
end;

// Calcular si el avion es el qeu salio de mas paises
procedure maxCantSalidas (cod : integer; cantSalidas : integer; var maxCod, maxSalidas : integer);
begin
	if cantSalidas > maxSalidas then begin
		maxCod := cod;
		maxSalidas:= cantSalidas;
	end;
end;

// Calcular los 2 aviones que mas km recorrieron, y los 2 que menos
procedure maxKM (cod : integer; km : real; var max1,max2 : real; var maxAv1,maxAv2 : integer);
begin
	if km > max1 then begin
		maxAv2 := maxAv1;
		max2 := max1;
		maxAv1 := cod;
		max1 := km;
	end
	else if km > max2 then begin
		maxAv2 := cod;
		max2 := km;
	end;
end;

procedure minKM (cod : integer; km : real; var min1,min2 : real; var minAv1,minAv2 : integer);
begin
	if km < min1 then begin
		minAv2 := minAv1;
		min2 := min1;
		minAv1 := cod;
		min1 := km;
	end
	else if km < min2 then begin 
		minAv2 := cod;
		min2 := km;
	end;
end;

var
	a : avion;
	max1,max2,min1,min2,kmAvion : real;
	cant5k,cant10k,maxCod,maxSalidas,cantSalidas,maxAv1,maxAv2,minAv1,minAv2,codActual : integer;
	salidaActual : string;
BEGIN
	max1 := -1;
	max2 := -1;
	min1 := 32767;
	min2 := 32767;
	cant5k := 0;
	cant10k := 0;
	maxSalidas := -1;
	maxAv1 := -1;
	maxAv2 := -1;
	minAv1 := -1;
	minAv2 := -1;
	leerAvion(a);
	while (a.cod <> 44) do begin
		codActual := a.cod;
		kmAvion := 0;
		while ((a.cod <> 44) and (codActual = a.cod)) do begin
			kmAvion := kmAvion + a.km;
			salidaActual := a.salida;
			cantSalidas := 0;
			while ((a.cod <> 44) and (salidaActual = a.salida)) do begin // ---> Se puede hacer con if creo y es más eficiente
				cantSalidas := cantSalidas + 1;
				vuelos5k (a.km,a.ocupacion,cant5k);
				vuelos10k (a.km,a.llegada,cant10k);
				leerAvion(a);
			end;
		end;
		maxCantSalidas(a.cod,cantSalidas,maxCod,maxSalidas);
		maxKM (a.cod,kmAvion,max1,max2,maxAv1,maxAv2);
		minKM (a.cod,kmAvion,min1,min2,minAv1,minAv2);
	end;
	writeln('-----RESULTADOS OBTENIDOS-----');
	writeln('Los dos aviones que mas km recorrieron: ',maxAv1,' y ',maxAv2);
	writeln('Los dos aviones que menos km recorrieron: ',minAv1,' y ',minAv2);
	writeln('El avion que salio de mas paises diferentes: ',maxCod);
	writeln('Cantidad de vuelos de mas de 5000 km que no alcanzaron 60% de ocupacion: ',cant5k);
	writeln('Cantidad de vuelos de menos de 10000 km que llegaron a Australia o NZ : ',cant10k);
END.

//PSEUDOCODIGO
{ tengo vuelo (cod avion,paisSalida,paisLlegada,km,porcentajeOcupacion)
* 	LECTURA FINALIZA AL INGRESAR COD 44
* 	la info se ingresa ordenada por codigo de avion
* 		para cada avion por pais de salida
* 
*  -  Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
*  -  El avión que salió desde más países diferentes
*  -  La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión
*  -  La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.
*
* leer(a);
* while a.cod <> 44 do begin
* 	codActual := p.cod;
* 	cantKMdeesteAvion := 0;
* 	while codActual = p.cod do begin
* 		SalidaActual := p.salida;
* 		salidas := 0;
* 		cantKMdeesteAvion := cantKmdeesteAvion + a.KM
*	 	while SalidaActual = p.Salida  do begin
*			salidad := salidas + 1;
*	 		ifVueloesMasde5000 y no alcanzó 60% --- con un procedure y se le pasa una variable cant
*	 		ifVuelosMasde10000 y llega = Nueva Zeladanda o Australia ---> con un procedure y se la pasa una variable cant
*	 		leer(a)
*	 	end;
* 	end;
* 	calcularsi(cantKmdeesteAvion) es uno de los Aviones que recorrio mas o menos km
*	if salidad > maxSalidas ---> Calcular si es el que salio de mas paises
* end; 
* SE VA A INFORMAR TODO AL FINAL
* 
* }
