{5) La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del monotributo
(entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y el monto mensual 
acordado en el contrato. La información se ingresa ordenada por fecha de firma de contrato (los más antiguos
primero, los más recientes últimos).

Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector. Una
vez almacenados los datos, procesar dicha estructura para obtener:

1) Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos

2) Cantidad de clientes para cada categoría de monotributo

3) Código de las 10 ciudades con mayor cantidad de clientes

4) Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}

program prac4parte2punto5;
const
	dimF := 500;
type
	rango = 'A'..'F';
	cod = 1..2400;
	fecha = record;
		mes : integer;
		ano : integer;
	cliente = record;
		fechaF : fecha;
		monotributo : rango;
		codigo : cod;
		monto : real;
	vector = array[1..dimF] of cliente;
	categoria = array[rango] of integer;

procedure leerFecha(var f : fecha);
begin
	write('Mes: '); 
	readln(fecha.mes);
	write('Ano: '); 
	readln(fecha.ano);
end;

procedure leer(var c : cliente);
begin
	writeln('Ingresar fecha: ');
	leer(c.fechaF);
	write('Ingresar categoria de monotributo: ');
	readln(c.monotributo);
	write('Ingresar codigo: ');
	readln(c.codigo);
	write('Ingresar monto mensual: ');
	readln(c.monto);
end;

procedure cargar (var v : vector);
var
	i :integer;
	c : cliente;
begin
	for i := to dimF do begin
		leer(c);
		v[i] := cliente;
	end;
end;

//inciso 1
procedure inciso1 (v : vector);
var
	i,mesActual,anoActual,maxAno,cantMes,cantAno : integer;
begin
	maxAno := -1;
	i := 1;
	while (i <= dimF) do begin
		anoActual := v[i].fecha.ano;
		cantAno := 0;
		while (i <= dimF) and (anoActual = v[i].fecha.ano) do begin
			mesActual := v[i].fecha.mes;
			cantMes := 0;
			while (i <= dimF) and (mesActual = v[i].fecha.mes) do begin
				cantMes := cantMes + 1;
				cantAno := cantAno + 1;
				i := i+1;
			end;
			writeln('Contratos del mes ',mesActual,' : ',cantMes);
		end;
		if cantAno > maxAno then maxAno := cantAno;
		writeln('Contratos del Ano ',anoActual,' : ',cantAno);
	end;
	writeln('Ano en el que se firmaron mas contratos: ',maxAno);
end;

//inciso 2
procedure inicializar (v : categoria);
	i : char;
begin
	for i := 'A' to 'F';
		v[i] := 0;
end;

procedure calcMonotributo (var );
begin

end;

//inciso 3


//inciso 4
var

BEGIN
	
	
END.

