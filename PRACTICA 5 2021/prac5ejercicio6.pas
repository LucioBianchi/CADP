{6) Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá
tener una longitud máxima de 50 caracteres.}

{a) Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño
de memoria que requiere la estructura.}

Type
	Nombre = String[50];
	ArrNombre = array[1..2500] of Nombre;
	
. Requiere 2500 * 51 bytes = 127500 bytes = 124kb aprox

{b) Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la siguiente
estructura:}

Type 
	Nombre = String[50];
	Puntero = ^Nombre;
	ArrPunteros = array[1..2500] of Puntero;
Var
	Punteros: ArrPunteros;
	
{b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.}

. Tamaño = 2500 * 4 bytes = 10000 bytes

{b.2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
dinámica?}

procedure reservar (var arr : ArrPunteros);
var
	i : integer;
begin
	for i := 1 to 2500 do
		new(arr[i]);
end;

. Despues de ejecutar el módula la memoria es de 2500 * 51 bytes = 124 kb de memoria dinámica

{b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros.}

procedure leer (arr : ArrPunteros); // --> no es necesario pasarlo por referencia, pero ahorra memoria
var
	i : integer;
	n : Nombre
begin
	for i := 1 to 2500 do begin
		read(n);
		arr[i]^ := n;
	end;
end;

// El punto b2 y b3 juntos seria: 

procedure cargar (var arr : ArrPunteros);
var
	i : integer;
	n : Nombre;
begin
	for i := 1 to 2500 do
		new(arr[i]);
		read(n);
		arr[i]^ := n;
end;
