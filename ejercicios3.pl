% ejercicio1
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

clave_secreta(L):-
    =(L,[A,B,C,D,E]),
    digito(A),
    digito(B),
    digito(C),
    digito(D),
    digito(E),
    % El quinto dígito más el tercero suman catorce.
    plus(E,C,14),
    % El cuarto dígito es uno más que el segundo.
    plus(B,1,D),
    % El primer dígito es uno menos que el doble del segundo dígito.
    is(B2,*(B,2)),
    plus(B2,-1,A),
    % El segundo dígito más el tercero suman diez.
    plus(B,C,10),
    % La suma de todos los dígitos es 30.
    =:=(+(A,+(B,+(C,+(D,E)))),30).

% ejercicio2
apellido(blanco).
apellido(rubio).
apellido(castano).

color_pelo(L):-
    =(L,[A,B,C]),
    apellido(A),
    apellido(B),
    apellido(C),
    \==(A,blanco),
    \==(A,B),
    \==(A,C),
    \==(B,rubio),
    \==(B,A),
    \==(B,C),
    \==(C,castano),
    \==(C,A),
    \==(C,B).

% ejercicio3
casa(vasquez).
casa(moreno).
casa(gonzales).
casa(flores).

orden_casas(L):-
    =(L,[A,B,C,D]),
    casa(A),
    casa(B),
    casa(C),
    casa(D),
    all_diff(L),
    % los Vásquez viven al lado de los Moreno
    (nextto(vasquez,moreno,L);nextto(moreno,vasquez,L)),
    % los Vásquez no viven al lado de los González
    not(nextto(vasquez,gonzales,L);nextto(gonzales,vasquez,L)),
    % los González no viven al lado de los Flores
    not(nextto(flores,gonzales,L);nextto(gonzales,flores,L)).

all_diff(L) :- \+ (select(X,L,R), memberchk(X,R)).

% ejercicio4
asignar_piso([1,X],[[1,X],_,_,_,_]).
asignar_piso([2,X],[_,[2,X],_,_,_]).
asignar_piso([3,X],[_,_,[3,X],_,_]).
asignar_piso([4,X],[_,_,_,[4,X],_]).
asignar_piso([5,X],[_,_,_,_,[5,X]]).

vivienda(Hilera_pisos):-
    =(Hilera_pisos,[[1,_],[2,_],[3,_],[4,_],[5,_]]),
    asignar_piso([A,chilo],Hilera_pisos),
    asignar_piso([B,canuta],Hilera_pisos),
    asignar_piso([C,mario],Hilera_pisos),
    asignar_piso([D,lencha],Hilera_pisos),
    asignar_piso([E,marina],Hilera_pisos),
    % Don Chilo no vive en el quinto piso
    =\=(A,5),
    % Doña Canuta no vive en el primero
    =\=(B,1),
    % Don Mario no vive en el piso superior ni en el inferior
    =\=(C,1),
    =\=(C,5),
    % Don Mario no está en un piso adyacente al de Doña Marina ni al de Doña Canuta.
    not(succ(C,E);succ(E,C)),
    not(succ(C,B);succ(B,C)),
    % La Ña Lencha vive en algún piso por encima de Doña Canuta
    >(D,B).

% ejercicio5
asignar_butaca([1,X],[[1,X],_,_,_,_,_,_,_]).
asignar_butaca([2,X],[_,[2,X],_,_,_,_,_,_]).
asignar_butaca([3,X],[_,_,[3,X],_,_,_,_,_]).
asignar_butaca([4,X],[_,_,_,[4,X],_,_,_,_]).
asignar_butaca([5,X],[_,_,_,_,[5,X],_,_,_]).
asignar_butaca([6,X],[_,_,_,_,_,[6,X],_,_]).
asignar_butaca([7,X],[_,_,_,_,_,_,[7,X],_]).
asignar_butaca([8,X],[_,_,_,_,_,_,_,[8,X]]).

cine(L):-
    =(L,[[1,_],[2,_],[3,_],[4,_],[5,_],[6,_],[7,_],[8,_]]),
    asignar_butaca([A,borracho],L),
    asignar_butaca([B,rosita],L),
    asignar_butaca([C,ramon],L),
    asignar_butaca([D,tona],L),
    asignar_butaca([E,juanito],L),
    asignar_butaca([F,anita],L),
    asignar_butaca([G,mario],L),
    asignar_butaca([H,vacio],L),
    % borracho sentado en una de ellas como se muestra a continuación
    =:=(A,4),
    % don Mario, al que no le importa el lugar donde sentarse, aunque sea a la par del borracho
    (succ(G,A);succ(A,G)),
    % Nadie quiere estar a la par del borracho, sino que, al menos, a una butaca de por medio
    (succ(H,A);succ(A,H)),
    % Rosita y Ramón,que deben sentarse juntos
    (succ(B,C);succ(C,B)),
    % doña Tona siempre se sienta enmedio de los dos
    (succ(D,E);succ(E,D)),
    (succ(D,F);succ(F,D)).
