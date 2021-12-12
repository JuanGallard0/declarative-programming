% ex 1
% a)
=(X, +( *( 8  , /( 8 , **(4,2)  ) )  , 6 )).
is(X, +( *( 8  , /( 8 , **(4,2)  ) )  , 6 )).

% e)
is(W,  -(   /(  -( *(4 ,  tan(25) )  , 3)  ,  sqrt(  -(   /( 9, 2)  , sin(15 ) )  )  )    ,  *(  10 , log10(43)  ))).

% ex 4
juego(uno).
juego(parchis).
juego(amongus).
juego(rocket).

tiene(javito, uno).
tiene(pepito, uno).
tiene(rodri,amongus ).
tiene(pepito, uno).
tiene(javito, uno).
tiene(pepito,amongus).


comprar_juego(X):-
   not(juego(X)),
   writeln("No está en tienda"), !.

comprar_juego(X):-


comprar_juego(X):-
   juego(X),
   not(tiene(javito, X)),
   not(tiene(pepito, X)),
   not(tiene(rodri, X)),
   writeln("Se puede comprar"), !.

% ex 6
