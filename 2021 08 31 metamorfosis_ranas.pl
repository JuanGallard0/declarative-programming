% Notar que los hechos se han colocado en desorden
% para demostrar que Prolog realiza la búsqueda
% de acuerdo a lo que se le indica.

fase(renacuajo_con_cuatro_patas).
fase(embrion).
fase(renacuajo_con_dos_patas).
fase(rana_de_cola_corta).
fase(huevo).
fase(rana_adulta).
fase(renacuajo).

se_transforma_en(renacuajo, renacuajo_con_dos_patas).
se_transforma_en(huevo, embrion).
se_transforma_en(embrion, renacuajo).
se_transforma_en(renacuajo_con_cuatro_patas, rana_de_cola_corta).
se_transforma_en(rana_de_cola_corta, rana_adulta).
se_transforma_en(renacuajo_con_dos_patas, renacuajo_con_cuatro_patas).


fases_metamorfosis_rana:-
    fases_metam_r(_, _).

fases_metam_r(X, Y):-
    buscar_primera_fase(X),
    mostrar_fases(X, Y).

buscar_primera_fase(X):-
    fase(X),
    not(se_transforma_en(_, X)),
    writeln(X), !.

mostrar_fases(X, _):-
    not(se_transforma_en(X, _)), !.

mostrar_fases(X, _):-
    se_transforma_en(X, Y),
    writeln(Y),
    mostrar_fases(Y, _).




