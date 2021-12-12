% 1
invierte_digitos(X,Y):-
    var(Y),
    invierte_digitos(X,0),
    !.
invierte_digitos(X,Y):-
    =<(X,0),
    writeln(Y),
    !.
invierte_digitos(X,Y):-
    is(Y1,+(Y,*(mod(X,10),^(10,floor(/(log(X),log(10))))))),
    is(X1,//(X,10)),
    invierte_digitos(X1,Y1).

% 2
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

% 3
contarParImpar(X,P,I):-
    (   var(P);var(I)),
    contarParImpar(X,0,0).
contarParImpar(X,P,I):-
    =<(X,0),
    write("P: "),
    writeln(P),
    write("I: "),
    writeln(I),
    !.
contarParImpar(X,P,I):-
    is(X1,mod(X,10)),
    is(X2,mod(X1,2)),
    =:=(X2,0),
    is(X3,//(X,10)),
    is(P1,+(P,1)),
    contarParImpar(X3,P1,I).
contarParImpar(X,P,I):-
    is(X1,//(X,10)),
    is(I1,+(I,1)),
    contarParImpar(X1,P,I1).

% 4
eliminar_digito(A,B,X):-
    var(X),
    abolish(posicion,1),
    assert(posicion(0)),
    eliminar_digito(A,B,0).
eliminar_digito(A,_,X):-
    =<(A,0),
    writeln(X),
    !.
eliminar_digito(A,B,X):-
    is(A1,mod(A,10)),
    \==(A1,B),
    posicion(P),
    is(X1,+(X,*(A1,^(10,P)))),
    is(P1,+(P,1)),
    abolish(posicion,1),
    assert(posicion(P1)),
    is(A2,//(A,10)),
    eliminar_digito(A2,B,X1).
eliminar_digito(A,B,X):-
    is(A1,//(A,10)),
    eliminar_digito(A1,B,X).

% 5
nuevos_enteros(X,A,B):-
    (   var(A),var(B)),
    =(A,[]),
    =(B,[]),
     nuevos_enteros(X,A,B).
nuevos_enteros(X,A,B):-
    =<(X,0),
    writeln(A),
    writeln(B),
    !.
nuevos_enteros(X,A,B):-
    is(X1,mod(X,10)),
    is(X2,mod(X1,2)),
    =:=(X2,0),
    is(X3,//(X,10)),
    =(A1,[X1|A]),
    nuevos_enteros(X3,A1,B).
nuevos_enteros(X,A,B):-
    is(X1,//(X,10)),
    is(X2,mod(X,10)),
    =(B1,[X2|B]),
    nuevos_enteros(X1,A,B1).
