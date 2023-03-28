program Actividad2EjercicioAdicional;

// Cuando se pregunta si es ingresante o recursarte se podría calcular numero de ingresantes
// Revisar este codigo, le faltan calcular algunsa cosas

var
  legajo,i,nota,caprobaron,alumnos0,cpromedio,codigo1,codigo2,codigo3,codigo4,
  cant1,cant2,cant3,cant4,ingresantes,recursantes,cant10,cant0,aprobaron,total: integer;
  condicion : char;
  promedio : real;
  tuvo0: boolean;
  
BEGIN
  caprobaron := 0; cpromedio := 0; codigo1 := -1; codigo2:= -1; codigo3:= -1;
  cant1:= -2; cant2:= -2; cant3:= -2; cant4:= -2; alumnos0 := 0;
  ingresantes := 0; recursantes := 0; promedio := 0;
      
  writeln('Ingresar legajo del alumno');
  readln(legajo);
  writeln('Ingresar condicion del alumno (i o r)');
  readln(condicion);
  while ((condicion <> 'i') and (condicion <> 'r')) do begin
    writeln('Ingresar condicion del alumno (i o r)');
	readln(condicion);
  end;
  
  while (legajo <> -1) do
  begin
    cant10 := 0; 
    cant0 := 0;
    total := 0;
    aprobaron := 0;
    tuvo0 := False;

    for i:= 1 to 5 do
    begin      
      writeln('Ingresar nota de autoevaluacion');
      readln(nota);
      if nota >= 4 then 
      begin
        aprobaron := aprobaron + 1;
		if nota = 10 then cant10 := cant10 + 1;
      end
      else 
		if nota = 0 then 
		begin 
	        cant0 := cant0 + 1;
 	        tuvo0 := True;
 	    end;
	  total := total + nota;
	end;   
    
    // Calcular los dos alumnos con mayor de cantidad de 10 y 0
    if cant10 > cant1 then 
    begin
      codigo2 := codigo1;
      cant2 := cant1;
      codigo1 := legajo;
      cant1 := cant10;
    end
    else 
	  if cant10 > cant2 then
	  begin
        cant2:= cant10;
        codigo2 := legajo;
      end;
    
    if cant0 > cant3 then 
    begin
      codigo4 := codigo3;
      cant4 := cant3;
      cant3 := cant0;
      codigo3 := legajo;
    end
    else 
      if cant0 > cant4 then 
      begin
        cant4 := cant0;
        codigo4 := legajo;
      end;
    
    //Calcular alumnos con promedio 6.5 y alumnos que aprobaron y que sacaron un 0
    if not(tuvo0) then alumnos0 := alumnos0 + 1;
    promedio := total / 5;
    if promedio > 6.5 then cpromedio := cpromedio + 1;
    
    //Calcular aprobados ingresantes/recursantes en condiciones de rendir
    if aprobaron >= 4 then 
    begin
      if condicion = 'i' then ingresantes := ingresantes + 1
      else recursantes := recursantes + 1;
      if aprobaron = 5 then caprobaron := caprobaron + 1;
    end;
    
    writeln('Ingresar legajo del alumno');
    readln(legajo);
    writeln('Ingresar condicion del alumno (i o r)');
    readln(condicion);
    while ((condicion <> 'i') and (condicion <> 'r')) do begin
		writeln('Ingresar condicion del alumno (i o r)');
		readln(condicion);
    end;
  end;
  
  writeln('Cantidad de alumnos ingresantes en codicion de rendir ',ingresantes);
  writeln('Cantidad de alumnos recursantes en codicion de rendir ',recursantes);
  writeln('Cantidad de alumnos que aprobaron todas las autoevaluaciones ',caprobaron);
  writeln('Cantidad de alumnos cuyo promedio fue mayor a 6.5 ',cpromedio);
  writeln('Cantidad de alumnos que obtuvieron 0 en al menos 1 autoevaluacion ',alumnos0);
  writeln('Alumnos con mayor cantidad de evaluaciones con nota 10: ',codigo1,' ',codigo2);
  writeln('Alumnos con mayor cantidad de evaluaciones con nota 0: ',codigo3,' ',codigo4);
  
END.
