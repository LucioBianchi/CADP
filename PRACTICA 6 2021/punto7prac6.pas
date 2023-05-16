{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar proyectos
de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se han
determinado los siguientes criterios:

-sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.

A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:

a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los nuevos
criterios H2020.

b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.

c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el costo
total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello, utilice
el módulo realizado en b.}

program punto6prac6;
type
	espectro = 1..7;
	sonda = record
		nombre: string;
		duracion: integer;
		construccion: real;
		mantenimiento: real;
		rango: espectro;
	end;
	lista = ^nodo;
	nodo = record
		dato: sonda;
		sig: lista;
	end;

{MODULOS DEL PROGRAMA ANTERIOR (YA SE DISPONEN)}

procedure leer (var s: sonda);
begin
	write('Ingresar nombre de la sonda: ');
	readln(s.nombre);
	if s.nombre <> 'GAIA' then begin
		write('Ingresar duracion estimada de la mision: ');
		readln(s.duracion);
		write('Ingresar costo de construccion: ');
		readln(s.construccion);
		write('Ingresar costo de mantenimiento mensual: ');
		readln(s.mantenimiento);
		write('rango del espectro electromagnetico: ');
		readln(s.rango);
	end;
end;

procedure agregarAlFinal (var pri : lista; s : sonda);
var
	nuevo,aux : lista;
begin
	new(nuevo);
	nuevo^.dato := s;
	nuevo^.sig := nil;
	if pri = nil then pri := nuevo
	else begin
		aux := pri;
		while aux^.sig <> nil do
			aux := aux^.sig; 
		aux^.sig := nuevo;
	end;
end;

procedure cargarListaPunto (var pri : lista);
var
	s : sonda;
begin
	repeat
		writeln('INGRESAR INFO DE LA SONDA: ');
		leer(s);
		agregarAlFinal(pri,s);
	until s.nombre = 'GAIA';
end;

{INCISO A}

function condicion1 (mantenimiento,construccion : real) : boolean;
begin
	condicion1 := mantenimiento < construccion;
end;

function condicion2 (rango : espectro) : boolean;
begin
	condicion2 := rango <> 6;
end;

function incisoA (mantenimiento,construccion: real; rango : espectro) : boolean;
begin
	incisoa := condicion1(mantenimiento,construccion) and condicion2(rango);
end;

{INCISO B}

{Basta con crear dos variables listaCumple y listaNoCumple y utilizar los procesos
* del programa principal.}

procedure incisoB(var cumple,nocumple : lista; s : sonda);
begin
	if incisoA(s.mantenimiento,s.construccion,s.rango) then agregarAlFinal(cumple,s)
	else agregarAlFinal(nocumple,s);
end;

{INCISO C}

{Es suficiente con hacer con un proceso que calcule la cantidad y el costoTotal y
* que se pase como parametro la lista no cumple}

function calcularCosto (mantenimiento,construccion : real) : real;
begin
	calcularCosto := mantenimiento + construccion;
end;

procedure incisoC (pri : lista; var cantidad : integer; var costoTotal : real);
var
	sumaCostos : real;
begin
	while pri <> nil do begin
		cantidad := cantidad + 1;
		sumaCostos := calcularCosto (pri^.dato.mantenimiento,pri^.dato.construccion);
		costoTotal := costoTotal + sumaCostos;
		pri := pri^.sig;
	end;
end;

var
	pri,aux,cumple,nocumple : lista;
	costoTotal : real;
	cantidad : integer;
BEGIN
	pri := nil; cumple := nil; nocumple := nil;
	cantidad := 0;
	costoTotal := 0;
	{Se cargan los datos del punto anterior}
	cargarListaPunto(pri);
	aux := pri;
	{Se recorre toda la lista}
	while (aux <> nil) do begin;
		{Realiza el inciso a y el b}
		incisoB(cumple,nocumple,aux^.dato);
	end;
	{Recorre las sondas que no cumplen y calcula valores}
	incisoC(nocumple,cantidad,costoTotal);
	writeln('Cantidad de sondas que no cumplen: ',cantidad);
	writeln('Suma de los costos de las sondas que no cumplen: ',costoTotal:0:2);
END.
