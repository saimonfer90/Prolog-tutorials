%-------------------------------------
%Liste e funtori e predicati su esse
%-------------------------------------
%per caricare questo file usa il comando:
%reconsult("Liste") oppure ["Liste"].

%le liste sono viste come un elemento testa (HEAD) concatenato a N elementi coda (TAIL) e sono denotate con: [HEAD|TAIL]

%-------------------------------------
%Queries
%-------------------------------------
%member(X,L) --> per vedere per quali L X è elemento
%member([a,b,c], L). --> per vedere per quali L [a,b,c] è elemento
%member(X, [a,b,c]). --> per vedere quali X sono elementi di L
%member(a, [a,b,c]). --> check a true
%member(d, [a,b,c]). --> check a false
cancella(X, [X|Tail], Tail).
cancella(X, [Y|Tail], [Y|Tail1]) :-
    cancella(X, Tail, Tail1).

%del(a,[a,b,c],L) --> per ottenere L senza istanza a
%del(a,[a,b,c,a],L) --> per ottenere L senza istanza a, usare ";"" dopo la prima soluzione per vedere la seconda
%del(X,[a,b,c],L)
f(X, normale) :-
    X<3,
    !.
f(X, normale1) :-
    X>=3.

