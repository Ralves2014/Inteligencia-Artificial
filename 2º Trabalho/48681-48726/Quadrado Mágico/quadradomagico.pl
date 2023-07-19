size(3).

estado_inicial(
    e([ 
        v((1,1),[1,2,3,4,5,6,7,8,9],_), v((1,2),[1,2,3,4,5,6,7,8,9],_), v((1,3),[1,2,3,4,5,6,7,8,9],4),
        v((2,1),[1,2,3,4,5,6,7,8,9],_), v((2,3),[1,2,3,4,5,6,7,8,9],_),
        v((3,1),[1,2,3,4,5,6,7,8,9],_), v((3,2),[1,2,3,4,5,6,7,8,9],_), v((3,3),[1,2,3,4,5,6,7,8,9],_)], 
      [v((2,2),[1,2,3,4,5,6,7,8,9],5)])).

sucessor(e([v(N,D,V)|R],E),e(R,[v(N,D,V)|E])):- member(V,D).

soma([], 0).
soma([X|Xs], Total) :- soma(Xs, R), Total is X + R.

all_distinct([]).
all_distinct([X|Xs]) :-
    \+ member(X, Xs),
    all_distinct(Xs).

tamanho([], 0).       
tamanho([_ | Resto], Tamanho) :- 
    tamanho(Resto, TamanhoResto), 
    Tamanho is TamanhoResto + 1.  


ve_restricoes(e(_, [v((X,Y),_,V)|VariaveisInstanciadas])):-
    findall(V1, (member(v(_,_,V1), VariaveisInstanciadas), integer(V1)), Valores),
    all_distinct([V|Valores]),
    validar_linha([v((X,Y),_,V)|VariaveisInstanciadas]),
    validar_coluna([v((X,Y),_,V)|VariaveisInstanciadas]),
    validar_diagonal_principal([v((X,Y),_,V)|VariaveisInstanciadas]),
    validar_diagonal_secundaria([v((X,Y),_,V)|VariaveisInstanciadas]).

%Validar a linha quando esta está preenchida (tamanho 3), ou seja, verificar se a soma desta é igual a 15
validar_linha([v((X,_),_,V1)|VariaveisInstanciadas]):-
    findall(V, (member(v((X,_),_,V), VariaveisInstanciadas), integer(V)), Linha),
    tamanho([V1|Linha], T), T \= 3.

validar_linha([v((X,_),_,V1)|VariaveisInstanciadas]):-
    findall(V, (member(v((X,_),_,V), VariaveisInstanciadas), integer(V)), Linha),
    tamanho([V1|Linha], T), T == 3,
    soma([V1|Linha], 15).

%Validar a coluna quando esta está preenchida (tamanho 3), ou seja, verificar se a soma desta é igual a 15
validar_coluna([v((_,Y),_,V1)|VariaveisInstanciadas]):-
    findall(V, (member(v((_,Y),_,V), VariaveisInstanciadas), integer(V)), Coluna),
    tamanho([V1|Coluna], T), T \= 3.

validar_coluna([v((_,Y),_,V1)|VariaveisInstanciadas]):-
    findall(V, (member(v((_,Y),_,V), VariaveisInstanciadas), integer(V)), Coluna),
    tamanho([V1|Coluna], T), T == 3,
    soma([V1|Coluna], 15).

validar_diagonal_principal([v((X,Y),_,V1)|VariaveisInstanciadas]) :-
    X \= Y.

validar_diagonal_principal([v((X,Y),_,V1)|VariaveisInstanciadas]) :-
    X == Y,
    findall(V, (member(v((K,K),_,V), VariaveisInstanciadas), integer(V)), Diagonal),
    tamanho([V1|Diagonal], T), T \= 3.

validar_diagonal_principal([v((X,Y),_,V1)|VariaveisInstanciadas]) :-
    X == Y,
    findall(V, (member(v((K,K),_,V), VariaveisInstanciadas), integer(V)), Diagonal),
    tamanho([V1|Diagonal], T), T == 3,
    soma([V1|Diagonal], 15).

validar_diagonal_secundaria([v((X,Y),_,V1)|VariaveisInstanciadas]) :-
    X + Y \= 4.

validar_diagonal_secundaria([v((X,Y),_,V1)|VariaveisInstanciadas]) :-
    X + Y == 4,
    findall(V, (member(v((X,Y),_,V), VariaveisInstanciadas), integer(V)), Diagonal),
    tamanho([V1|Diagonal], T), T \= 3.

validar_diagonal_secundaria([v((X,Y),_,V1)|VariaveisInstanciadas]) :-
    X + Y == 4,
    findall(V, (member(v((X,Y),_,V), VariaveisInstanciadas), integer(V)), Diagonal),
    tamanho([V1|Diagonal], T), T == 3,
    soma([V1|Diagonal], 15).

%esc(_).
esc(L):-sort(L, L1), esc_a(L1),nl.

esc_a(L):- size(S), esc_l(L, 1, S).

esc_l([H], S, S):- H = v(_,_,X), write(X),nl.

esc_l([H|T], S, S):- H = v(_,_,X), write(X), nl,esc_l(T, 1, S).

esc_l([H|T], I, S):- I<S, I2 is I+1,
                    H = v(_,_,X), write(X),write(' | '),
                     esc_l(T, I2, S).