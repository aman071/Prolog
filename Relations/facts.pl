
parent(waseem,aman).
parent(firdaus,aman).
parent(firdaus,aaliya).
parent(waseem,aaliya).
parent(r, waseem).
parent(s,waseem).
parent(r, reyaz).
parent(s, reyaz).
parent(reyaz, deeba).
parent(r, n).

child(aman,waseem).
child(aman,firdaus).
child(aaliya,waseem).
child(aaliya,firdaus).

male(aman).
male(r).
male(waseem).
male(reyaz).

female(firdaus).
female(s).
female(aaliya).
female(deeba).
female(n).

spouse(waseem,firdaus).

is_grandfather(X,Y) :- parent(X,Z), parent(Z,Y), male(X).
is_grandmother(X,Y) :- parent(X,Z), parent(Z,Y), female(X).

is_firstcousin(X,Y) :- parent(Z,X),parent(W,Y),male(Z),male(W),is_brother(Z,W).

is_husband(X,Y) :- spouse(X,Y), male(X) ; male(Y).

is_wife(Y,X) :- spouse(X,Y), female(Y) ; female(X).

is_son(X,Y) :- parent(Y,X), male(X).

is_daughter(X,Y) :- parent(Y,X), female(X).

is_brother(X,Y) :- parent(Z,X), parent(Z,Y), male(X), X\=Y.

is_sister(X,Y) :- parent(Z,X), parent(Z,Y), female(X), X\=Y.

is_siblings(X,Y) :- is_brother(X,Y) ; is_sister(X,Y).

is_brotherinlaw(X,Z) :- spouse(Y,Z), is_brother(X,Y) , male(X).

is_sisterinlaw(X,Z) :- spouse(Y,Z), is_sister(X,Y) , female(X).

is_uncle(X,Y) :- parent(Z,Y), is_brother(X,Z).

is_aunt(X,Y) :- parent(Z,Y), is_sister(X,Z).

/*Clauses to call above clauses*/
check_parents(X,Y) :- parent(X,Y), write(X), write(" "), fail;true.
check_children(X,Y) :- child(X,Y), write(X), write(" "), fail;true.
grandmother(X,Y) :- is_grandmother(X,Y), write(X), write(" "), fail;true.
grandfather(X,Y) :- is_grandfather(X,Y), write(X), write(" "), fail;true.
firstcousin(X,Y) :- is_firstcousin(X,Y), write(X), write(" "), fail;true.
husband(X,Y) :- is_husband(X,Y), write(X), write(" "), fail;true.
wife(X,Y) :- is_wife(X,Y), write(X), write(" "), fail;true.
son(X,Y) :- is_son(X,Y), write(X), write(" "), fail;true.
daughter(X,Y) :- is_daughter(X,Y), write(X), write(" "), fail;true.
brother(X,Y) :- is_brother(X,Y), write(X), write(" "), fail;true.
sister(X,Y) :- is_sister(X,Y), write(X), write(" "), fail;true.
siblings(X,Y) :- is_siblings(X,Y), write(X), write(" "), fail;true.
brotherinlaw(X,Y) :- is_brotherinlaw(X,Y), write(X), write(" "), fail;true.
sisterinlaw(X,Y) :- is_sisterinlaw(X,Y), write(X), write(" "), fail;true.
uncle(X,Y) :- is_uncle(X,Y), write(X), write(" "), fail;true.
aunt(X,Y) :- is_aunt(X,Y), write(X), write(" "), fail;true.



/*Program*/

find_relations :-
    write("Whose relations do you wish to know? "),nl, read(In),
    write("Parents: "), check_parents(_, In), nl,
    write("Children: "), check_children(_, In), nl,
    write("Grandfather: "), grandfather(_, In),write(" "), nl,
    write("Grandmother: "), grandmother(_, In), nl,
    write("First cousin: "), firstcousin(_, In), nl,
    write("Husband: "), husband(_, In), nl,
    write("Wife: "), wife(_, In), nl,
    write("Son: "), son(_, In), nl,
    write("Daughter: "), daughter(_, In), nl,
    write("Brother: "), brother(_, In), nl,
    write("Sister: "), sister(_, In), nl,
    write("Siblings: "), siblings(_, In), nl,
    write("Brother-in-law: "), brotherinlaw(_, In), nl,
    write("Sister-in-law: "), sisterinlaw(_, In), nl,
    write("Uncle: "), uncle(_, In), nl,
    write("Aunt: "), aunt(_, In), nl.




