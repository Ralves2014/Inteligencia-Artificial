%O jogo que escolhemos é o seguinte: 
%Existem 10 peças/bolas em linha. (Também pode ser jogado com mais peças).
%Cada jogador pode retirar UMA ou DUAS peças/bolas da esquerda para a direita. O jogador que retirar a última peça/bola perde.
estado_inicial(e([p,p,p,p,p,p,p,p,p,p])).

terminal(e([_])). % Quando há apenas uma peça no tabuleiro

%Função de utilidade para determinar o valor de um estado 
%(Jogador 1 vence quando não há mais peças, Jogador 2 vence quando há apenas uma peça)
valor(E, V, P) :-
    terminal(E),
    X is P mod 2,
    (X == 1, V = 1 ; X == 0, V = -1).

%oper(E,Jogada,Es)   E-primeiro estado, Jogada, Es- estado seguinte
oper(e(Ei),retirar(1),e(Es)) :- 
	Ei = [_|Resto],
	Es = Resto.

oper(e(Ei),retirar(2),e(Es)) :- 
	Ei = [_,_|Resto],
	Es = Resto.