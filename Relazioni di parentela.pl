%-------------------------------------
%Definizione di fratellanza
%nella lista seguente fratelli sono solo luca e paolo, giacomo e carlo sono fratellastri di mother diversa, lucio e annibale di father diverso,
%il programma deve individuare correttamente queste relazioni
%-------------------------------------
%per caricare questo file usa il comando:
%reconsult("Relazioni di parentela").

%note: l'ordine è importante: prima tutti predicati con un nome e poi quelli con un altro, se utilizzassimo la lista seguente per esempio:

%father(pippo, giacomo).
%mother(gina, giacomo).
%father(pippo, giacomo).

%otterremmo l'errore: "Clauses of father/2 are not together in the source-file" che indica la separazione dei predicati nel codice

%paolo e luca: fratelli
father(father_Paolo_Luca, paolo).
father(father_Paolo_Luca, luca).

%giacomo e carlo fratellastri, stesso padre
father(father_Carlo_Giacomo, giacomo).
father(father_Carlo_Giacomo, carlo).

%lucio e carlo annibale, padre diverso
father(father_Lucio, lucio).
father(father_Annibale, annibale).

%paolo e luca: fratelli
mother(mother_Paolo_Luca, paolo).
mother(mother_Paolo_Luca, luca).

%giacomo e carlo fratellastri, madre diversa
mother(mother_Giacomo, giacomo).
mother(mother_Carlo, carlo).

%lucio e carlo annibale, stessa madre
mother(mother_Lucio_Annibale, lucio).
mother(mother_Lucio_Annibale, annibale).

%note: X\=Y is equal to dif(X,Y)
brothers(X,Y) :- father(P,X), father(P,Y),
     mother(M,X), mother(M,Y),
     X \= Y.

%AND logico: ","
%OR logico: ";";
stepbrothers(X,Y) :- father(P,X), father(P,Y), 
    mother(M,X), mother(M2,Y), 
    dif(M,M2); 
    mother(P,X), mother(P,Y), 
    father(M,X), father(M2,Y), 
    dif(M,M2).


%-------------------------------------
%Queries
%-------------------------------------
%?- stepbrothers (X,Y).
%X = giacomo,
%Y = carlo ;
%X = carlo,
%Y = giacomo ;
%true.