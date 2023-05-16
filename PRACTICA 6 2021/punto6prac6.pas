{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión (cantidad
de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y rango del
espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:

1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:

a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).

b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.

c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.

d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.

Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una única vez.} //--> Se podia recorrer 2 veces para el inciso c y d

//La consigna da a entender que hay que procesar mientras se lee

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
	lista2 = ^nodo2;
	nodo2 = record
		dato: string;
		sig: lista2;
	end;
	vector = array[espectro] of integer;

{MODULOS PRINCIPALES DEL PROGRAMA}

procedure leer (var s: sonda);
begin
	write('Ingresar nombre de la sonda: ');
	readln(s.nombre);
	write('Ingresar duracion estimada de la mision: ');
	readln(s.duracion);
	write('Ingresar costo de construccion: ');
	readln(s.construccion);
	write('Ingresar costo de mantenimiento mensual: ');
	readln(s.mantenimiento);
	write('rango del espectro electromagnetico: ');
	readln(s.rango);
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

function calcularPromedio (num1,num2 : integer) : real;
begin
	calcularPromedio := num1 / num2;
end;

function calcularPromedio2 (num1 : real; num2 : integer) : real;
begin
	calcularPromedio2 := num1 / num2;
end;

procedure cargarLista (var pri : lista; var promedioDuracion,promedioConstruccion: real);
var
	s : sonda;
	total,duracionTotal : integer;
	construccionTotal : real;
begin
	total := 0;
	duracionTotal := 0;
	construccionTotal := 0;
	repeat
		total := total + 1;
		writeln('INGRESAR INFO DE LA SONDA: ');
		leer(s);
		construccionTotal := construccionTotal + s.construccion;
		duracionTotal := duracionTotal + s.duracion;
		agregarAlFinal(pri,s);
	until s.nombre = 'GAIA';
	promedioDuracion := calcularPromedio(duracionTotal,total);
	promedioConstruccion := calcularPromedio2(construccionTotal,total);
end;

{INCISO A}

function calcularCosto(construccion,mantenimiento : real): real;
begin
	calcularCosto := construccion + mantenimiento;
end;

procedure maximoCosto (nombre : string; costo : real; maxnom : string ;max : real);
begin
	if costo > max then begin
		max := costo;
		maxnom := nombre;
	end;
end;

{INCISO B}

procedure inicializarVector (var v : vector);
var
	i : espectro;
begin
	for i := 1 to 7 do
		v[i] := 0;
end;

procedure contarEspectro (var v : vector; e: espectro);
begin
	v[e] := v[e] + 1;
end;

procedure imprimirVector (v : vector);
var
	i : espectro;
begin
	for i := 1 to 7 do begin
		case i of
		1: writeln('Cantidad de sondas de rango radio: ',v[i]);
		2: writeln('Cantidad ce sonda de rango microondas: ',v[i]);
		3: writeln('Cantidad ce sonda de rango infrarrojo: ',v[i]);
		4: writeln('Cantidad ce sonda de rango luz visible: ',v[i]);
		5: writeln('Cantidad ce sonda de rango ultravioleta: ',v[i]);
		6: writeln('Cantidad ce sonda de rango rayos X: ',v[i]);
		7: writeln('Cantidad ce sonda de rango rayos Gamma: ',v[i]);
		end;
	end;
end;

{INCISO C}

{El promedio de todas las sondas se calcula mientras se carga la Lista}

procedure incisoC (duracion : integer; promedio : real ;var cant: integer);
begin
	if duracion > promedio then cant := cant + 1; // duracion es entero y promedio un real
end;

{INCISO D}

function incisoD (costo,promedio : real) : boolean;
begin
	incisoD := costo > promedio;
end;

procedure agregarAlFinal2 (pri : lista2; nombre : string);
var
	nuevo,aux : lista2;
begin
	new(nuevo);
	nuevo^.dato := nombre;
	nuevo^.sig := nil;
	if pri = nil then pri := nuevo
	else begin
		aux := pri;
		while (aux^.sig <> nil) do
			aux := aux^.sig;
		aux^.sig := nuevo;
	end;
end;

procedure imprimir (pri : lista2);
begin
	while pri <> nil do begin
		writeln('Nombre: ',pri^.dato);
		pri := pri^.sig;
	end;
end;

var
	aux,pri : lista;
	pri2 : lista2;
	v : vector;
	promedioConstruccion,promedioDuracion,costoTotal, maxCosto : real;
	maxNombre : string;
	cantC : integer;
BEGIN
	pri := nil; pri2 := nil;
	maxCosto := -9999;
	maxNombre := '---';
	cantC := 0;
	inicializarVector(v);
	cargarLista(pri,promedioConstruccion,promedioDuracion);
	aux := pri;
	while aux <> nil do begin
		costoTotal := calcularCosto(aux^.dato.construccion,aux^.dato.mantenimiento);
		maximoCosto(aux^.dato.nombre,costoTotal,maxNombre,maxCosto);
		contarEspectro(v,aux^.dato.rango);
		incisoC(aux^.dato.duracion,promedioDuracion,cantC);
		if incisoD(aux^.dato.construccion,promedioConstruccion) then
			agregarAlFinal2(pri2,aux^.dato.nombre);
		aux := aux^.sig;
	end;
	{inciso a}
	writeln('Nombre de la sonda mas costosa: ',maxNombre);
	{inciso b}
	writeln('Cantidad de sondas de cada rango: ');
	imprimirVector(v);
	{inciso c}
	writeln('Cantidad de sondas con duracion mayor al promedio: ',cantC);
	{inciso d}
	writeln('Nombre de las sondas cuyo costo es mayor al promedio: ');
	imprimir(pri2);
END.
