{13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:

a) el año con mayor temperatura promedio a nivel mundial.

b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program punto13practica4;

const
	anio = 1980;
	dF = 100;
type
	vector = array [1..dF] of real;
	
procedure maxTemperatura (temp : real; anio : integer; var maxT : real; var maxTempAnio : integer);
begin
	if temp > maxT then begin
		maxT := temp;
		maxTempAnio := anio;
	end;
end;	

procedure cargar (var v : vector; var sumaAnio,maxT : real; var maxTempAnio : integer; anio : integer);
var
	i : integer;
begin
	sumaAnio := 0;
	writeln('Ingresar datos del anio ',anio);
	for i := 1 to dF do begin
		read(v[i]);
		MaxTemperatura(v[i],anio,maxT,maxTempAnio);
		sumaAnio := sumaAnio + v[i];
	end;
end;

procedure maxPromedioAnio (sumaAnio : real; anio : integer; var maxSuma : real; var maxAnio : integer);
begin
	if sumaAnio > maxSuma then begin
		maxSuma := sumaAnio;
		maxAnio := anio;
	end;
end;

var
	v : vector;
	sumaAnio,maxSuma,maxT : real;
	i,maxAnio,maxTempAnio : integer;
BEGIN
	maxT := -9999;
	maxSuma := -9999;
	sumaAnio := 0;
	maxAnio := -1;
	maxTempAnio := -1;
	for i := anio to anio + 50 do begin
		cargar(v,sumaAnio,maxT,maxTempAnio,anio);
		maxPromedioAnio(sumaAnio,anio,maxSuma,maxAnio);
		writeln('Temperatura promedio del anio: ',sumaAnio / dF);
	end;
	writeln('----- RESULTADOS OBTENIDOS -----');
	writeln('Anio con mayor temperatura promedio a nivel mundial: ',maxAnio); //---> No es necesario sacar el promedio
	writeln('Maximo historico de temperatura: ',maxT,' en el anio ',maxTempanio);
END.
