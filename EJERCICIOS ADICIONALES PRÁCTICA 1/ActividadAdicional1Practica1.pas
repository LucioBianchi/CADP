program EjerciciosAdicionalesActividad1;

var
  codigo,inversiones,i,codempresa,cant: integer;
  monto,total,mayortotal,promedio: real;
  
BEGIN
  inversiones := 0;
  cant := 0;
  codempresa := 0;
  mayortotal := -1;
  promedio := 0;
  repeat
    total := 0;
    writeln('Ingresar el codigo de la empresa');
    readln(codigo);
    writeln('Ingresar la cantidad de inversiones');
    readln(inversiones);
    for i := 1 to inversiones do
    begin
      writeln('Ingresar el monto de la inversion');
      readln(monto);
      total := total + monto;
    end;
    promedio:= total / inversiones;
    writeln('Empresa ',codigo,' Monto Promedio ',promedio:0:2);
    if total > mayortotal then begin
      mayortotal := total;
      codempresa := codigo;
    end;
    if total > 50000 then
      cant := cant + 1;
    writeln('');
  until codigo = 100;
  writeln('La empresa ',codempresa,' es la que mayor dinero posee invertido');
  writeln('Hay ',cant,' empresas con inversiones por mas de $50000');
END.
