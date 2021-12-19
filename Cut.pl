%-------------------------------------
%Operatore CUT
%-------------------------------------
%per caricare questo file usa il comando:
%reconsult("Operatori").

%il cut si utilizza per stoppare una computazione,  riguarda la parte computazionale (o procedurale) del prolog e non la dichiarativa, quindi quando si ha a che fare con variabili di cui bisogna trovare un valore 
%Si usa come condizione e si scrive "!".




%nel modo seguente la chiamata a stato(1, R) dirà che gli stati possibili sono no_allarme e allarme; che logicamente parlando sono impossibili.
stato(X, no_allarme) :- X<2.
stato(X, allarme_1) :- X<3.
stato(X, allarme_2):- X>=3.

%se metto il cut, posso ovviare dal procurarmi lo stato allarme_1 per X=1, infatti cliccando ";" dopo l'aver ottenuto "no_allarme" per la chiamata stato(1, R) non otterrò allarme_1
stato(X, no_allarme) :- X<2, !.
stato(X, allarme_1) :- X<3.
stato(X, allarme_2):- X>=3.

%posso poi ottimizzare per evitare di computare stato(X, allarme_2) se la chiamata fosse  stato(2, R) , mettendo un altro cut
stato(X, no_allarme) :- X<2, !.
stato(X, allarme_1) :- X<3,!.
stato(X, allarme_2):- X>=3.

%questo è ok a livello computazionale ma non dichiarativo, infatti se provo a mettere valori puntuali posso ottenere un valore sbagliato: stato(1, allarme_1) darà true, cosa non voluta.
%i cut si dividono in green cut e red cut, la differenza è a livello dichiarativo, se la computazione finisce bene per il cut e da i risultati corretti, ma con valori puntuali restituisce risultato errato 
%Questo è un red cut.

%per ovviare alla problematica bisgona definire meglio i vincoli:
stato(X, no_allarme) :- X<2, !.
stato(X, allarme_1) :- X>1, X<3, !.
stato(X, allarme_2):- X>=3.

%un altro metodo per ovviare è quello di allineare con l'input la varibile di output, in modo che non vengano proprio considerate le altre computazioni, evitando il cut ed essendo ok a livello dichiarativo.
%questo lo si può fare solo se il numero di variabili è uguale alle possibili risposte, nell'esempio sopra non si può fare perché abbiamo tre possibilità di R per una sola variabile, X. vediamo con 
%la funzione massimo come implementare il concetto: elenchiamo in vari modi come definire la funzione:

%1 con precedenza operatori logici, l'or (condizioni post ";") non viene eseguito se le condizioni a primo a membro sono vere (X>Y, e R is X, quest'ultima sempre vera)
max(X, Y, R) :-
    (   X>Y,
        R is X
    ;   X=<Y,
        R is Y
    ).

%2 con test ridondante (se infatti è vera la prima testerà anche la seconda, per dire poi false)
max(X, Y, R) :- X > Y, R is X.
max(X, Y, R) :- X =< Y, R is Y.

%3 ottimizzato con il cut: finita la prima clausola se vera (ed esegue quindi "!"), se l'utente preme ";" per refutare e provare a trovare altre soluzioni le successive non verranno calcolate (fare prova senza "!")
max(X, Y, R) :- X > Y, R is X, !.
max(X, Y, R) :- X =< Y, R is Y.

%4 ottimizzando legando la variabile finale alla prima, diventa implicito R is X in caso di chiamata max(2,1,R)
max(X, Y, X) :- X > Y.
%5 ottimizzando legando la variabile finale alla prima, diventa implicito R is Y in caso di chiamata max(1,2,R)
max(X, Y, Y) :- X=<Y.
