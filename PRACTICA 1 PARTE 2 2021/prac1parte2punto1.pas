program prac1parte2punto1a;

var
  num,i,sum,mayor : integer;
BEGIN
  sum := 0;
  mayor:= 0;
  for i := 1 to 10 do begin
    writeln('Ingrese un numero entero');
    read(num);
    sum := sum + num;
    if num > 5 then mayor := mayor + 1;
  end;
	writeln('La suma de los numeros es igual a ', sum);
	writeln('La cantidad de numeros mayores a 5 es igual a ',mayor);
END.
