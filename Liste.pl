%-------------------------------------
%Definizione e utilizzo delle liste in prolog
%sarà definita una serie di predicati che operano su liste
%-------------------------------------
%per caricare questo file usa il comando:
%reconsult("Liste").

%base induttiva: se la lista è vuota la lunghezza è zero
customListLength([],0).
%passo n-esimo: della lista che ti passo scarta l'elemento in testa e passa a te stesso il resto (o coda) - la variabile T è questa coda.
customListLength([_ | T], R) :-  customListLength(T, R1), 
    R is R1 + 1.

%esempio di uso sbagliato della ricorsione:
customListLengthWrong([],0).
customListLengthWrong([_ | X], R) :- customListLengthWrong(X, R),
    R is R + 1.


%spiegazione funzionamento:
%base induttiva: per la lista vuota indipendentemente dai parametri il risultato è -1, se è arrivato li non l'ha trovato.
customFindPosition([],_,_,R) :-  R is -1.
%passo n-esimo: se la testa è l'elemento cercato restituisci la posizione corrente (parte prima di ";", se H == E non valuta la condizione post ";").
%viceversa richiama se stessa incrementando la posizione di partenza di 1 e riefettuando il test es chiamata: customFindPosition([a,b,c,d], f, 0, R).
customFindPosition([H|T],E,R,R1) :- H == E, 
    R1 is R;
    customFindPosition(T,E,R + 1, R1).

%-------------------------------------
%Queries
%-------------------------------------