% Ejercicio 1

asignar_bebida([1,X,Y],[[1,X,Y],_,_,_]).
asignar_bebida([2,X,Y],[_,[2,X,Y],_,_]).
asignar_bebida([3,X,Y],[_,_,[3,X,Y],_]).
asignar_bebida([4,X,Y],[_,_,_,[4,X,Y]]).

que_bebieron(W):-
    =(W,[[1,_,_],[2,_,_],[3,_,_],[4,_,_]]),
    asignar_bebida([A,angel,_],W),
    asignar_bebida([B,boris,_],W),
    asignar_bebida([C,cesar,_],W),
    asignar_bebida([D,diego,_],W),
    asignar_bebida([X,_,tequila],W),
    asignar_bebida([Y,_,vino],W),
    asignar_bebida([Z,_,cerveza],W),
    asignar_bebida([K,_,champana],W),
    % Angel se sentó un puesto a la derecha del que bebió tequila
    succ(X,A),
    % Los que bebieron vino y cerveza no se sentaron a la par
    not(succ(Y,Z);succ(Z,Y)),
    % El que bebió champaña estaba en uno de los extremos de la barra
    (=:=(K,1);=:=(K,4)),
    % Diego y quien bebió vino se sentaron en asientos contiguos
    (succ(D,Y);succ(Y,D)),
    % Cesar se sentó inmediatamente a la derecha de Angel.
    succ(A,C),
    % Boris no bebio cerveza.
    =\=(B,Z).


% Ejercicio 2

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
% d log(X)
d(X, log(X), 1/X):-
    atom(X),
    not(number(X)),
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
% d -Fx
d(X,-A,-DA):-
    d(A,X,DA).
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
    A \== 1,
    d(X,A,DA),
    d(X,B,DB).

% d asinh(X)
d(X,asinh(Fx),DX/(sqrt(+(X^(2),1)))):-
    d(X,Fx,DX).


% Ejercicio 3

ejercicio3(X,Y):-
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
    >=(Cab,0),
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




