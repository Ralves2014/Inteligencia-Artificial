%Executar o jogo consultando este ficheiro e executando 'joga.'
%Para usar o algoritmo minimax:
%   -descomentar a parte do minimax neste predicado e no predicado joga_pc e comentar a parte do alfabeta
%Para usar o algoritmo alfabeta:
%   -descomentar a parte do alfabeta neste predicado e no predicado joga_pc e comentar a parte do minimax
joga :- /*[minimax],*/[alfabeta], g(bolas), estado_inicial(Ei), printState(Ei),joga_pc(Ei).

pede_coluna(NumeroDeBolas):-
    read(NumeroDeBolas).

joga_pc(Ei):- (terminal(Ei); Ei = e([])), write('Jogo terminado.').
joga_pc(Ei):- /*minimax_decidir(Ei,Op),*/alfabeta(Ei,Op),
            write(Op),nl,nl,
            oper(Ei,Op,Enn),
            printState(Enn),
            joga(Enn).

joga(Ei):- (terminal(Ei); Ei = e([])),write('Jogo terminado.').
joga(Ei) :- 
            write('Escolha o número de bolas que quer retirar: '), nl, 
            write('por exemplo: 1.'),nl,
            pede_coluna(NumeroDeBolas),nl,
            oper(Ei,retirar(NumeroDeBolas),En),
            printState(En),
            joga_pc(En).

printState(e([])).
printState(e(Estado)) :-
    write('Estado: '),
    printLinha(Estado),nl,nl.

printLinha([]).
printLinha([H|T]) :-
    write(H),
    write(' '),
    printLinha(T).