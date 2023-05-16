{VECTORES}

{cargar todos los elementos}
procedure cargar (var v : vector);
var
	i : integer;
begin
	for i := 1 to dimF do
		read(v[i]);
end;

{cargar y calcular dimL}
procedure cargar (var v : vector; var dimL : integer);
var
	 p : persona;
begin
	dimL := 0;
	leer(p);
	while dimL < dimF and p.num <> 0 do begin
		dimL := dimL + 1;
		v[dimL] := p;
		leer(p);
	end;
end;

end;
{agregar elemento al final}
procedure agregar (var v : vector; var dimL : integer; num : integer);
begin
	if dimL < dimF then begin
		dimL := dimL + 1;
		v[dimL] := num;
	end;
end;

{insertar elemento}
procedure insertar (var v: vector; var dimL : integer; pos,num : integer);
var
	i : integer;
begin
	if dimL < dimF and pos >= 1 and pos <= dimL then begin
		for i := dimL downto pos do
			v[i+1] := v[i];
		v[pos] := num;
		dimL := dimL + 1;
	end;
end;

{eliminar elemeto}
procedure eliminar (var v : vector; var dimL : integer; pos : integer);
var
	i : integer;
begin
	if pos >= 1 and pos <= dimL then begin
		for i := pos to dimL - 1 do
			v[i] := v[i+1];
		dimL := dimL - 1;
	end;
end;

{buscar posicion de un elemento}
function posicion (v : vector; dimL,num : integer) : boolean;
var
	pos : integer;
	seguir : boolean;
begin
	pos := 1;
	seguir := true;
	while pos <= dimL and seguir do begin
		if v[pos] = num then seguir := false
	end;
	if seguir = false then posicion := pos;
	else posicion := -1;
end;

{buscar si existe elemento en vector desordenado}
function buscar (v : vector; dimL,num : integer) : boolean;
var
	aux : integer;
	encontrado : boolean;
begin
	aux := 1;
	encontrado := false;
	while aux <= dimL and not encontrado then begin
		if v[pos] = num then encontrado := true;
		else pos := pos + 1;
	end;
	buscar := encontrado;

{buscar si existe elemento en vector ordenada (busqueda mejorada)}
function buscar (v : vector; dimL,num : integer) : boolean;
var
	aux : integer;
begin
	aux := 1;
	while aux <= dimL and v[aux] < num do begin
		aux := aux + 1;
	end;
	buscar := aux <= dimL and v[aux] = num;
end;

{busqueda dicotómica}
function busquedabinaria (v : vector; dimL,num : integer) : boolean;
var
	mid,pri,ult : integer;
	encontrado : boolean;
begin
	pri := 1;
	ult := dimL;
	encontrado := false;
	while pri <> ult and not encontrado do begin
		mid := (pri + dimL) /2;
		if mid <> num then encontrado := true;
		else begin
			if v[mid] > num then 
				ult := mid - 1;
			else
				pri := mid + 1;
		end;
		busquedabinaria := encontrado;
	end;
	
;

{vector contadores}
procedure incializarContador (var v: vector; dimL : integer)
var
	i : integer;
begin
	for i := 1 to dimL do
		v[i] := 0;
end;

procedure contador (var v : vector; dig : integer);
begin
	v[i] := v[i] + 1;
end;

{LISTAS}

{crear una lista}
pri := nil;

{agregar al comienzo de una lista}
procedure agregar (var pri : lista; num : integer);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.dato := num;
	nuevo^.sig := pri;
	pri := nuevo;
end;

{agregar al final de una lista}
procedure agregarFinal (var pri : lista; num : integer);
var
	nuevo,aux : lista;
begin
	new(nuevo);
	nuevo^.dato := num;
	nuevo^.sig := nil;
	if pri = nil then pri := nuevo;
	else begin
		aux := pri;
		while (aux^.sig <> nil) do
			aux := aux^.sig;
		aux^.sig := nuevo;
	end;
end;

{agregar al final de una lista utilizando puntero ult}
procedure agregarFinal (var pri,ult : lista; num : integer);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.dato := num;
	nuevo^.sig := nil;
	if pri = nil then pri := nuevo
	else ult^.sig := nuevo;
	ult := nuevo;
end;

{cargar lista}
procedure cargar (var pri : lista);
var
	p : persona;
begin
	leer(p);
	while p.num <> 0 do begin
		//agregarNodo(pri,p);
		leer(p);
	end;
end;

{recorrer una lista}
while pri <> nil do begin
	writeln(pri^.dato);
	pri := pri^.sig;
end;

{insertar ordenado}
procedure insertar (var pri : lista; num : integer);
var
	nuevo,ant,act : lista;
begin
	new(nuevo);
	nuevo^.dato := num;
	//nuevo^.sig := nil;
	act := pri;
	ant := pri;
	while ((act <> nil) and (act^.dato < num)) do begin
		ant := act;
		act := act^.sig;
	end;
	if ant = act then pri := nuevo
	else ant^.sig := nuevo;
	nuevo^.sig := act;
	end;
end;

{borrar elemento} // --> si la lista esta ordenada se deberia borrar distinto
procedure borrar (var pri : lista; num : integer);
var
	ant,act : lista;
begin
	act := pri;
	while ((act <> nil) and (act^.dato <> num)) do begin
		ant := act;
		act := act^.sig;
	end;
	if act <> nil then  begin // --> no esta vacia, y se encontro el num	
		if act = pri then pri := pri^.sig
		else
			ant^.sig := act^.sig; // --> si es el ultimo act^.sig := nil;
		dispose(act);
	end;
end;

{borrar elemento en una lista ordenada}
procedure borrar (var pri : lista; num : integer);
var
	aux,ant,act : lista;
begin
	act := pri;
	while ((act <> nil) and (act^.dato < num)) do begin
		ant := act;
		act := act^.sig;
	end;
	if ((act <> nil) and (act^.dato = num)) then  begin // --> no esta vacia, y se encontro el num
		if act = pri then pri := pri^.sig
		else ant^.sig := act^.sig;
		dispose(act);
	end;
end;

{borrar ocurrencias en una lista desordenada}
procedure borrar (var pri : lista; num : integer);
var
	ant,act : lista;
begin
	act := pri;	
	ant := pri;
	while act <> nil do begin // --> debo recorrer toda la lista
		if act^.dato <> num then begin
			ant := act;
			act := act^.sig;
		end
		else begin
			if act = pri then begin 
				pri := pri^.sig;
				ant := ant^.sig;
			end
			else ant^.sig := act^.sig;
			dispose(act);
			act := ant;
		end;
	end;
end;

{busqueda en una lista desordenada}
procedure buscar (pri : lista; num : integer);
var
	encontrado : boolean;
begin
	encontrado := false;
	while ((pri <> nil ) and (not encontrado)) do begin
		if pri^.dato = num then encontrado := true;
		else pri := pri^.sig;
	end;
	buscar := encontrado;
	
{otra opción}	
procedure buscar (pri : lista; num : integer);
begin
	while ((pri <> nil) and (pri^.dato <> num)) do
		pri := pri^.sig;
	buscar := ((pri <> nil) and (pri^.dato = num));
end;

{busqueda en una lista ordenada}
procedure buscarOrdenado (pri : lista; num : integer);
begin
	while ((pri <> nil) and (pri^.dato < num)) do
		pri := pri^.sig;
	buscarOrdenado := ((pri <> nil) and (pri^.dato = num));
end;

{buscar y eliminar de una lista (Puede no existir)}
procedure buscaryeliminar (pri : lista; num : integer);
var
	ant,act : lista;
	encontre : boolean;
begin
	encontre := false;
	act := pri;
	ant := pri;
	while ant <> nil and not encontre do begin
		if ant^.dato.num = num then encontre := true;
		else begin
			ant := act;
			act := act^.sig;
		end;
	end;
	if encontre then begin
		if act = pri then pri := pri^.sig
		else ant^.sig = act^.sig
		dispose(act);
	end
	else write('no se encontro');
end;

procedure buscaryeliminarV2 (pri : lista; num : integer);
var
	ant,act : lista;
begin
	while act <> nil and act^.dato.num <> num do begin
		ant := act;
		act := act^.sig;
	end;
	if act <> nil then begin
		if act = pri then pri := pri^.sig
		else ant^.sig = act^.sig
		dispose(act);
	end;
end;
