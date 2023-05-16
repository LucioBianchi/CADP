{14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por
una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el código de alumno (entre 1
y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo
interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar más
de un medio de transporte en un mismo día.

Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de
datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:

a. La cantidad de alumnos que realizan más de 6 viajes por día

b. La cantidad de alumnos que gastan en transporte más de $80 por día

c. Los dos medios de transporte más utilizados.

d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.}

{CORRECION: intentar hacer lista ordenada por dia y calcularla con un vector de alumnos}
{Hacer una array con los 1300 alumnos , insertar viajes ordenados por dia}

program punto14prac6;
const
	dimF = 1300;
type
	codigo = -1..1300;
	dia = 1..31;
	medio = 1..5;
	viaje = record
		diaV: dia;
		transporte : medio;
		cod : codigo;
		facultad : string;
	end;
	lista = ^nodo;
	nodo = record
		dato : viaje;
		sig : lista;
	end;
	vPrecios = array[medio] of real;
	vMedios = array[medio] of integer;
	vector = array[1..DimF] of lista;

{INCIALIZAR VECTORES}
procedure inicializarVector (var v : vector);
var
	i : integer;
begin
	for i := 1 to dimF do
		v[i] := nil;
end;

procedure inicializarVMedios (var v : vMedios);
var
	i : integer;
begin
	for i := 1 to 5 do
		v[i] := 0;
end;

procedure inicializarVPrecios (var vP : vPrecios); // --> Se dispone
var
	i : integer;
begin
	for i := 1 to 5 do begin
		case i of
			1: vP[i] := 15.5;
			2: vP[i] := 20.8;
			3: vP[i] := 45.7;
			4: vP[i] := 35.5;
			5: vP[i] := 29.7;
		end;
	end;
end;

procedure leer (var v : viaje);
begin
	write('Ingresar codigo del alumno: ');
	readln(v.cod);
	if (v.cod <> -1) then begin
		write('Ingresar facultad del alumno');
		readln(v.facultad);
		write('Ingresar dia: ');
		readln(v.diaV);
		write('Ingresar medio de transporte: ');
		readln(v.transporte);
	end;
end;

procedure insertar (var pri : lista; v : viaje);
var
	nuevo,act,ant : lista;
begin
	new(nuevo);
	nuevo^.dato := v;
	act := pri;
	ant := pri;
	while ((act <> nil) and (act^.dato.diaV < v.diaV)) do begin
		ant := act;
		act := act^.sig;
	end;
	if ant = act then pri := nuevo
	else ant^.sig := nuevo;
	nuevo^.sig := act;
end;

procedure cargar (var vec: vector);
var
	v : viaje;
begin
	writeln('INGRESAR VIAJE');
	leer(v);
	while v.cod <> -1 do begin
		insertar(vec[v.cod],v);
		writeln('INGRESAR VIAJE');
		leer(v);
	end;
end;

{INCISO A}
function incisoA (cumple : boolean; cantDia : integer) : boolean;
begin
	incisoA := ((cumple) or (cantDia > 6));
end;

{INCISO B}
function calcularGasto (transporte : medio; vP : vPrecios) : real;
begin
	calcularGasto := vP[transporte];
end;

function incisoB (cumple : boolean; gasto : real) : boolean;
begin
	incisoB := ((cumple) or (gasto > 80));
end;	

{INCISO C}
procedure calcularMedios (var vM : vMedios; transporte : medio);
begin
	vM[transporte] := vM[transporte] + 1;
end;

procedure calcularMaximos(cant : integer; transporte : medio; var cantMax1,cantMax2 : integer; var max1,max2 : medio);
begin
	if cant > cantMax1 then begin
		max2 := max1;
		cantMax2 := Cantmax1;
		max1 := transporte;
		cantMax1 := cant;
	end
	else if cant > cantMax2 then begin
		max2 := transporte;
		cantMax2 := cant;
	end;
end;

procedure calcularC (vM : VMedios; var max1,max2 : medio);
var
	i : medio;
	cantMax1,cantMax2 : integer;
begin
	cantMax1 := -1;
	cantMax2 := -1;
	for i := 1 to 5 do
		calcularMaximos(vM[i],i,cantMax1,cantMax2,max1,max2);
end;

procedure imprimirMedio (transporte : medio);
begin
	case transporte of
		1: writeln('colectivo urbano');
		2: writeln('colectivo interurbano');
		3: writeln('tren universitario');
		4: writeln('tren Roca');
		5: writeln('bicicleta');
		else writeln('---');
	end;
end;

{INCISO D}
function usaBicicleta(var bicicleta : boolean; transporte : medio) : boolean;
begin
	usaBicicleta := ((bicicleta) or (transporte = 5));
end;

function usaOtroMedio (var otroMedio : boolean; transporte : medio) : boolean;
begin
	usaOtroMedio := ((otroMedio) or (transporte = 1) or (transporte = 3) or (transporte = 4) or (transporte = 5));
end;

function incisoD (bicicleta,otroMedio : boolean) : boolean;
begin
	incisoD := ((bicicleta) and (otroMedio));
end;

var
	aux : lista;
	v : vector;
	vM : vMedios;
	vP : vPrecios;
	diaActual : dia;
	i : codigo;
	cantA,cantB,cantD,cantDia : integer;
	bicicleta,otroMedio,cumpleA,cumpleB : boolean;
	gastoDia : real;
	max1,max2 : medio;
BEGIN
	cantA := 0;
	cantB := 0;
	cantD := 0;
	inicializarVector(v);
	inicializarVMedios(vM);
	inicializarVPrecios(vP);
	cargar(v);
	for i := 1 to dimF do begin
		aux := v[i];
		cumpleA := false;
		cumpleB := false;
		bicicleta := false;
		otroMedio := false;
		while aux <> nil do begin
			diaActual := aux^.dato.diaV;
			cantDia := 0;
			gastoDia := 0;
			while ((aux <> nil) and (diaActual = aux^.dato.diaV)) do begin
				cantDia := cantDia + 1;
				gastoDia := gastoDia + calcularGasto(aux^.dato.transporte,vP);
				calcularMedios(vM,aux^.dato.transporte);
				bicicleta := usaBicicleta(bicicleta,aux^.dato.transporte);
				otroMedio := usaOtroMedio(otroMedio,aux^.dato.transporte);
				aux := aux^.sig;
			end;
			cumpleA := incisoA(cumpleA,cantDia);
			cumpleB := incisoB(cumpleB,gastoDia);
		end;
		if cumpleA then cantA := cantA + 1;
		if cumpleB then cantB := cantB + 1;
		if incisoD(bicicleta,otroMedio) then cantD := cantD + 1;
	end;
	calcularC(vM,max1,max2);
	
	{RESULTADOS}
	writeln('---INCISO A---');
	writeln('Cantidad de alumnos que realizan mas de 6 viajes por dia: ',cantA);
	writeln('---INCISO B---');
	writeln('Cantidad de alumnos que gastan mas de $80 por dia: ',cantB);
	writeln('---INCISO C---');
	write('Transporte mas utilizado: ');
	imprimirMedio(max1);
	write('Segundo transporte mas utilizado: ');
	imprimirMedio(max2);
	writeln('---INCISO D---');
	writeln('Cantidad de alumnos que combinan bicicleta con algun otro medio de transporte: ',cantD);
END.
