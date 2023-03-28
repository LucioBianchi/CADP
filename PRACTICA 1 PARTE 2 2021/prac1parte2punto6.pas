program prac1parte2punto6;

// El programa dice que el codigo es numero entre 1 y 200, se puede utilizar
// un subrango (code = 1..200)
var
  i,codigo,cod1,cod2,cant16 : integer;
  min1,min2,precio : real;

BEGIN
  min1 := 9999;
  min2 := 9999;
  cod1:= 0;
  cod2 := 0;
  cant16 := 0;
  for i := 1 to 200 do begin
    writeln('Ingresar el codigo del producto');
    readln(codigo);
    writeln('Ingresar el precio del producto');
    readln(precio);
    
    if precio < min1 then begin
      min2 := min1;
      min1 := precio;
      cod2:= cod1;
      cod1:= codigo;
    end
    else if precio < min2 then begin
      min2:= precio;
      cod2 := codigo;
    end;
    if ((precio > 16) and (codigo MOD 2 = 0)) then
      cant16 := cant16 + 1;
  end;
  writeln('Los codigos de los dos productos mas baratos son: ',cod1,' ',cod2);
  writeln('La cantidad de productos de mas de 16 pesos y codigo par es: ',cant16);
END.
