% Primeros ejemplos recursivos 26/Agosto/2021:

% Conteo de 1 a n:

% En recursión de cola:

contar(N, N):-
    %=:=(A, N),
    writeln(N), !.

contar(A, N):-
    <(A, N),
    writeln(A),
    is(A2, +(A, 1)),
    contar(A2, N).


% En recursión por posposición:
% Notar que el conteo se hace de mayor a menor.

contar2(A, N):-
    =:=(A, N),
    writeln(A), !.

contar2(A, N):-
    <(A, N),
    is(A2, +(A, 1)),
    contar2(A2, N),
    writeln(A).

% Contar de 1 a N en recursión por posposición:

contar3(1):-
    %=:=(N, 1),
    writeln(1), !.

contar3(N):-
    >(N, 1),
    is(N2, -(N, 1)),
    contar3(N2),
    writeln(N).



