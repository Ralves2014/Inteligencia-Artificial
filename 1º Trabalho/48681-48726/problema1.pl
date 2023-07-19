%e(c,l)
%estado_inicial(e(agente))
estado_inicial(e(2,7)).

%estado_final(e(agente))
estado_final(e(5,1)).

%posicao_bloqueios(c,l)
posicao_bloqueios(e(1,2)).
posicao_bloqueios(e(3,1)).
posicao_bloqueios(e(3,2)).
posicao_bloqueios(e(4,4)).
posicao_bloqueios(e(4,5)).
posicao_bloqueios(e(4,6)).
posicao_bloqueios(e(7,2)).

%op(Estado_act,operador,Estado_seg,Custo)
op(e(X,Y),cima,e(X,Y1),1) :-
    Y > 1,
    Y1 is Y-1,
    \+ posicao_bloqueios(e(X,Y1)).

op(e(X,Y),direita,e(X1,Y), 1) :-
   X < 7,
   X1 is X+1,
   \+ posicao_bloqueios(e(X1,Y)).

op(e(X,Y),baixo,e(X,Y1),1) :-
    Y < 7,
    Y1 is Y+1,
    \+ posicao_bloqueios(e(X,Y1)).

op(e(X,Y),esquerda,e(X1,Y),1) :-
    X > 1,
    X1 is X-1,
    \+ posicao_bloqueios(e(X1,Y)).

%Heurísticas
/*
h(e(Xi,_),R):-
    estado_final(e(Xf,_)),
    S is abs(Xi-Xf),
    R is S.
*/

h(e(Xi,Yi),R):-
    estado_final(e(Xf,Yf)),
    S is abs(Xi-Xf),
    D is abs(Yi-Yf),
    R is S+D.
