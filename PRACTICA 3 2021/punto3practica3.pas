program punto3practica4;

type
	escuela = record
		cue : integer;
		nombre : string;
		docentes : integer;
		alumnos : integer;
		localidad : string;
	end;
	
procedure leerEscuela (var e : escuela);
begin
	readln(e.cue);
	readln(e.nombre);
	readln(e.docentes);
	readln(e.alumnos);
	readln(e.localidad);
end;

function cociente (alumnos : integer; docentes : integer) : real;
begin
	cociente := alumnos / docentes;
end;

procedure mejorCue ( cue : integer; nombre : string ; cociente: real; var min1,min2 : real; var mincue1,mincue2 : integer; var nombre1,nombre2 : string);
begin
	if cociente < min1 then begin
		mincue2 := mincue1;
		min2 := min1;
		nombre2 := nombre1;
		mincue1 := cue;
		min1 := cociente;
		nombre1 := nombre;
	end
	else if cociente < min2 then begin
		min2 := cociente;
		mincue2 := cue;
		nombre2 := nombre;
	end;
end;

function esLaPlata (localidad : string) : boolean;
begin
	esLaPlata := (localidad = 'La Plata');
end;

var
	esc : escuela;
	i,mincue1,mincue2,cant : integer;
	min1,min2,coc : real;
	nombre1,nombre2 : string;
BEGIN
	cant := 0;
	min1 := 32767;
	min2 := 32767;
	nombre1 := '---';
	nombre2 := '---';
	mincue1 := -1;
	mincue2 := -1;
	for i := 1 to 2400 do begin
		writeln('Ingresar cue, nombre, docentes, alumnos y localidad de la escuela: ');
		leerEscuela(esc);
		coc := cociente(esc.alumnos,esc.docentes);
		if ((coc < 23.435) and (esLaPlata(esc.localidad))) then cant := cant + 1;
		mejorCue(esc.cue,esc.nombre,coc,min1,min2,mincue1,mincue2,nombre1,nombre2);
	end;
	writeln('Cantidad de escuelas de La Plata con relación de alumnos por docente superior a la sugerida por UNESCO: ',cant);
	writeln('Escuelas con mejor relacion docente-alumno: ',mincue1,' ',nombre1,' -- ',mincue2,' ',nombre2);
	
END.
