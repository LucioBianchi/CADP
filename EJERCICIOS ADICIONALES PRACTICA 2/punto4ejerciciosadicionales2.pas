program punto4ejerciciosadicionales2;

// Las funciones de planetasDiametro y perimetroJupiter se pueden hacer mas reutilizables
// Tambien se pueden declarar los valores que se nos dan como constantes
// Intentar no "hardcodear" los datos

const
	pi = 3.14;

procedure calcularCirculo (radio : real; var diametro,perimetro : real);
begin
	diametro := 2 * radio;
	perimetro := pi * diametro;
end;

procedure leerPlaneta(var nombre : string; var radio : real; var distancia : integer);
begin
	writeln('Radio del planeta:');
	readln(radio);
	if (radio <> 0) then begin
		writeln('Ingresar nombre del planeta:');
		readln(nombre);
		writeln('Distancia a la Tierra:');
		readln(distancia);
	end;
end;

// Va a ser siempre falsa por que estoy trabajando con integers de 2 bytes;
function perimetroJupiter (perimetro : real) : boolean;
begin
	perimetroJupiter := (perimetro > 439.264);
end;

function planetasDiametro (diametro : real): boolean;
begin
	planetasDiametro := ((diametro <= 12700) and (diametro >= 6780));
end;

var
	nombre : string;
	radio,diametro,perimetro : real;
	cant,distancia : integer;
BEGIN
	cant := 0;
	leerPlaneta(nombre,radio,distancia);
	while (radio <> 0) do begin
		calcularCirculo(radio,diametro,perimetro);
		if (perimetroJupiter(perimetro)) then cant := cant + 1;
		if (planetasDiametro(diametro)) then begin
			writeln('Nombre: ',nombre);
			writeln('Distancia: ',distancia);
		end;
		leerPlaneta(nombre,radio,distancia);
	end;
	writeln('Cantidad de planetas con perimetro mayor a Jupiter: ',cant);
	
END.

