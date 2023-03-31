program punto2jerciciosadicionales2;

// Si se hace con 2 funciones hay q iterizar 2 veces desde num1 a num2, es ineficiente

procedure operacion(num1,num2 : integer; var suma,producto : integer);
var
	i : integer;
begin
	if num1 < num2 then
		for i := num1 to num2 do begin
			suma := suma + i;
			producto := producto * i;
		end
	else 
		for i := num1 downto num2 do begin
			suma := suma + i;
			producto := producto * i;
		end;
end;
var
	num1,num2,i,producto,suma : integer;
BEGIN
	for i := 1 to 10 do begin
		suma := 0;
		producto := 1;
		readln(num1);
		readln(num2);
		operacion(num1,num2,suma,producto);
		writeln('La suma es: ',suma);
		writeln('El producto es: ',producto);
	end;
END.

