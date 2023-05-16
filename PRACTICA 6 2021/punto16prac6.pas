{16. La empresa distribuidora de una app móvil para corredores ha organizado una competencia mundial, en la
que corredores de todos los países participantes salen a correr en el mismo momento en distintos puntos del
planeta. La app registra, para cada corredor, el nombre y apellido, la distancia recorrida (en kilómetros), el
tiempo (en minutos) durante el que corrió, el país y la ciudad desde donde partió, y la ciudad donde finalizó su
recorrido. Realizar un programa que permita leer y almacenar toda la información registrada durante la
competencia. Una vez que se han almacenado todos los datos, informar:

o La cantidad total de corredores, la distancia total recorrida y el tiempo total de carrera de todos
los corredores.

o El nombre de la ciudad que convocó la mayor cantidad de corredores y la cantidad total de
  kilómetros recorridos por los corredores de esa ciudad.

o La distancia promedio recorrida por corredores de Brasil.

o La cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad.

o El paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston.}

program punto16prac6;
type
	corredor = record
		nombre : string;
		apellido : string;
		distancia : real;
		tiempo : integer;
		pais : string;
		ciudadP : string;
		ciudadF : string;
	end;
	lista = ^nodo;
	nodo = record
		dato : corredor;
		sig : lista;
	end;

{MODULOS PRINCIPALES}
procedure leer (var c : corredor);
begin
	write('Ingresar nombre: ');
	readln(c.nombre);
	if c.nombre <> 'NO' then begin
		write('Ingresar apellido: ');
		read(c.apellido);
		write('Ingresar distancia: ');
		readln(c.distancia);
		write('Ingresar tiempo: ');
		readln(c.tiempo);
		write('Ingresar pais: ');
		readln(c.pais);
		write('Ingresar ciudad de partida: ');
		readln(c.ciudadP);
		write('Ingresar ciudad de llegada: ');
		readln(c.ciudadF);
	end;
end;

procedure insertar (var pri : lista; c : corredor); //Inserta ordenado por pais y por ciudad
var
	nuevo,ant,act : lista;
begin
	new(nuevo);
	nuevo^.dato := c;
	nuevo^.sig := nil;
	act := pri;
	ant := pri;
	while ((act <> nil) and (act^.dato.pais <= c.pais) and (act^.dato.ciudadP <= c.ciudadP)) do begin
		ant := act;
		act := act^.sig;
	end;
	if ant = act then pri := nuevo
	else ant^.sig := nuevo;
	nuevo^.sig := act;
end;

procedure cargar (var pri : lista);
var
	c : corredor;
begin
	writeln('----INGRESAR CORREDOR----');
	leer(c);
	while c.nombre <> 'NO' do begin
		insertar(pri,c);
		writeln('----INGRESAR CORREDOR----');
		leer(c);
	end;
end;

{INCISO 2}
procedure calcularCiudad (ciudad: string; cant: integer; distancia: real; var ciudadMax: string; var cantMax: integer; var distanciaMax: real);
begin
	if cant > cantMax then begin
		ciudadMax := ciudad;
		distanciaMax := distancia;
		cantMax := cant;
	end;
end;

{INCISO 3}
function inciso3 (pais : string) : boolean;
begin
	inciso3 := (pais = 'BRASIL');
end;

{INCISO 4}
function inciso4 (ciudadP,ciudadF : string) : boolean;
begin
	inciso4 := (ciudadP <> ciudadF);
end;

{INCISO 5} //--> Lo utilizo tambien en el 3
function inciso5 (ciudad : string) : boolean;
begin
	inciso5 := (ciudad = 'BOSTON');
end;

function promedio (distanciaTotal : real; minutosTotales : integer) : real;
begin
	promedio := (minutosTotales / distanciaTotal);
end;

{MODULOS AUXILIARES}
procedure imprimirCorredor(c : corredor);
begin
	writeln('NOMBRE: ',c.nombre);
	writeln('APELLIDO: ',c.apellido);
	writeln('DISTANCIA: ',c.distancia:0:2);
	writeln('TIEMPO: ',c.tiempo);
	writeln('PAIS: ',c.pais);
	writeln('CIUDAD PARTIDA: ',c.ciudadP);
	writeln('CIUDAD LLEGADA: ',c.ciudadF);
	writeln('');
end;

procedure imprimir (pri : lista);
begin
	while pri <> nil do begin
		imprimirCorredor(pri^.dato);
		pri := pri^.sig;
	end;
end;

{PROGRAMA PRINCIPAL}
var
	aux,pri : lista;
	ciudadActual,ciudadMax : string;
	cantTotal,tiempoTotal,cantMax,cantBrasil,cant4,corredoresCiudad : integer;
	distanciaTotal,distanciaMax,pasoBoston,distanciaBrasil,kmCiudad : real;
BEGIN
	cantTotal := 0;
	tiempoTotal := 0;
	distanciaTotal := 0;
	ciudadMax := '';
	cantMax := -1;
	distanciaMax := -1;
	cantBrasil := 0;
	distanciaBrasil := 0;
	cant4 := 0;
	pasoBoston := 0;
	pri := nil;
	cargar(pri);
	aux := pri;
	while (aux <> nil) do begin
		ciudadActual := aux^.dato.ciudadP;
		kmCiudad := 0;
		corredoresCiudad := 0;
		while ((aux <> nil) and (ciudadActual = aux^.dato.ciudadP)) do begin
			{inciso 1}
			tiempoTotal := tiempoTotal + aux^.dato.tiempo;
			{inciso 2}
			kmCiudad := kmCiudad + aux^.dato.distancia;
			corredoresCiudad := corredoresCiudad + 1;
			{inciso 3}
			if inciso3(aux^.dato.pais) then begin
				cantBrasil := cantBrasil + 1;
				distanciaBrasil := distanciaBrasil + aux^.dato.distancia;
			end;
			{inciso 4}
			if inciso4(aux^.dato.ciudadP,aux^.dato.ciudadF) then
				cant4 := cant4 + 1;	
			aux := aux^.sig;
		end;	
		{inciso 1}
		cantTotal := cantTotal + corredoresCiudad;
		distanciaTotal := distanciaTotal + kmCiudad;
		{inciso 2}
		calcularCiudad(aux^.dato.nombre,corredoresCiudad,kmCiudad,ciudadMax,cantMax,distanciaMax);
		{inciso 5}
		if inciso5(ciudadActual) then
			pasoBoston := promedio(distanciaTotal,tiempoTotal);
	end;
	{RESULTADOS}
	writeln('----INCISO 1----');
	writeln('Corredores totales: ',cantTotal);
	writeln('Tiempo total: ',tiempoTotal);
	writeln('Distancia total: ',distanciaTotal:0:2);
	writeln('----INCISO 2----');
	writeln('Ciudad con mayor cantidad de corredores: ',ciudadMax);
	writeln('Cantidad de kilometros recorridos en ',ciudadMax,': ',distanciaMax);
	writeln('----INCISO 3----');
	writeln('Distancia promedio recorrida por corredores de Brasil: ',promedio(distanciaBrasil,cantBrasil):0:2);
	writeln('----INCISO 4----');
	writeln('Cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad: ',cant4);
	writeln('----INCISO 5----');
	writeln('Paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston: ',pasoBoston:0:2);
END.

