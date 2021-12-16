%-------------------------------------
%Definizione di fratellanza
%-------------------------------------
%per caricare questo file usa il comando
%reconsult("Relazione di fratellanza").
father(pippo, giacomo).
father(pippo, carlo).

father(tonio, paolo).
father(tonio, luca).

brothers(X, Y) :-
    father(P, X),
    father(P, Y),
    dif(X, Y).

%note: se avessi utilizzato la variabile anonima "_" nella regola finale al posto di "P":
%fratelli(X,Y) :- padre(_,X), padre(_,Y).

%la seguente query avrebbe dato un risultato errato:
%?- brothers(giacomo, luca).
%true.

%-------------------------------------
%Queries
%-------------------------------------
%?- brothers(giacomo, carlo).
%true.

%?- brothers(giacomo, luca).
%false.

%?- brothers(paolo, luca).
%true.

%?- brothers(tonio, luca).
%false.