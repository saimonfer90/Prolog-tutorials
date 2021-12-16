%-------------------------------------
%Esempio backtracking
%-------------------------------------
%per caricare questo file usa il comando:
%reconsult("Backtracking").
mother(mia, haley).
mother(jessica, mark).
mother(eva, ben).
mother(haley, jake).
mother(bennet, alicia).
mother(michelle, jennifer).
mother(alicia, chris).
mother(alicia, britt).
father(liam, michael).
father(josh, haley).
father(mark, henry).
father(mark, alicia).
father(josh, chris).
father(taylor, michelle).
father(josh, mark).
father(james, luke).
father(james, miller). 
parent(olivia, matt).
parent(olivia, smith).
parent(A, B) :-
    write('mother?'),
    nl,
    mother(A, B),
    write('mother!').
parent(X, Y) :-
    write('father?'),
    nl,
    father(X, Y),
    write('father!').
parent(alexa, jessa).
parent(alexa, dave).

%interrogando il database su chi di chi sia genitore josh (?- parent(josh, B)) otteniamo il seguente comportamento di Prolog:
%verifica parent(olivia, matt). --> falso
%verifica parent(olivia, smith). --> falso
%verifica parent(A, B) --> false spiegazione:
%   write('mother?') ed nl --> danno vero per def, verifica mother(A,B) --> falso, si ferma perché ha trovato almeno un falso in un and di condizioni; write('mother!'), nl. non saranno eseguite.

%verifica parent(X, Y) --> true spiegazione:
%   write('father?') ed nl --> danno vero per def, verifica father(A,B) --> vero per haley (il primo di tre), write('father!'), nl. vero per definizione

%a questo punto subentra il meccanismo del backtracking:
%siccome oltre haley abbiamo chris e mark, cliccando ";" dopo il primo output ("B = haley ;") otteniamo  "B = chris ;" otteniamo e poi mark

%-------------------------------------
%Queries
%-------------------------------------
%parent(josh, B).