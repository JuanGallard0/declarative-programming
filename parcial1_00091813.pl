% EJERCICIO 1

par_o_non(A,B):-
    jugar(A1,B1,R),
    write(A),
    write(" saca "),
    writeln(A1),
    write(B),
    write(" saca "),
    writeln(B1),
    resultado(A,B,R).

jugar(A,B,R):-
    random(0,6,A),
    random(0,6,B),
    is(R,+(A,B)).

resultado(_,_,R):-
    =:=(R,0),
    writeln("Hay empate").
resultado(A,_,R):-
    is(R1,mod(R,2)),
    =:=(R1,0),
    write(A),
    writeln(" ha ganado").
resultado(_,B,_):-
    write(B),
    writeln(" ha ganado").


% EJERCICIO 3
%  PS: no se porque me devuelve varios resultados de X diferentes, solo
%  el primero sale correcto

problema3(N,X):-
    var(X),
    abolish(posicion,1),
    assert(posicion(0)),
    problema3(N,0).
problema3(N,X):-
    =<(N,0),
    write("X= "),
    writeln(X),
    !.
problema3(N,X):-
    is(N1,mod(N,10)), % extraer último digito
    is(N2,mod(N1,2)), % modulo para verificar paridad
    is(N3,//(N,10)),  % quitar último digito
    =:=(N2,0),
    posicion(P),      % posición del dígito
    is(X1,+(X,*(+(N1,1),^(10,P)))),
    is(P1,+(P,1)),
    abolish(posicion,1),
    assert(posicion(P1)),
    problema3(N3,X1).
problema3(N,X):-
    is(N1,mod(N,10)),
    is(N2,//(N,10)),
    posicion(P),
    is(X1,+(X,*(-(N1,1),^(10,P)))),
    is(P1,+(P,1)),
    abolish(posicion,1),
    assert(posicion(P1)),
    problema3(N2,X1).
