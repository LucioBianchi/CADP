program prac1part2punto2a;

var
  num,i,mayor,pos : integer;
BEGIN
  mayor := -9999;
  for i := 1 to 10 do begin
    writeln('Ingrese un numero entero');
    readln(num);
    if num > mayor then begin
      mayor := num;
      pos := i;
    end;
  end;
	writeln('El mayor numero leido fue el ',mayor,' en la posicion ',pos);
END.
