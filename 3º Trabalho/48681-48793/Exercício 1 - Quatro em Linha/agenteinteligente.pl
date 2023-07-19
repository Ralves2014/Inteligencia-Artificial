%Executar o jogo consultando este ficheiro e executando 'joga.'
%Para usar o algoritmo minimax:
%   -descomentar a parte do minimax neste predicado e no predicado joga_pc e comentar a parte do alfabeta
%Para usar o algoritmo alfabeta:
%   -descomentar a parte do alfabeta neste predicado e no predicado joga_pc e comentar a parte do minimax
joga :- /*[minimax],*/[alfabeta], g(quatroemlinha), estado_inicial(Ei), printTable(Ei),joga(Ei).

pede_coluna(Coluna):-
    read(Coluna).

joga_pc(Ei):-terminal(Ei), write('Jogo terminado.').
joga_pc(Ei):- /*minimax_decidir(Ei,Op),*/alfabeta(Ei,Op),
            write(Op),nl,
            oper(Ei,Op,b, Enn),
            printTable(Enn),nl,
            joga(Enn).

joga(Ei):- terminal(Ei),write('Jogo terminado.').
joga(Ei) :- nl,
            write('Escolha a coluna em que quer jogar: '), nl, 
            write('por exemplo: 1.'),nl,
            pede_coluna(Coluna),
            oper(Ei, joga_coluna(Coluna),p, En),
            printTable(En),nl,
            joga_pc(En).

printTable([]).
printTable([Row|Rows]) :-
    writeRow(Row),
    nl,
    printTable(Rows).

writeRow([]).
writeRow([v|Cells]) :-
    write('v '),
    writeRow(Cells).

writeRow([p|Cells]) :-
    write('p '),
    writeRow(Cells).

writeRow([b|Cells]) :-
    write('b '),
    writeRow(Cells).