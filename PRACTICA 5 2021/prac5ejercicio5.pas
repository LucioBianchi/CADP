Program Alocacion_Dinamica;
Type
	TEmpleado = record
		sucursal: char;
		apellido: string[25];
		correoElectrónico: string[40];
		sueldo: real;
	end;
	Str50 = string[50];
Var
	alguien: TEmpleado;
	PtrEmpleado: ^TEmpleado;
Begin
	{Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
	Readln( alguien.apellido );
	{Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
	New( PtrEmpleado );
	{¿Cuánta memoria disponible hay ahora? (III)}
	Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );
	Readln( PtrEmpleado^.correoElectrónico, PtrEmpleado^.sueldo );
	{¿Cuánta memoria disponible hay ahora? (IV)}
	Dispose( PtrEmpleado );
	{¿Cuánta memoria disponible hay ahora? (V)}
end.
END.

{TEmpleado: 1 + 26 + 41 + 4 = 72 bytes}

{(I)
  MEMORIA ESTÁTICA: 72 + 4 = 76 bytes
  MEMORIA DINÁMICA: 0
  MEMORIA DISPONIBLE: 400000 bytes
}

{(II)
  MEMORIA ESTÁTICA: 76 bytes
  MEMORIA DINÁMICA: 0
  MEMORIA DISPONIBLE: 400.000 bytes
}

{(III)
  MEMORIA ESTÁTICA: 76 bytes
  MEMORIA DINÁMICA: 72 bytes
  MEMORIA DISPONIBLE: 400.000 - 72 = 399.928 bytes
}

{(IV)
  MEMORIA ESTÁTICA: 76 bytes
  MEMORIA DINÁMICA: 72 bytes
  MEMORIA DISPONIBLE: 400.000 - 72 = 399.928 bytes
}

{(V)
  MEMORIA ESTÁTICA: 76 bytes
  MEMORIA DINÁMICA: 0 bytes
  MEMORIA DISPONIBLE: 400.000 bytes
}
