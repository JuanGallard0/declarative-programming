% ejercicio1
retornar_subarbol(Dato, [_, Raiz, SubArbolDer], SubArbol):-
    >(Dato, Raiz),
    retornar_subarbol(Dato, SubArbolDer, SubArbol).

retornar_subarbol(Dato, [SubArbolIz, Raiz, _], SubArbol):-
    <(Dato, Raiz),
    retornar_subarbol(Dato,SubArbolIz , SubArbol).

retornar_subarbol(Dato, [SubArbolIz,Dato, SubArbolDer], [SubArbolIz,Dato, SubArbolDer]).

% ejercicio2
equilibrado(Arbol):-
    diferencia_alturas(Arbol, _).

diferencia_alturas([], 0):-!.

diferencia_alturas([SubArbolIzq, _, SubArbolDer], Altura):-
    diferencia_alturas(SubArbolIzq, AlturaIzq),
    diferencia_alturas(SubArbolDer, AlturaDer),
    is(Altura, +(1, max(AlturaIzq, AlturaDer))),
    =<(abs(-(AlturaIzq, AlturaDer)),1).
