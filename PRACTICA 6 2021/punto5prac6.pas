{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:

a. Porcentaje de productos con stock actual por debajo de su stock mínimo.

b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.

c. Código de los dos productos más económicos.}

//No se sabe cuantos productos se leen, por lo que se usa una lista

program punto5prac6;
type
	producto = record
		codigo: integer;
		descripcion: string;
		actual: integer;
		minimo: integer;
		precio: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig : lista;
	end;
	lista2 = ^nodo2;
	nodo2 = record
		dato:string;
		sig: lista2;
	end;

procedure leer (var p : producto);
begin
	write('Ingresar codigo del producto: ');
	readln(p.codigo);
	while p.codigo <> - 1 do begin
		write('Ingresar descripcion: ');
		readln(p.descripcion);
		write('Ingresar stock actual: ');
		readln(p.actual);
		write('Ingresar stock minimo: ');
		readln(p.minimo);
		write('Ingresar precio: ');
		readln(p.precio);
	end;
end;

{MODULOS PRINCIPALES}

procedure agregarAlFinal (var pri,ult : lista; p : producto);
var
	nuevo : lista;
begin
	new(nuevo); 
	nuevo^.dato := p;
	nuevo^.sig := nil;
	if (pri = nil) then pri := nuevo
	else ult^.sig := nuevo;
	ult := nuevo;
end;

procedure agregarAlFinal2 (var pri,ult : lista2; s : string);
var
	nuevo : lista2;
begin
	new(nuevo); 
	nuevo^.dato := s; 
	nuevo^.sig := nil;
	if (pri = nil) then pri := nuevo
	else ult^.sig := nuevo;
	ult := nuevo;
end;

procedure cargarLista (var pri,ult : lista);
var
	p : producto;
begin
	writeln('---INGRESAR INFO DEL PRODUCTO---');
	leer(p);
	while (p.codigo <> -1) do begin
		agregarAlFinal(pri,ult,p);
		writeln('---INGRESAR INFO DEL PRODUCTO---');
		leer(p);
	end;
end;

{INCISO A}

procedure contarTotal (var total : integer);
begin
	total := total + 1;
end;

function porcentaje (cant,total: integer) : real;
begin
	porcentaje := cant / total * 100;
end;

procedure incisoa (actual, minimo : integer ; var cant: integer);

begin
	if actual < minimo then cant := cant + 1;
end;

{INCISO B}

function esPar (num : integer) : boolean;
begin
	esPar := ((num mod 2) = 0);
end;

procedure tresPares (codigo : integer; descripcion : string; var pri2,ult2 : lista2);
var
	digpar : integer;
begin
	digpar := 0;
	while codigo <> 0 do begin
		if (esPar(codigo mod 10)) then digpar := digpar + 1;
		codigo := codigo div 10;
	end;
	if digpar >= 3 then agregarAlFinal2 (pri2,ult2,descripcion);
end;	

procedure imprimirLista (pri : lista2);
begin
	while pri <> nil do begin
		writeln(pri^.dato);
		pri := pri^.sig;
	end;
end;

{INCISO C}

procedure minimos (cod : integer ;precio : real; var mincod1,mincod2 : integer; minp1,minp2 : real);
begin
	if precio < minp1 then begin
		mincod2 := mincod2;
		minp2 := minp1;
		mincod1 := cod;
		minp1 := precio;
	end
	else if precio < minp2 then begin
		mincod2 := cod;
		minp2 := precio;
	end;
end;

var
	pri,ult,aux : lista;
	pri2,ult2 : lista2;
	cant,total,mincod1,mincod2 : integer;
	minp1,minp2 : real;
BEGIN
	pri := nil; pri2 := nil;
	cant := 0;
	total := 0;
	minp1 := 9999;
	minp2 := 9999;
	cargarLista(pri,ult);
	aux := pri;
	while aux <> nil do begin
		contarTotal(total);
		incisoa(aux^.dato.actual,aux^.dato.minimo,cant);
		trespares(aux^.dato.codigo,aux^.dato.descripcion,pri2,ult2);
		minimos(aux^.dato.codigo,aux^.dato.precio,mincod1,mincod2,minp1,minp2);
		aux := aux^.sig;
	end;
	{inciso a}
	writeln('Porcentaje de producto con stock actual por debajo del minimo: %', porcentaje(cant,total):0:2);
	{inciso b}
	writeln('Descripciones de productos con codigos compuestos por al menos 3 digitos pares: ');
	imprimirLista(pri2);
	{inciso c}
	writeln('Codigos de los productos mas economicos: ',mincod1,' ',mincod2);
END.

