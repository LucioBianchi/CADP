program punto6practica3;

// El segundo punto no esta escrito de forma eficiente

type
	// Se podrian usar subrangos pero no funcionan en lectura
	microprocesador = record
		marca: string;
		linea : string;
		cores: integer;
		velocidad : real;
		tamanio : integer;
	end;
	
procedure LeerMicroprocesador( var m : microprocesador);
begin
	writeln('Ingresar cores, marca, linea, velocidad y tamaño del micropocesador');
	readln(m.cores);
	if (m.cores <> 0) then begin
		readln(m.marca);
		readln(m.linea);
		readln(m.velocidad);
		readln(m.tamanio);
	end;
end;

function MarcayLinea (cores : integer; tamanio : integer ; num1,num2 : integer) : boolean;
begin
	MarcayLinea := ((cores > num1) and (tamanio <= num2));
end;

function mismaMarca (nueva : string; var anterior : string) : boolean;
begin
	mismaMarca := (nueva = anterior);
end;

procedure contarProcesadores (tamanio,num : integer; var cant : integer);
begin
	if tamanio = num then cant := cant + 1;
end;

procedure marcasMax (marca : string; cant : integer; var max1,max2 : integer; var marca1,marca2 : string);
begin
	if (cant > max1) then begin
		max2 := max1;
		marca2 := marca1;
		max1 := cant;
		marca1 := marca;
	end
	else if (cant > max2) then begin
		marca2 := marca;
		max2 := cant;
	end;	
end;

procedure multicore (cores : integer; velocidad : real;marca,marca1,marca2 : string ;var cant: integer);
begin
	if ((cores > 1) and ((marca = marca1) or (marca = marca2)) and (velocidad >= 2)) then cant := cant + 1;
end;

var
	maxmarca1,maxmarca2,anterior : string;
	max1,max2,cantP,cantM : integer;
	m : microprocesador;
BEGIN
	cantP := 0;
	cantM := 0;
	max1:= -1;
	max2 := -1;
	LeerMicroprocesador(m);
	anterior := m.marca;
	while (m.cores <> 0) do begin
	
		//Imprimir marca y linea de los micropocesadores de 2 cores y transistores <= 22
		if MarcayLinea (m.cores,m.tamanio,2,22) then begin
			writeln('Marca: ',m.marca,' -- Linea: ',m.linea);
		end;
		
		//Calcular marcas con mas cant procesador 14 nm
		if mismaMarca(anterior,m.marca) then begin
			contarProcesadores(m.tamanio,14,cantP);
			marcasMax(m.marca, cantP, max1,max2, maxmarca1,maxmarca2);
		end
		else begin
			marcasMax(m.marca, cantP, max1,max2, maxmarca1,maxmarca2);
			anterior := m.marca;
			cantP := 0;
		end;
		
		//Calcular cantidad de procesadores multicores de AMD o INTEL
		multicore(m.cores,m.velocidad,m.marca,'AMD','INTEL', cantM);
		
		LeerMicroprocesador(m);
	end;
	writeln('Las marcas que tienen mayor cantidad de procesadores con 14 transistores ',maxmarca1,' - ',maxmarca2);
	writeln('Cantidad de microprocesadores multicore: ',cantM);
	
	
END.

