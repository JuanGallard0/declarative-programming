inquilinos(Edificio):-
    =(Edificio, [_, _, _, _, _]),
    % Don Chilo no vive en el quinto piso:
    asignar([chilo, X], Edificio),
    =\=(X, 5),
    % Dona Canuta no vive en el primero:
    asignar([canuta, Y], Edificio),
    =\=(Y, 1),



asignar([X, 1], [[X, 1], _, _, _, _]).
asignar([X, 2], [_, [X, 2], _, _, _]).
asignar([X, 3], [_, _, [X, 3], _, _]).
asignar([X, 4], [_, _, _, [X, 4], _]).
asignar([X, 5], [_, _, _, _, [X, 5]]).

