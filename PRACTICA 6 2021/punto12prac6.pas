{12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android
instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB). 

La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese la
información disponible de todos los dispositivos e informe:

a. La cantidad de dispositivos para cada versión de Android.

b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.

c. El tamaño promedio de las pantallas de todos los dispositivos.}

program punto12prac6;
type
	dispositivo = record
		version : real;
		pantalla : real;
		ram : integer;
	end;
	lista = ^nodo;
	nodo = record
		dato : dispositivo;
		sig : lista;
	end;

{MODULOS INCISO B}

function incisoB (ram : integer; pantalla : integer) : boolean;
begin
	incisoB := ((ram > 3) and (pantalla < 5));
end;

{MODULOS INCISO C}

procedure calcularTotal (var total : integer);
begin
	total := tolal + 1;
end;

procedure calcularPantalla (var sumaPantalla : integer; pantalla : integer);
begin
	sumaPantalla := sumaPantalla + pantalla;
end;

function calcularPromedio (totalPantalla,total : integer) : real;
begin
	calcularPromedio := totalPantalla / total;
end;

var
	pri,aux : lista;
	versionActual : real;
	cantVersion,cantB,total,totalPantalla : integer;
BEGIN
	cargarLista(pri); // -> SE DISPONE
	cantB := 0;
	total := 0;
	totalPantalla := 0;
	aux := pri;
	while aux <> nil do begin
		versionActual := aux^.dato.version;
		cantVersion := 0;
		while ((aux <> nil) and (versionActual = aux^.dato.version)) do begin
			cantVersion := cantVersion + 1;
			{Calcula el inciso b}
			if incisoB(aux^.dato.ram,aux^.dato.pantalla) then 
				cantB := cantB + 1; 
			{Calcula el inciso c}
			calcularTotal(total);
			calcularPantalla(totalPantalla,aux^.dato.pantalla);
			aux := aux^.sig;
		end;
		{INCISO A}
		writeln('Cantidad de dispositivos de ',versionActual,' = ',cantVersion);
	end;
	{INCISO B}
	writeln('Dispositivos con mas de 3GB Ram y 5 pulgadas de pantalla: ',cantB);
	{INCISO C}
	writeln('Tamaño promedio de las pantallas: ',calcularPromedio(totalPantalla,total):0:2);
END.

