%e(ac,al,cc,cl)
%estado_inicial(e(agente,caixa))
estado_inicial(e(2,7,2,6)).

%estado_final(e(agente,caixa))
estado_final(e(_,_,5,1)).

%posicao_bloqueios(c,l)
posicao_bloqueios(e(1,2)).
posicao_bloqueios(e(3,1)).
posicao_bloqueios(e(3,2)).
posicao_bloqueios(e(4,4)).
posicao_bloqueios(e(4,5)).
posicao_bloqueios(e(4,6)).
posicao_bloqueios(e(7,2)).


%op(Estado_act,operador,Estado_seg,Custo)
op(e(X,Y,Xc,Yc),cima,e(X,Y1,Xc,Y1c),1) :-
    Y1 is Y-1,
    (X =:= Xc , Y1 =:= Yc),
    Y1c is Yc-1,
    Y1c >=1, Y1c =< 7, Xc >= 1, Xc =< 7,
    \+ posicao_bloqueios(e(Xc,Y1c)).


op(e(X,Y,Xc,Yc),cima,e(X,Y1,Xc,Y1c),1) :-
    Y1 is Y-1,
    \+ (X =:= Xc , Y1 =:= Yc),
    Y1c is Yc,
    Y1 >=1, Y1 =< 7, X >= 1, X =< 7,
    \+ posicao_bloqueios(e(X,Y1)).


op(e(X,Y,Xc,Yc),direita,e(X1,Y,X1c,Yc),1) :-
    X1 is X+1,  
    (X1 =:= Xc , Y =:= Yc),
    X1c is Xc+1,
    X1c >= 1, X1c =< 7, Yc >= 1, Yc =< 7,
    \+ posicao_bloqueios(e(X1c,Yc)).


op(e(X,Y,Xc,Yc),direita,e(X1,Y,X1c,Yc),1) :-
    X1 is X+1,
    \+ (X1 =:= Xc , Y =:= Yc),
    X1c is Xc,
    X1 >= 1, X1 =< 7, Y >= 1, Y =< 7,
    \+ posicao_bloqueios(e(X1,Y)).


op(e(X,Y,Xc,Yc),baixo,e(X,Y1,Xc,Y1c),1) :-
    Y1 is Y+1,
    (X =:= Xc , Y1 =:= Yc),
    Y1c is Yc+1,
    Y1c >= 1, Y1c =< 7, Xc >= 1, Xc =< 7,
    \+ posicao_bloqueios(e(Xc,Y1c)).
       

op(e(X,Y,Xc,Yc),baixo,e(X,Y1,Xc,Y1c),1) :-
    Y1 is Y+1,
    \+ (X =:= Xc , Y1 =:= Yc),
    Y1c is Yc,
    Y1 >= 1, Y1 =< 7, X >= 1, X =< 7,
    \+ posicao_bloqueios(e(X,Y1)).
            

op(e(X,Y,Xc,Yc),esquerda,e(X1,Y,X1c,Yc),1) :-
    X1 is X-1,
    (X1 =:= Xc , Y =:= Yc),   
    X1c is Xc-1,
    X1c >= 1, X1c =< 7, Yc >= 1, Yc =< 7,
    \+ posicao_bloqueios(e(X1c,Yc)).
    

op(e(X,Y,Xc,Yc),esquerda,e(X1,Y,X1c,Yc),1) :-
    X1 is X-1,
    \+ (X1 =:= Xc , Y =:= Yc),
    X1c is Xc,
    X1 >= 1, X1 =< 7, Y >= 1, Y =< 7,
    \+ posicao_bloqueios(e(X1,Y)).
            
%Heurísticas
/*
h(e(_,_,Xi,_),R):-
    estado_final(e(_,_,Xf,_)),
    S is abs(Xi-Xf),
    R is S.
*/

h(e(_,_,Xi,Yi),R):-
    estado_final(e(_,_,Xf,Yf)),
    S is abs(Xi-Xf),
    D is abs(Yi-Yf),
    R is S+D.
