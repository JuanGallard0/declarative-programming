% La chica qe le gusta a Pepito se llama Burbuja.
conoce_a(pepito, pedro).
conoce_a(pedro, rita).
conoce_a(maria, enrique).
conoce_a(maria, susana).
conoce_a(rita, manuel).
conoce_a(manuel, joaquin).
%conoce_a(manuel, pedro). % Este provoca un ciclo infinito.
%conoce_a(manuel, juana). % Este provoca un ciclo infinito.
conoce_a(jorge, luisa).
conoce_a(eduardo, rocio).
%conoce_a(alejandra, manuel). % Este provoca un ciclo infinito.
conoce_a(rubidia, julio).
conoce_a(maria, jaime).
conoce_a(luisa, patricia).
conoce_a(luisa, ricardo).
conoce_a(enrique, etelvina).
conoce_a(maria, jorge).
conoce_a(manuel, alejandra).
conoce_a(rocio, felipe).
conoce_a(juana, burbuja).
conoce_a(rocio, rita).
conoce_a(jorge, rita).
%conoce_a(juana, burbuja).
conoce_a(rita, etelvina).
conoce_a(eduardo, felipe).
conoce_a(manuel, juana).
conoce_a(manuel, pedro). %Aqui no provoca ciclo infinito.
conoce_a(rita, jorge).
conoce_a(ricardo, luisa).
conoce_a(rita, luisa).
conoce_a(jorge, pedro).
conoce_a(pedro, jaime).
conoce_a(susana, maria).
conoce_a(maria, pedro).
conoce_a(pedro, eduardo).
conoce_a(eduardo, raul).
conoce_a(raul, jaime).
conoce_a(pedro, juan).
conoce_a(juan, pablo).
conoce_a(pablo, joaquin).



desea_conocer(X, Y):-
    conoce_a(X, Y),
    writeln(Y), !.

desea_conocer(X, Y):-
    conoce_a(X, Z),
    desea_conocer(Z, Y),
    writeln(Z).












