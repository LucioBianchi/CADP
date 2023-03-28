program prac1parte2punto7;

var 
  nombre,ganador1,ganador2,perdedor1,perdedor2 : string;
  tiempo,mejor1,mejor2,peor1,peor2 : real;
  i : integer;
  
BEGIN
  // Se deben inicializar los maximos a 9999 y los minimos a -1
  mejor1 := 9999;
  mejor2 := 9999;
  peor1 := -1;
  peor2 := -1;
  ganador2 := '--';
  ganador1 := '--';
  perdedor2 := '--';
  perdedor1 := '--';
  
  for i := 1 to 100 do begin
    writeln('Ingresar el nombre del piloto');
    readln(nombre);
    writeln('Ingresar el tiempo que le tomo finalizar en minutos');
    readln(tiempo);
    
    if tiempo < mejor1 then begin
      ganador2 := ganador1;
      mejor2:= mejor1;
      ganador1:= nombre;
      mejor1 := tiempo;
    end
    else if tiempo < mejor2 then begin
      ganador2 := nombre;
      mejor2:= tiempo;
    end;
    
    // Tiene que ser un if porque si es un else y se ingresan siempre valores
    // mayores al tiempo anterior nunca se guarda un valor en los perdedores
    
    if tiempo > peor1 then begin
      perdedor2 := perdedor1;
      peor2 := peor1;
      perdedor1 := nombre;
      peor1 := tiempo;
    end
    else if tiempo > peor2 then begin
      perdedor2 := nombre;
      peor2 := tiempo;
    end;
  end;
  writeln('Primero: ',ganador1); writeln('Segundo: ',ganador2);	
  writeln('...');	
  writeln('99o: ',perdedor2); writeln('100o: ',perdedor1);		
END.
