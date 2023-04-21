program Vectores;

const
	cant_datos = 150;
type
	vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var
  num : real;
begin
  dimL := 0;
  read(num);
  while (dimL  < cant_datos) and (num <> 0) do begin
	dimL := dimL + 1; 
	v[dimL] := num;
	read(num);
  end; 
end;

procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
	i : integer;
begin
	for i := 1 to dimL do begin
		v[i] := v[i] + n;
		suma := suma + v[i];
	end;
end;

{ programa principal }
var
	datos : vdatos;
	dim : integer;
	num, sumaTotal : real;
begin
	dim := 0;
	sumaTotal := 0;
	cargarVector(datos,dim); { completar }
	writeln('Ingrese un valor a sumar');
	readln(num);
	modificarVectorySumar(datos,dim,num,sumaTotal);{completar}
	writeln('La suma de los valores es: ', sumaTotal:0:2);
	writeln('Se procesaron: ',dim, ' numeros');
end.
