% TAREA 2
% CANTIDAD DE INTEGRANTES: 2
% Juan Humberto Gallardo Hernández 00091813
% Mario Andrés Cálix Sosa 00309119

% Ejercicio 1

% d X
d(X, X, 1):-
    atom(X),
    not(number(X)),
    !.
% d C
d(X, C, 0):-
    atom(X),
    not(number(X)),
    number(C),
    !.
% d C*X
d(X, C*X, C):-
    atom(X),
    not(number(X)),
    number(C),
    !.
% d A^X
d(X, A^X, A^X*log(A)):-
    atom(X),
    not(number(X)),
    number(A),
    !.
% d X^N
d(X, X^N, N*(X^(N1))):-
    atom(X),
    not(number(X)),
    number(N),
    =(N1, -(N, 1)),
    !.
% d X^(1/N)
d(X,  X^(1/N), 1/(N*((X)^(N1/N)))):-
    atom(X),
    not(number(X)),
    number(N),
    is(N1, -(N, 1)),
    !.
d(X, X^(1/N), 1/(N*(((X)^Ne)))):-
    atom(X),
    not(number(X)),
    number(N),
    is(N1, -(N, 1) ),
    =(Ne, /(N1, N)), !.
% d Fx + Gx
d(X,A+B,DA+DB):-
    d(X,A,DA),
    d(X,B,DB).
% d Fx - Gx
d(X,A-B,DA-DB):-
    d(X,A,DA),
    d(X,B,DB).
% d Fx * Gx
d(X,A*B,DA*B+DB*A):-
    d(X,A,DA),
    d(X,B,DB).
% d Fx / Gx
d(X,A/B,(DA*B-DB*A)/B*B):-
    d(X,A,DA),
    d(X,B,DB).

% d acos(Fx)
d(X,acos(Fx),-(DX/sqrt(1-Fx^2))):-
    d(X,Fx,DX).
% d atan(Fx)
d(X,atan(Fx),DX/(1+Fx^2)):-
    d(X,Fx,DX).
% d acosec(Fx)
d(X,acosec(Fx),-(DX/(Fx*sqrt(Fx^2-1))) ):-
    d(X,Fx,DX).
% d asec(Fx)
d(X,asec(Fx),DX/(Fx*sqrt(Fx^2-1))):-
    d(X,Fx,DX).
% d acot(Fx)
d(X,acot(Fx),-(DX/(1+Fx^2)) ):-
    d(X,Fx,DX).


% Ejercicio 2

ejercicio2(X,Y):-
    open('lista_numeros.txt', read, Valores),
    llenar_lista(Valores, L),close(Valores),
    cantidades(L,X,Y),
    grabar_en_archivo(X,Y).

llenar_lista(Flujo, L):-
    read(Flujo, Dato),
    (
        \==(Dato, end_of_file),
        llenar_lista(Flujo, L2),
        =(L, [Dato|L2])
        ;
        ==(Dato, end_of_file),
        =(L, [ ])
    ),
    !.

cantidades([ ], 0, 0).
cantidades([Cab|Col], X, Y):-
    cantidades(Col, X1, Y),
    % verificar si es par
    is(Cab1,mod(Cab,2)),
    =:=(Cab1,0),
    is(X, +(X1, 1)),
    !.
cantidades([_|Col], X, Y):-
    cantidades(Col, X, Y1),
    is(Y, +(Y1, 1)).

grabar_en_archivo(X,Y):-
    open('total_cont.txt', write, Cantidades),
    write(Cantidades, X),
    write(Cantidades, '.'),
    write(Cantidades, '\n'),
    write(Cantidades,Y),
    write(Cantidades, '.'),
    close(Cantidades).
