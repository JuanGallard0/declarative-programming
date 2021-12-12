% Vamos a considerar también el sexo de cada
% persona que esta considerada en la BC.
sexo(josefina, f).
sexo(silvia, f).
sexo(ligia, f).
sexo(marina, f).
sexo(regina, f).
sexo(jacinta, f).
sexo(manuel, m).
sexo(mario, m).
sexo(julio, m).
sexo(jaime, m).
sexo(carlos, m).

madre(josefina, mario).
madre(josefina, ligia).
madre(silvia, marina).
madre(silvia, jaime).
madre(silvia, carlos).
madre(ligia, regina).
madre(ligia, jacinta).

padre(manuel, mario).
padre(manuel, ligia).
padre(mario, marina).
padre(mario, jaime).
padre(mario, carlos).
padre(julio, regina).
padre(julio, jacinta).


abuelo(X, Y) :- padre(X, P), padre(P, Y).
abuela(X, Y) :- madre(X, P), padre(P, Y).

abuelo(X, Y) :- padre(X, M), madre(M, Y).
abuela(X, Y) :- madre(X, M), madre(M, Y).

% Abuelos(X, Y):- abuelo(X, Y) ; abuela(X, Y).

abuelos(X, Y):- abuelo(X, Y).
abuelos(X, Y):- abuela(X, Y).


% Regla hermano (No medios hermanos):

hermano(X, Y):-
    sexo(X, m),
    padre(P, X),
    padre(P, Y),
    madre(M, X),
    madre(M, Y),
    \==(X, Y).

hermana(X, Y):-
    sexo(X, f),
    padre(P, X),
    padre(P, Y),
    madre(M, X),
    madre(M, Y),
    \==(X, Y).


hermanos(X, Y):- (hermano(X, Y) , \==(X, Y)) ; (hermana(X, Y), \==(X, Y)).

% Regla para buscar tíos y tías:

tio(X, Y):- padre(P, Y), hermano(X, P).
tio(X, Y):- madre(M, Y), hermano(X, M).

tia(X, Y):- padre(P, Y), hermana(X, P).
tia(X, Y):- madre(M, Y), hermana(X, M).









