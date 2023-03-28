program prac1parte2punto3;

// No se puede utilizar subrango, porque la nota puede
// llegar a ser un valor real

var
  nombre: string;
  num: real;
  aprobado,mayor: integer;
  
BEGIN
  repeat
  aprobado := 0;
  mayor := 0;
  writeln('Ingresar el nombre del alumno');
    read(nombre);
    writeln('Ingresar la nota del alumno');
    read(num);
    if num > 7 then
      mayor := mayor + 1;
    if num > 8 then
      aprobado := aprobado + 1;
    
  until nombre = 'Zidane Zinedine';
	writeln('Cantidad de alumnos arobados: ',aprobado);
	writeln('Cantidad de alumnos con 7: ',mayor);
END.
  
