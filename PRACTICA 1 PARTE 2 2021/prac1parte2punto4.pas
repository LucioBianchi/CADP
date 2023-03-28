program prac1parte2punto4;

var
  num,i,min2,min: integer;
BEGIN
  min2 := 9999;
  min := 9999;
  for i := 1 to 10 do begin
    writeln('Ingrese un numero entero');
    read(num);
    if num < min then begin
      min2:= min;
      min:= num;
    end
    else if num < min2 then min2 := num;
  end;	
  writeln('Los 2 dos numeros leidos son ',min,' ',min2);
END.
  
{ program prac1parte2punto4a;

var
  num,min2,min: integer;
BEGIN
  min2 := 9999;
  min := 9999;
  writeln('Ingrese un numero entero');
  read(num);
  while num <> 0 do begin
    if num < min then begin
      min2:= min;
      min:= num;
    end
    else if num < min2 then min2 := num;
    writeln('Ingrese un numero entero');
    read(num);
  end;
  writeln('Los 2 dos numeros leidos son ',min,' ',min2);
END.
}

{ program prac1parte2punto4b;

var
  num,min2,min: integer;
BEGIN
  min2 := 9999;
  min := 9999;
  repeat
    writeln('Ingrese un numero entero');
    read(num);
    if num < min then begin
      min2:= min;
      min:= num;
    end
    else if num < min2 then min2 := num;
  until num = 0;
  writeln('Los 2 dos numeros leidos son ',min,' ',min2);
END.
}
