{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada usuario
se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y cantidad de
días desde el último acceso.

a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la revista
Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden ascendente).

b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.

c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}

program punto13prac6;
const
	dimF = 3600;
type
	rango = 1..4;
	usuario = record
		mail : string;
		rol : rango;
		revista : string;
		ultAcceso : integer;
	end;
	vector = array(1..DimF) of usuario;
	lista = ^nodo;
	nodo = record
		nombre : string  
		sig : lista;
	end;
	vectorRol  = array(rango) of integer;

{MODULOS INCISO A}
procedure insertarOrdenado(pri : lista; mai );
var
	nuevo,act,ant : lista;
begin
	new(nuevo);
	
end;

procedure imprimir();

{MODULOS INCISO C}
{INCISO A - hacer lista si revista Economica, insertar ordenado segun dia de acceso}

{INCISO B - vector [1..4] v[i] = v[u.rol]}

{INCISO C - calcular max u.ultAcceso, informar mails}	
var

BEGIN
	
	
END.

