program punto4practica3;

type
	cliente = record
		codigo : integer;
		cantlineas : integer;
	end;
	linea = record
		num : integer;
		mb : integer;
		minutos : integer;
	end;
	
procedure leerLinea(var l : linea);
begin
	writeln('Ingresar numero, mb y minutos de la linea');
	readln(l.num);
	readln(l.mb);
	readln(l.minutos);
end;

procedure leerCliente (var c : cliente);
begin
	writeln('Ingresar codigo del cliente y cantidad de lineas a su nombre');
	readln(c.codigo);
	readln(c.cantlineas);
end;

procedure infoCliente (cantlineas : integer; var cantmin,cantmb : integer);
var
	l : linea;
	i : integer;
begin
	cantmb := 0;
	cantmin := 0;
	for i := 1 to cantlineas do begin
		leerLinea(l);
		cantmb := cantmb + l.mb;
		cantmin := cantmin + l.minutos;
	end;
end; 

var 
	c : cliente;
	mb,minutos,i : integer;
	total : real;
BEGIN
	
	for i := 1 to 3 do begin
		total := 0;
		minutos := 0;
		mb := 0;
		leerCliente(c);
		infoCliente (c.cantlineas,minutos,mb);
		writeln('Cantidad de minutos : ',minutos);
		writeln('Cantidad de mb : ',mb);
		total := minutos * 1.35 * mb * 3.40;
		writeln('Cantidad total a facturar : $',total:0:2);
		writeln();
	end;
	
END.
