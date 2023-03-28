program prac1parte2punto8a;

var
  monto,montomes : real;
  i,cant,diamayor,maxcant : integer;
BEGIN
  diamayor:= 0;
  montomes := 0;
  maxcant := -1;
  for i := 1 to 31 do begin
    cant := 0;
    writeln('Ingrese el monto');
    readln(monto);
    while monto <> 0 do begin
      writeln('Ingrese el monto');
      readln(monto);
      cant:= cant + 1;
      montomes := montomes + monto;
      if cant > maxcant then begin
        maxcant := cant;
        diamayor := i;
      end;
    end;
    writeln('Cantidad de ventas del dia: ',cant);
  end;
  writeln('Monto total acumulado en todo el mes: ',montomes:0:2);
  writeln('El dia con mayor cantidad de ventas fue el número: ',diamayor);
  
  { Si se pidiera informar con dias de la semana se podria usar una estructura
    case of con una condicion para cada dia}
	
END.

