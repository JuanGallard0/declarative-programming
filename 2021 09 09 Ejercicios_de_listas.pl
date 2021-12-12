% Desplegar los elementos de una lista:

%?- desplegar([a, b, c, d]).

desplegar([]):- !.

desplegar([Cab|Col]):-
    writeln(Cab),
    desplegar(Col).
