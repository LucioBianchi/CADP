program prac2parte2punto11;

procedure apellidoChicos(num : integer; apellido : string; var apellido1,apellido2 : string; var min1,min2 : integer);
begin
	if (num < min1) then begin
		min2 := min1;
		apellido2 := apellido1;
		min1 := num;
		apellido1 := apellido;
	end
	else if (num < min2) then begin
		min2 := num;
		apellido2 := apellido;
	end;
end;

procedure nombreGrandes(num : integer; nombre : string; var nombre1,nombre2 : string; var max1,max2 : integer);
begin
	if (num > max1) then begin
		nombre2 := nombre1;
		max2 := max1;
		nombre1 := nombre;
		max1 := num;
	end
	else if (num > max2) then begin
		max2 := num;
		nombre2 := nombre;
	end;
end;

function numPar (num : integer) : boolean;
begin
	numPar := (num MOD 2 = 0);
end;	
	
var
	num,min1,min2,max1,max2,cant : integer;
	nombre,nombre1,nombre2,apellido,apellido1,apellido2 : string;
	porcentaje : real;
BEGIN
	min1 := 9999 ; min2 := 9999 ; max1 := -9999 ; max2 := -9999;
	apellido1 := '-' ; apellido2 := '-' ; nombre1 := '-' ; nombre2 := '-' ;
	cant := 0; porcentaje := 0;
	repeat
		writeln('Ingresar nombre del Alumno');
		readln(nombre);
		writeln('Ingresar apellido el Alumno');
		readln(apellido);
		writeln('Ingresar nro de inscripcion del Alumno');
		readln(num);
		
		cant := cant + 1;
		apellidoChicos(num,apellido,apellido1,apellido2,min1,min2);
		nombreGrandes(num,nombre,nombre1,nombre2,max1,max2);
		if (numPar(num)) then porcentaje := porcentaje + 1;
		
	until (num = 1200);
	
	porcentaje := porcentaje / cant * 100;
	writeln('Apellido de alumnos con menor nro: ',apellido1,' ',apellido2 );
	writeln('Nombre de alumnos con mayor nro: ',nombre1,' ',nombre2);
	writeln('Porcentaje de alumnos con nro par: %',porcentaje:0:2);
END.
