clave_secreta(Clave):-
    =(Clave, [N1, N2, N3, N4, N5]),
    digito(N5),
    digito(N3),
    =:=(+(N5, N3), 14), %plus(N5, N3, 14)
    digito(N4),
    digito(N2),
    %=:=(+(N4, N2+1),N2),
    =:=(N4, +(N2, 1)), %succ(N2, N4),
    digito(N1),
    =:=(N1, -(*(N2, 2), 1)),
    plus(N2, N3, 10),
    =:=(+(N1, +(N2, +(N3, +(N4, N5)))), 30).

digito(0).
digito(1).
digito(2).
digito(3).
digito(4).
digito(5).
digito(6).
digito(7).
digito(8).
digito(9).

