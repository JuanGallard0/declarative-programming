% 1)

q(a, b).
r(b, c).

p(X, W):-
    q(X, Y),
    r(Y, W).
