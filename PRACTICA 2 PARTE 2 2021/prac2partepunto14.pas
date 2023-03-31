program prac2parte2punto14;

function rendimiento(hectareas : real;zona : integer; precio : integer): real;
begin
  if zona = 1 then rendimiento := 6 * hectareas * precio
  else if zona = 2 then rendimiento := 2.6 * hectareas * precio
  else rendimiento := 1.4 * hectareas * precio;
end;

// function no puede devolver strings -> es un tipo complejo
procedure maxmin(rend : real; localidad : string; var locmax,locmin : string; var mayor,menor : real);
begin
	if (rend > mayor) then begin
      mayor := rend;
	  locmax := localidad;
    end;
    if (rend < menor) then begin
      menor := rend;
      locmin := localidad;
    end;
end;

function tresfeb(rend: real; localidad : string) : boolean;
begin
	tresfeb := ((localidad = 'Tres de Febrero') and (rend > 10000));
end;

var 
  localidad,locmax,locmin : string;
  rend,cant,mayor,menor: real;
  tipo,febrero : integer;
BEGIN
  locmax := '--';
  locmin := '--';
  rend := 0;
  mayor := -1;
  menor := 32000;
  febrero := 0;
  
  repeat	
    writeln('Ingresar la localidad del campo'); readln(localidad);
    writeln('Ingresar la cantidad de hectareas sembradas'); readln(cant);
    writeln('Ingresar el tipo de zona');  readln(tipo);
    
    rend := rendimiento(cant,tipo,320);
    maxmin(rend,localidad,locmax,locmin,mayor,menor);
    if (tresfeb(rend,localidad)) then febrero := febrero + 1;
    
  until localidad = 'Saladillo';
  
  writeln('Cantidad de campos en Tres de Febrero con rendimiento mayor a U$S 10000: ', febrero);
  writeln('Localidad del campo de mayor rendimiento economico esperado: ', locmax);
  writeln('Localidad del campo de menor rendimiento economico esperado: ', locmin);
  
END.
