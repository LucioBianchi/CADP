program Actividad3EjerciciosAdicionalesPractica1;

const
  pi = 3.14;
  
var
  largo,ancho,alto,radio,volumen,volumen1,volumen2,recpromedio,cilpromedio,
  totalrectangular,totalcilindrico : real;
  altomenor,volumenmenor,rectangulares,cilindricos : integer;
  tanque : char;
BEGIN
  
  cilpromedio := 0;
  recpromedio:= 0;
  volumen1 := -1;
  volumen2 := -1;
  altomenor:= 0;
  volumenmenor:= 0;
  totalrectangular := 0;
  totalcilindrico := 0;
  rectangulares := 0;
  cilindricos := 0;
  
  writeln('Ingresar el tipo de tanque:');
  readln(tanque);
  while (tanque <> 'Z') do
  begin
    if tanque = 'R' then 
      begin
        rectangulares := rectangulares + 1;
        writeln('Ingresar Ancho del tanque'); readln(ancho);
        writeln('Ingresar Largo del tanque'); readln(largo);
        writeln('Ingresar Alto del tanque'); readln(alto);
        volumen := largo*ancho*alto;
        totalrectangular := totalrectangular + volumen;
      end
    else
      begin
        cilindricos := cilindricos + 1;
        writeln('Ingresar Radio del tanque'); readln(radio);
        writeln('Ingresar Alto del tanque'); readln(alto);
        volumen := pi*radio*alto;
        totalcilindrico := totalcilindrico + volumen;
      end;
      
    //Calcular tanque cuyo alto menor 1.40 o volumen mayor a 800
    if alto < 1.40 then altomenor := altomenor + 1;
    if volumen < 800 then volumenmenor := volumenmenor + 1;
    
    // Calcular los dos mayores volumenes
    if volumen > volumen1 then
      begin
        volumen2 := volumen1;
        volumen1 := volumen
      end
    else if volumen > volumen2 then volumen2 := volumen;
	
	writeln('Ingresar el tipo de tanque:');
    readln(tanque);  
  end;
  
  //Calcular volumen promedio de todos los tanque cilindricos y rectangulares
  cilpromedio:= totalcilindrico / cilindricos;
  recpromedio:= totalrectangular / rectangulares;
  
  //Imprimir resultados
  writeln('Volumen del tanque con mas volumen: ',volumen1:0:2);
  writeln('Volumen del 2do tanque con mas volumen: ',volumen2:0:2);
  writeln('Volumen promedio de todos los tanques cilindricos vendidos: ',cilpromedio:0:2);
  writeln('Volumen promedio de todos los tanques rectangulares vendidos: ',recpromedio:0:2);
  writeln('Cantidad de tanques cuyo altura es menor a 1.40 metros: ',altomenor);
  writeln('Cantidad de tanques cuyo volumen es menor a 800 metros cubicos: ',volumenmenor);
  
END.
