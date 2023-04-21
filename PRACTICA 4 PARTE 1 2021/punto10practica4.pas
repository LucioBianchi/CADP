{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:

a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.

b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program punto10practica4;

const
	dF = 300;
type
	vector = array [1..dF] of real;
	
procedure cargar (var v : vector; var dL : integer);
var
	salario : real;
begin
	write('Ingresar salario: ');
	readln(salario);
	while (salario <> 0) and (dL < dF) do begin
		dL := dL + 1;
		v[dL] := salario;
		if dL < dF then begin
			write('Ingresar salario: ');
			read(salario);
		end;
	end;
end;

procedure incrementarSalario (var v : vector; x : real; dL : integer; var totalSalario : real);
var
	i : integer;
begin
	for i := 1 to dL do begin
		v[i] := v[i] * x;
		totalSalario := totalSalario + v[i];
	end;
end;

function salarioPromedio (totalSalario : real; dL : integer) : real;
begin
	salarioPromedio := (totalSalario / dL);
end;

var
	vsueldos : vector;
	dL : integer;
	totalSalario : real;
BEGIN
	dL := 0;
	totalSalario := 0;
	cargar(vsueldos,dL);
	incrementarSalario(vsueldos,1.15, dL,totalSalario);
	writeln('Sueldo promedio: ',salarioPromedio(totalSalario,dL):0:2);
END.

