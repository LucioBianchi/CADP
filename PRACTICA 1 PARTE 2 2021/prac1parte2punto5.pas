program prac1parte2punto5;

var
  num,max,min,sum : integer;

BEGIN
  sum := 0;
  min := 9999;
  max := -9999;
  repeat
    writeln('Ingrese un numero entero');
    read(num);
    if num > max then max := num;
    if num < min then min := num;
    sum := sum + num;
  until num = 100;
    writeln('El maximo numero leido es ',max);
    writeln('El minimo numero leido es ',min);
    writeln('La suma de los numeros leido es ',sum);
	
END.

