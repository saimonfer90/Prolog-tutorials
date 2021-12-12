%-------------------------------------
%Elenco operatori
%-------------------------------------
%per caricare questo file usa il comando:
%reconsult("Operatori").

%uso operatori
risultatoUguale(X,Y) :- X =:= Y.
risultatoDiverso(X,Y) :- X =\= Y.
paremetriUguali(X,Y) :- X = Y.

%uso variabile anonima
hates(jim,tom).
hates(pat,bob).
hates(dog,fox).
hates(peter,tom).

%-------------------------------------
%Queries
%-------------------------------------
%risultatoUguale(1+2,2+1). --> da true, confronta uguaglianza semantica degli input
%risultatoUguale(1+2,1+2). --> da true
%risultatoUguale("1+2","2+1"). --> da errore casting

%risultatoDiverso(1+2,2+1). --> da true, confronta uguaglianza semantica degli input
%risultatoDiverso(1+2,1+2). --> da true
%risultatoDiverso("1+2","2+1"). --> da errore casting

%paremetriUguali(1+2,1+2). --> da true, confronta sintassi input se uguali
%paremetriUguali("1+2","1+2"). --> da true, 
%paremetriUguali(1+2,2+1). --> da false, 1+2 <> 2+1
%paremetriUguali("1+2","2+1"). --> da false,  "1+2" <> "2+1"
%paremetriUguali("1+2",1+2). --> da false

%hates(X,tom). --> trova jim and peter (clicca spazio dopo l'output jim per avere il nuovo output peter)
%hates(X,Y). --> trova chi odia chi
%hates(_,tom). --> trova se qualcuno odia tom (true/false)
%hates(tom, X). --> trova se tom odia qualcuno (true/false)
