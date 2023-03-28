program practica2parte1ejercicio6;

function numero: integer;
var 
  num,max : integer;
begin
  writeln('Ingresar un numero');
  readln(num);
  max := -1;
  while (num > 0) do
	begin
		if ((num MOD 2 = 0) and (num > max)) then
			max := num;
		writeln('Ingresar un numero');
		readln(num);
	end;
  numero := max;
end;


BEGIN
  writeln(numero);
END.

