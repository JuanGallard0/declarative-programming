% Desplegar los elementos de una lista:

%?- desplegar([a, b, c, d]).

desplegar([]):- !.

desplegar([Cab|Col]):-
    writeln(Cab),
    desplegar(Col).


% Desplegar los elementos de una lista en
% forma inversa:

%?- desplegar2([a, b, c, d]).

desplegar2([]):- !.

desplegar2([Cab|Col]):-
    desplegar2(Col),
    writeln(Cab).


% Llenar una lista con los valores de 1 a N:

llenar1aN(0, []):- !.

llenar1aN(N, [N|Laux]):-
    %>(N, 0),
    is(N2, -(N, 1)),
    llenar1aN(N2, Laux).
    %=(L, [N|Laux]).

% Llenar la lista al revés de la anterior:



% Llenar una lista con numeros provenientes desde teclado:

llenaT(R):-
    llenarT([], R).

llenarT(L, Lf):-
    writeln('Digite un número o n para terminar: '),
    read(R),
    insertar(R, L, Lf).

insertar(n, L, L):- !.

insertar(N, L, Lf):-
    llenarT([N|L], Lf).

% Mostrar los elementos de una lista que puede contener
% sublistas en su interior. Cada elemento debe desplegarse
% en forma individual:

desplegar3([]):- !.

desplegar3([Cab|Col]):-
    is_list(Cab),
    desplegar3(Cab),
    desplegar3(Col), !.

desplegar3([Cab|Col]):-
    writeln(Cab),
    desplegar3(Col).

% Eliminar un elemento particular de una lista:



% Eliminar todas las ocurrencias de un elemento particular
% de una lista:

eliminarT(_, [], []):- !.

eliminarT(Elto, [Cab|Col], [Cab|ColAux]):-
    =\=(Cab, Elto),
    eliminarT(Elto, Col, ColAux), !.

eliminarT(Elto, [Cab|Col], ColAux):-
    ==(Cab, Elto),
    eliminarT(Elto, Col, ColAux).

% Contar la cantidad de elementos de una lista:


