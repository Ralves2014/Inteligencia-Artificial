homem('Afonso Henriques','rei de Portugal',1109).
homem('Henrique de Borgonha','conde de Portugal',1069).

homem('Sancho I','rei de Portugal',1154).
homem('Fernando II','rei de Leão',1137).
homem('Afonso IX', 'rei de Leão e Castela', 1171).
homem('Afonso II', 'rei de Portugal',1185).

homem('Sancho II', 'rei de Portugal',1207).
homem('Afonso III', 'rei de Portugal',1210).


mulher('Teresa de Castela', 'condessa de Portugal', 1080).
mulher('Mafalda', 'condessa de Saboia', 1125).
mulher('Urraca', 'infanta de Portugal',1151).
mulher('Dulce de Barcelona','infanta de Aragão',1160).
mulher('Berengária', 'infanta de Portugal',1194).
mulher('Urraca C','infanta de Castela',1186).


filho('Afonso Henriques','Henrique de Borgonha').
filho('Afonso Henriques','Teresa de Castela').
filho('Urraca','Afonso Henriques').
filho('Sancho I','Afonso Henriques').
filho('Urraca','Mafalda').
filho('Sancho I','Mafalda').
filho('Afonso IX','Urraca').
filho('Afonso IX','Fernando II').
filho('Afonso II','Sancho I').
filho('Afonso II','Dulce de Barcelona').
filho('Berengária','Sancho I').
filho('Berengária','Dulce de Barcelona').
filho('Sancho II','Afonso II').
filho('Afonso III','Afonso II').
filho('Sancho II','Urraca C').
filho('Afonso III','Urraca C').

pai(X,Y) :- filho(Y,X), homem(X,_,_).
mae(X,Y) :- filho(Y,X), mulher(X,_,_).
irmao(X,Y) :- pai(P1,X), pai(P1,Y), mae(P2,X), mae(P2,Y), X\=Y.         /* isto pode ser feito de outra forma, esta no caderno*/
primoDireito(X,Y) :- filho(X,P1), filho(Y,P2), irmao(P1,P2), X\=Y.
irmaos(I,L) :- findall(X, irmao(I,X), L).
primo(X,Y) :- primoDireito(X,Y).
primo(X,Y) :- filho(X,P1), primoDireito(P1,Y).
primo(X,Y) :- filho(X,P1), filho(Y,P2).
primos(P,L) :- findall(X, primo(P,X), L);
esposa(X,Y) :- filho(F,X), pai(Y,F).


