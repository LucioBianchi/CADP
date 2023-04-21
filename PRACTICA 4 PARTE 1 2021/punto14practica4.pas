{Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:

a) El monto total invertido en desarrolladores con residencia en Argentina.

b) La cantidad total de horas trabajadas por Administradores de bases de datos.

c) El código del proyecto con menor monto invertido.

d) La cantidad de Arquitectos de software de cada proyecto.}


program punto14practica4;

const
	dF = 1000;
type
	participante = record
		pais : string;
		cod : integer;
		nombre : string;
		rol : integer;
		horas : integer;
	end;
	vector = array[1..dF] of participante
var;


BEGIN
	
	
END.
{PROPUESTA -- creo que se lee unicamente un trabajador por proyecto, porque sino no se sabe cuando se dejan de leer trabajadores}
{while (cod <> -1 and dl < dF) 
		while ((cod <> -1) and (codActual = p.cod)) do begin
			leer(desarroladores);
		end;}
