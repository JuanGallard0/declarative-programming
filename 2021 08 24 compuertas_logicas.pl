% Compuerta AND:

% De acuerdo a su tabla de verdad, tenemos:

and_a(A, B, S):- =:=(A, 0), =:=(B, 0), is(S, 0).
and_a(A, B, S):- =:=(A, 0), =:=(B, 1), is(S, 0).
and_a(A, B, S):- =:=(A, 1), =:=(B, 0), is(S, 0).
and_a(A, B, S):- =:=(A, 1), =:=(B, 1), is(S, 1).

and_b(A, B, S):- =:=(A, 0), =:=(B, 0), is(S, 0), !.
and_b(A, B, S):- =:=(A, 0), =:=(B, 1), is(S, 0), !.
and_b(A, B, S):- =:=(A, 1), =:=(B, 0), is(S, 0), !.
and_b(A, B, S):- =:=(A, 1), =:=(B, 1), is(S, 1).

and_c(0, 0, 0).
and_c(0, 1, 0).
and_c(1, 0, 0).
and_c(1, 1, 1).

and_d(0, 0, 0):- !.
and_d(0, 1, 0).
and_d(1, 0, 0):- !.
and_d(1, 1, 1).

and_e(1, 1, 1):- !.
and_e(_, _, 0).

% Compuerat NOT:

% De acuerdo a su tabla de verdad, tenemos:

not(A, _):-
    not(number(A)),
    write('ERROR: entrada no numérica'), nl, !, fail.
not(A, _):-
    (<(A, 0) ; >(A, 1)),
    write('ERROR: datos de entrada deben ser 1 o 0'), nl, fail.
not(0, 1).
not(1, 0).



