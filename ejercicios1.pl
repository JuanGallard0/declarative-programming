% ejercicio1
% a)
% is(X, +(*(8,/(8,^(4,2))),6)).
% b)
% is(X,+(sin(30),/(^(2,3),sqrt(+(^(9,2),10))))).
% c)
% is(X,/(*(-(/(25,5),log(1)),sin(2.8)),sqrt(^(5,2)))).
% d)
% is(X,+(sin(6.45),/(^(2,3),sqrt(+(^(9,2),10))))).
% e)
% is(X,-(/(-(*(4,tan(25)),3),sqrt(-(/(9,2),sin(15)))),*(10,/(log(43),log(10))))).

%ejercicio3
local(comida).
local(ropa).
local(tecnologia).
local(belleza).
local(deporte).

no_encontrar(A,B,C):-
    local(A),
    local(B),
    local(C),
    \==(C,A),
    \==(C,B).

% ejercicio4
juego(mario).
juego(zelda).
juego(metroid).
juego(pokemon).

tiene(javito,zelda).
tiene(rodri,mario).
tiene(rodri,metroid).
tiene(pepito,zelda).
tiene(pepito,metroid).

comprar_juego(W):-
   not(juego(W)),
   writeln("No está en tienda"), !.
comprar_juego(W):-
    juego(W),
    (tiene(rodri, W); tiene(pepito, W); tiene(javito, W)),
    writeln("No debe comprar"), !.
comprar_juego(W) :-
    juego(W),
    not(tiene(_, W)),
    writeln("Debe comprar").

% ejercicio5
sexo(jaime,m).
sexo(mario,m).
sexo(juan,m).
sexo(andrea,f).
sexo(elisa,f).
sexo(maria,f).

ama_a(jaime,andrea).
ama_a(andrea,jaime).
ama_a(mario,elisa).
ama_a(elisa,mario).
ama_a(juan,maria).
ama_a(maria,juan).

se_pueden_casar(A,B):-
    sexo(A,C),
    sexo(B,D),
    \==(C,D),
    ama_a(A,B).

% ejercicio6
enemigo(made, fati).
enemigo(fati, made).
enemigo(dir, fati).
enemigo(fati, dir).
enemigo(thanos, capi).
enemigo(thanos, ironman).
enemigo(ironman, thanos).
enemigo(capi, thanos).
enemigo(thanos, fati).
enemigo(fati, thanos).

aliado(A,B,C):-
    \==(A,B),
    enemigo(A,B),
    enemigo(B,C).

% ejercicio7
calorias(pollo, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(filetecerdo, 400).
calorias(polloasado, 280).
calorias(trucha, 160).
calorias(bacalao, 300).
calorias(flan, 200).
calorias(nueces, 500).
calorias(naranja, 50).

valor_calorico(X,Y,Z,V):-
    calorias(X,XV),
    calorias(Y,YV),
    calorias(Z,ZV),
    is(V,+(XV,+(YV,ZV))).

comida_equilibrada(X,Y,Z):-
    valor_calorico(X,Y,Z,V),
    =<(V,800),
    writeln("Es equilibrada"), !.
comida_equilibrada(_,_,_):-
    writeln("No es equilibrada").

% RECURSION

% ejercicio1
factorial(0,1):- !.
factorial(X,Y):-
   >(X,0),
   is(X1, -(X,1)),
   factorial(X1, Y1),
   is(Y, *(X, Y1)).

aprox_e(N,X):-
    var(X),
    aprox_e(N,0).
aprox_e(-1,X):-
    writeln(X),
    !.
aprox_e(N,X):-
    >=(N,0),
    factorial(N,F),
    is(XT,+(X,/(1,F))),
    is(NT,-(N,1)),
    aprox_e(NT,XT).

% ejercicio2
imprimir_char(N):-
    write("Ingresar char: "),
    read(C),
    imprimir_char(N,C).

imprimir_char(0,_):-
    !.
imprimir_char(N,C):-
    >(N,0),
    writeln(C),
    is(NT,-(N,1)),
    imprimir_char(NT,C).

% ejercicio3
adivinar_num():-
    is(X,+(random(99),1)),
    ingresar_num(X).

ingresar_num(X):-
    write("Ingresar num: "),
    read(I),
    verificar(X,I).

verificar(X,I):-
    =:=(X,I),
    writeln("Exito"),
    !.
verificar(X,I):-
    >(X,I),
    writeln("El num es mayor"),
    ingresar_num(X).
verificar(X,I):-
    <(X,I),
    writeln("El num es menor"),
    ingresar_num(X).

% ejercicio4
mcd(A,0):-
    write("MCD: "),
    writeln(A),
    !.
mcd(A,B):-
    is(C,mod(A,B)),
    mcd(B,C).

% ejercicio5
decimal_a_binario(0):-
    write(0),
    !.
decimal_a_binario(X):-
    is(X1,//(X,2)),
    decimal_a_binario(X1),
    is(X2,mod(X,2)),
    write(X2).

% PROBLEMAS
% 1)
paso(1, medicion).
paso(2, corte).
paso(3, moldeado).
paso(4, pulido).
paso(5, montaje).
paso(6, empacado).
paso(7, almacenaje).

proxima_etapa(X):-
    atom(X),
    writeln("Valor no valido"),
    !.
proxima_etapa(X):-
    (   >(X,7); <(X,1)),
    writeln("Valor no valido"),
    !.
proxima_etapa(7):-
    writeln("Proceso concluido"),
    !.
proxima_etapa(X):-
    paso(X,W),
    writeln(W),
    is(XN,+(X,1)),
    proxima_etapa(XN).

% 2)
le_sigue(algonquico,arcaico).
le_sigue(arcaico,cambrico).
le_sigue(cambrico,silurico).
le_sigue(silurico,carbonifero).
le_sigue(carbonifero,devonico).
le_sigue(devonico,pernico).
le_sigue(pernico,jurasico).
le_sigue(jurasico,cretacico).
le_sigue(cretacico,triasico).
le_sigue(triasico,eoceno).
le_sigue(eoceno,oligoceno).
le_sigue(oligoceno,mioceno).
le_sigue(mioceno,pleistoceno).
le_sigue(pleistoceno,holoceno).

le_pertenece(precambrica,algonquico).
le_pertenece(precambrica,arcaico).
le_pertenece(paleozoica,cambrico).
le_pertenece(paleozoica,silurico).
le_pertenece(paleozoica,carbonifero).
le_pertenece(paleozoica,devonico).
le_pertenece(paleozoica,pernico).
le_pertenece(mesozoica,jurasico).
le_pertenece(mesozoica,cretacico).
le_pertenece(mesozoica,triasico).
le_pertenece(mozoica,eoceno).
le_pertenece(mozoica,oligoceno).
le_pertenece(mozoica,mioceno).
le_pertenece(antropozoica,pleistoceno).
le_pertenece(antropozoica,holoceno).

esta_antes_de(algonquico):-
    !.
esta_antes_de(A):-
    le_sigue(B,A),
    writeln(B),
    esta_antes_de(B).

esta_despues_de(holoceno):-
    !.
esta_despues_de(A):-
    le_sigue(A,B),
    writeln(B),
    esta_despues_de(B).


