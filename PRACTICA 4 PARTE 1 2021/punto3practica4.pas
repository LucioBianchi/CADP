{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.

a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.

b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.

c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.

d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.

e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.} ---> Falta terminar

program punto3practica4;

const
	dimF = ;
type
	vector = array [1..dimF] of integer;
	
//inciso A
procedure imprimir (v : vector; dimL : integer);
var
	i : integer;
begin
	for i := 1 to dimL do
		writeln(v[i]);
end;

//inciso B
procedure imprimirInverso (v : vector; dimL : integer);
var
	i : integer;
begin
	for i := dimL downto 1 do
		writeln(v[i]);
end;

//inciso C, también se podría hacer usando los incisos A y B
procedure imprimirMitad (v : vector; dimL : integer);
var
	i,mitad : integer;
begin
	mitad := dimL DIV 2;
	for i := mitad downto 1 do
		writeln(v[i]);
	for i := mitad + 1 to dimL do
		writeln(v[i]);
end;

//inciso D
procedure vectorXY (v : vector; x,y : integer);
	i : integer;
begin
	if x < y then begin
		for := x to y do
			writeln(v[i]);
	end
	else begin
		for i := y to x do // --> tambien puede ser i := x downto y
			writeln(v[i});
	end;
end;

//inciso E

procedure imprimir (v : vector; PrimerPos, dimL : integer);
var
	i : integer;
begin
	for i := PrimerPos to dimL do
		writeln(v[i]);
end;

procedure imprimirInverso (v : vector; PrimerPos, dimL : integer);
var
	i : integer;
begin
	for i := dimL downto PrimerPos do
		writeln(v[i]);
end;

procedure imprimirMitad (v : vector; PrimerPos, dimL : integer);
var
	i,mitad : integer;
begin
	mitad := (PrimerPos + dimL) DIV 2;
	for i := mitad downto 1 do
		writeln(v[i]);
	for i := mitad + 1 to dimL do
		writeln
	
