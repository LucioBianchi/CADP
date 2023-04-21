{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:

a) Título de la foto más vista (la que posee mayor cantidad de clics).

b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.

c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

program punto11practica4;

const
	dF = 2;
type
	fotos = record
		titulo : string;
		autor : string;
		mg : integer;
		clics : integer;
		comentarios : integer;
	end;
	vector = array [1..dF] of fotos;

procedure leer (var f : fotos);
begin
	write('Ingresar titulo de la foto: ');
	readln(f.titulo);
	write('Ingresar autor de la foto: ');
	readln(f.autor);
	write('Ingresar cantidad de "Me gusta": ');
	readln(f.mg);
	write('Ingresar cantidad de clics: ');
	readln(f.clics);
	write('Ingresar cantidad de comentarios: ');
	readln(f.comentarios);
end;

procedure cargar (var v : vector);
var
	i : integer;
begin
	for i := 1 to dF do begin
		writeln('FOTO NUMERO: ',i);
		leer(v[i]);
	end;
end;

procedure fotoMasVista(clics : integer; titulo : string; var masVista : string; var max : integer);
begin
	if clics > max then begin
		max := clics;
		masVista := titulo;
	end;
end;

procedure meGustaRecibidos (MG : integer; autor : string; var cantMG : integer; fotografo : string);
begin
	if (autor = fotografo) then cantMG := cantMG + MG;
end;

var
	vfotos : vector;
	i,max,cantMG : integer;
	masVista,fotografo : string;
BEGIN
	max := -1;
	cantMG := 0;
	fotografo := 'Art Vandelay';
	masVista := '---';
	cargar(vfotos);
	for i := 1 to dF do begin
		fotoMasVista(vfotos[i].clics,vfotos[i].titulo,masVista,max);
		meGustaRecibidos(vfotos[i].mg,vfotos[i].autor,cantMG,fotografo);
		writeln('');
		writeln('Cantidad de comentarios en la foto ',vfotos[i].titulo,' es: ',vfotos[i].comentarios);
	end;
	writeln('');
	writeln('----- RESULTADOS OBTENIDOS -----');
	writeln('La foto mas vista es: ',masVista,' ,con ',max,' vistas');
	writeln('Cantidad de MG en las fotos de ',fotografo,': ',cantMG);
END.

