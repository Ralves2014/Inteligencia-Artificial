% Exercicio 1

% Condições:
%    aDireita(C, C1) - a casa C está à direita da casa C1
%    aEsquerda(C, C1) - a casa C está à esquerda da casa C1

% Fluentes:
%    na_casa(B, C) - o bloco B está na casa C
%    mao_livre - a mão do robot está livre
%    mao_na_casa(C) - a mão do robot está na casa C
%    na_mao(B) - o bloco B está na mão do robot

% Ações:
%    mover_direita(C, C1) - a mão move-se para a direita da casa C para C1
%    mover_esquerda - a mão move-se para a direita da casa C para C1
%    agarrar(B, C) - a mão agarra o bloco B que está na casa C
%    largar(B, C) - a mão larga o bloco B na casa C


% Exercico 2

% mover_direita(C, C1)
% PreCond: aDireita(C1, C), mao_na_casa(C)
% AddL: mao_na_casa(C1)
% DelL: mao_na_casa(C)

% mover_esquerda(C, C1)
% PreCond: aEsquerda(C1, C), mao_na_casa(C)
% AddL: mao_na_casa(C1)
% DelL: mao_na_casa(C)

% agarrar(B, C)
% PreCond: mao_livre, mao_na_casa(C), na_casa(B,C)
% AddL: na_mao(B)
% DelL: na_casa(B, C), mao_livre

% largar(B, C)
% PreCond: na_mao(B), mao_na_casa(C)
% AddL: na_casa(B,C), mao_livre
% DelL: na_mao(B)

% acao(Nome,Precondições, ADDList, DELList)

acao(mover_direita(C, C1), [aDireita(C1, C), mao_na_casa(C)],[mao_na_casa(C1)],[mao_na_casa(C)]):- member(C,[0,1,2,3]), member(C1,[0,1,2,3]).

acao(mover_esquerda(C, C1), [aEsquerda(C1, C), mao_na_casa(C)],[mao_na_casa(C1)],[mao_na_casa(C)]):- member(C,[0,1,2,3]), member(C1,[0,1,2,3]).

acao(agarrar(B, C), [mao_livre, mao_na_casa(C), na_casa(B,C)],[na_mao(B)],[na_casa(B, C), mao_livre]):- member(B,[a,b,c]), member(C,[0,1,2,3]).

acao(largar(B, C), [na_mao(B), mao_na_casa(C)],[na_casa(B,C), mao_livre],[na_mao(B)]):- member(B,[a,b,c]), member(C,[0,1,2,3]).


% Exercicio 4

estado_inicial([aDireita(1,0), aDireita(2,1), aDireita(3,2),
   	 	aEsquerda(0,1), aEsquerda(1,2), aEsquerda(2,3),
   	 	mao_livre, mao_na_casa(0),
   	 	na_casa(a, 0), na_casa(b,1), na_casa(c,2)]).

estado_final([mao_livre, mao_na_casa(0), na_casa(a,2), na_casa(b,3), na_casa(c,1)]).


