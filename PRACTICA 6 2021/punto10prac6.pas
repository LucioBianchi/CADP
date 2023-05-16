{10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un número
(que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su número,
en cuyo caso sale de la lista de espera. Se pide:

a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.

b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes
en espera, asigna un número al cliente y retorna la lista de espera actualizada.

c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna
el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista
de espera.

d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán todos
los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a uno por
vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.}

program punto10prac6;
type
	cliente = record
		dni : integer;
		num : integer;
	end;
	lista = ^nodo;
	nodo = record
		dato : cliente;
		sig : lista;
	end;

{INCISO B}
procedure RecibirCliente (var pri : lista; dni : integer);
var
	nuevo,ant : lista;
begin
	new(nuevo);
	nuevo^.dato.dni := dni;
	nuevo^.dato.num := 1;
	nuevo^.sig := nil;
	ant := pri;
	if pri = nil then pri := nuevo
	else begin
		while ant^.sig <> nil do begin
			ant := ant^.sig;
		end;
		ant^.sig := nuevo;
		nuevo^.dato.num := ant^.dato.num + 1;
	end;
end;

{INCISO C} // Se entiende en la consigna que se elimina el 1er cliente
procedure AtenderCliente (var pri : lista; var c : cliente);
var
	aux : lista;
begin
	aux := pri;
	c := pri^.dato;
	pri := pri^.sig;
	dispose(aux);
end;

var
	pri : lista;
	i,dni,cantClientes : integer;
	c : cliente;
BEGIN
	cantClientes := 0;
	pri := nil;
	write('Ingresar DNI del cliente: ');
	readln(dni);
	while dni <> 0 do begin
		cantClientes := cantClientes + 1;
		RecibirCliente(pri,dni);
		write('Ingresar DNI del cliente: ');
		readln(dni);
	end;
	for i := 1 to cantClientes do begin
		AtenderCliente(pri,c);
		writeln('DATOS DEL CLIENTE Numero ',i);
		writeln('DNI del cliente: ',c.dni);
		writeln('NUMERO del cliente: ',c.num);
	end;
	
END.
