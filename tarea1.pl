% TAREA 1
% CANTIDAD DE INTEGRANTES: 2
% Juan Humberto Gallardo Hernández 00091813
% Mario Andrés Cálix Sosa 00309119

% ejercicio 1

contar_ocurrencias(0,_,0):-
    !.
contar_ocurrencias(X,Y,N):-
    is(X1,mod(X,10)),
    =:=(X1,Y),
    is(X2,//(X,10)),
    contar_ocurrencias(X2,Y,N1),
    is(N,+(N1+1)),
    !.
contar_ocurrencias(X,Y,N):-
    is(X1,//(X,10)),
    contar_ocurrencias(X1,Y,N).

% ejercicio 2

eliminar_digito(0,_,0):-
    !.
eliminar_digito(A,B,X):-
    is(A1,mod(A,10)),
    \==(A1,B),
    is(A2,//(A,10)),
    eliminar_digito(A2,B,X1),
    is(X,+(A1,*(X1,10))),
    !.
eliminar_digito(A,B,X):-
    is(A1,//(A,10)),
    eliminar_digito(A1,B,X).

% ejercicio 3

invierte_digitos(0,0):-
    !.
invierte_digitos(X,Y):-
    is(X1,mod(X,10)),
    is(X2,//(X,10)),
    invierte_digitos(X2,Y1),
    is(Y,+(Y1,*(X1,^(10,floor(/(log(X),log(10))))))).

% ejercicio 4

corredor(tato).
corredor(milo).
corredor(jose).
corredor(chepe).

corredores([A,B,C,D]):-
    =(L,[A,B,C,D]),
    corredor(A),
    corredor(B),
    corredor(C),
    corredor(D),
    all_diff(L).

all_diff(L) :- \+ (select(X,L,R), memberchk(X,R)).

orden_llegada([A,B,C,D]):-
    =(L,[A,B,C,D]),
    % tato llego inmediatamente despues de milo
    nextto(milo,tato,L),
    % chepe no fue el primero en llegar
    nth0(0,L,E),
    \==(E,chepe),
    % jose supero a milo
    select(tato,L,L1),
    select(chepe,L1,L2),
    nextto(jose,milo,L2).

carrera([A,B,C,D]):-
    =(L,[A,B,C,D]),
    corredores(L),
    orden_llegada(L).

% La consulta "carrera([A,B,C,D])." devuelve dos respuestas
% donde A representa el primero en llegar y D el último.
% Concluímos que existe más de una respuesta que cumple
% con las características.





