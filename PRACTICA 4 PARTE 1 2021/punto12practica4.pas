{12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:

a) la cantidad de galaxias de cada tipo.

b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.

c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.

d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program punto12practica4;

const
	dF = 53;
type
	galaxia = record
		nombre : string;
		tipo : integer;
		masa : real;
		pc : real;
	end;
	vector = array [1..dF] of galaxia;

procedure leer (var g : galaxia);
begin
	write('Ingresar nombre: ');
	readln(g.nombre);
	write('Ingresar nro de tipo : ');
	readln(g.tipo);
	write('Ingresar masa: ');
	readln(g.masa);
	write('Ingresar distancia en parsecs medida desde la Tierra: ');
	readln(g.pc);
end;

procedure cargar(var v : vector);
var
	i : integer;
begin
	for i:= 1 to dF do begin
		writeln('GALAXIA NUMERO ',i);
		leer(v[i]);
	end;
end;

procedure tipoGalaxia (tipo : integer; var eliptica,espiral,lenticular,irregular : integer);
begin
	case tipo of
		1: eliptica := eliptica + 1;
		2: espiral := espiral + 1;
		3: lenticular := lenticular + 1;
		4: irregular := irregular + 1;
	end;
end;

procedure galaxiasPrincipales (nombre: string; masa : real; var masaPrincipales : real);
begin
	if ((nombre = 'Via Lactea') or (nombre = 'Andromeda') or (nombre = 'Triangulo')) then
		masaPrincipales := masaPrincipales + masa;
end;

function cumple3 (tipo : integer; pc : real) : boolean;
begin
	cumple3 := ((tipo <> 4) and (pc < 1000));
end;

procedure maxMasa (nombre : string; masa : real; var max1,max2 : real; var maxNombre1,maxNombre2 : string);
begin
	if masa > max1 then begin
		max2 := max1;
		maxNombre2 := maxNombre1;
		max1 := masa;
		maxNombre1 := nombre;
	end
	else if masa > max2 then begin
		max2 := masa;
		maxNombre2 := nombre;
	end;
end;

procedure minMasa (nombre : string; masa : real; var min1,min2 : real; var minNombre1,minNombre2 : string);
begin
	if masa < min1 then begin
		min2 := min1;
		minNombre2 := minNombre1;
		min1 := masa;
		minNombre1 := nombre;
	end
	else if masa < min2 then begin
		min2 := masa;
		minNombre2 := nombre;
	end;
end;

function calcPorcentaje (masaPrincipales,masaTotal : real) : real;
begin
	calcPorcentaje := (masaPrincipales / masaTotal) * 100;
end;

var
	v : vector;
	i,eliptica,espiral,lenticular,irregular,cantCumple3 : integer;
	max1,max2,min1,min2,masaTotal,masaPrincipales : real;
	maxNombre1,maxNombre2,minNombre1,minNombre2 : string;
BEGIN
	masaPrincipales := 0;
	masaTotal := 0;
	eliptica := 0;   
	espiral := 0;
	lenticular := 0; 
	irregular := 0;
	cantCumple3 := 0;
	max1 := -9999; 	max2 := -9999;
	min1 := 9999;  	min2 := 9999;
	maxNombre1 := '---';   maxNombre2 := '---';
	minNombre1 := '---';   minNombre2 := '---';
	cargar(v);
	for i := 1 to dF do begin
		masaTotal := masaTotal + v[i].masa;
		tipoGalaxia(v[i].tipo,eliptica,espiral,lenticular,irregular);
		galaxiasPrincipales(v[i].nombre,v[i].masa,masaPrincipales);
		if cumple3(v[i].tipo,v[i].pc) then cantCumple3 := cantCumple3 + 1;
		maxMasa(v[i].nombre,v[i].masa,max1,max2,maxNombre1,maxNombre2);
		minMasa(v[i].nombre,v[i].masa,min1,min2,minNombre1,minNombre2);
	end;
	writeln('');
	writeln('----- RESULTADOS OBTENIDOS -----');
	writeln('Cantidad de galaxias de cada tipo:');
	writeln('eliptica: ',eliptica);  writeln('espiral: ',espiral);
	writeln('lenticular: ',lenticular);  writeln('irregular: ',irregular);
	writeln('');
	writeln('Masa de las galaxias principales: ',masaPrincipales);
	writeln('Masa total: ',masaTotal);
	writeln('Relacion masa principales / masa total: %', calcPorcentaje(masaPrincipales,masaTotal):0:2);
	writeln('');
	writeln('Cantidad de galaxias no irregulares a menos de 1000pc : ',cantCumple3);	
	writeln('');
	writeln('Las dos galaxias con mayor masa: ',maxNombre1,' ',maxNombre2);
	writeln('Las dos galaxias con menor masa: ',minNombre1,' ',minNombre2);
	
END.

