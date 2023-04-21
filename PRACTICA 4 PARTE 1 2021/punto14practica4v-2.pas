program ejercicio14; 
type 
	subrango = 1 .. 1000;
	subrangoRol = 1..5;
		
    participante = record
		pais: string; 
		codigoProyecto: integer;
		nombreProyecto: string;
		rol: subrangoRol;
		cantHoras: real;
	end;
	
	infoTabla = record
		rol: string;
		valorHora: real;
	end;
	
	infoParticipantes = record
		montoInvertido: real; 
		arqui: integer;
	end;
		
	tabla = array [subrangoRol] of infoTabla; //SE DISPONE
	proyectos = array [subrango] of infoParticipantes;
	
	procedure leerPosiciones(var pos: infoTabla); //SE DISPONE
	procedure cargarTabla(var t: tabla); //SE DISPONE
	
	procedure leerParticipante(var p: participante);
	begin
		readln(p.codigoProyecto);
		if (p.codigoProyecto <> -1) then begin
			readln(p.pais);
			readln(p.nombreProyecto);
			readln(p.rol);
			readln(p.cantHoras);
		end;
	end;
	
	procedure inicializarProyectos(var p: proyectos);
	var 
		i: integer;
	begin 
		for i:= 1 to 1000 do begin 
			p[i].montoInvertido:= 0;
			p[i].arqui:= 0;
		end;
	end;
	
	procedure minimo(monto: real; cod: subrango; var codMin: subrango; var min: real);
	begin 
		if (monto < min) then begin
			min:= monto;
			codMin:= cod;
		end;
	end;
	
	procedure recorrer(vProyectos: proyectos);
	var 
		i: integer;
		min: real;
		codMin: subrango;
	begin
		min:= 9999;
		for i:= 1 to 1000 do begin 
			minimo(vProyectos[i].montoInvertido, i, codMin, min);
			writeln('La cantidad de Arquitectos de software del proyecto', i, ' es igual a: ', vProyectos[i].arqui);
		end;
		writeln('El cod de proyecto con menor monto invertido es: ', codMin);
	end;
	
	
	procedure procesarListado(var vProyectos: proyectos; vTabla: tabla; var devsArg, horasDBAdmin: real);
	var 
		p: participante; 
		montoParticipante: real;
	begin 
		horasDBAdmin:= 0;
		devsArg:= 0;
		leerParticipante(p);
		while (p.codigoProyecto <> -1) do begin 
			montoParticipante:= p.cantHoras * vTabla[p.rol].valorHora;
			
			//inciso A
			if(p.pais = 'Argentina') then
				devsArg:= devsArg + montoParticipante;
				
			//inciso B
			if (p.rol = 3) then 
				horasDBAdmin:= horasDBAdmin + p.cantHoras;
			
			//inciso C
			vProyectos[p.codigoProyecto].montoInvertido := vProyectos[p.codigoProyecto].montoInvertido + montoParticipante; 
			
			//inciso D
			if (p.rol = 4) then 
				vProyectos[p.codigoProyecto].arqui:= vProyectos[p.codigoProyecto].arqui + 1; 
			
			leerParticipante(p);
		end;
	end;
	
	var 
		t: tabla;
		vProyectos: proyectos;
		devsArg, horasDBAdmin: real;
	begin 
		cargarTabla(t); //SE DISPONE
		inicializarProyectos(vProyectos);
		procesarListado(vProyectos, t, devsArg, horasDBAdmin);
		writeln('El monto invertido en devs argentinos es: ' devsArg);
		writeln('La cantidad de horas de DB Admin es igual a: ' horasDBAdmin);
		recorrer(vProyectos);
	end.
