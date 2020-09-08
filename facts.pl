
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

is_firstcousin(X,Y) :- is_grandfather(Z,X), is_grandfather(W,Y), Z==W.

is_husband(X,Y) :- spouse(X,Y), male(X) ; male(Y).

is_wife(Y,X) :- spouse(X,Y), female(Y) ; female(X).

is_son(X,Y) :- parent(Y,X), male(X).

is_daughter(X,Y) :- parent(Y,X), female(X).

is_brother(X,Y) :- parent(Z,X), parent(W,Y), Z==W, male(X).

is_sister(X,Y) :- parent(Z,X), parent(W,Y), Z==W, female(X).

siblings(X,Y) :- is_brother(X,Y) ; is_sister(X,Y).

is_brotherinlaw(X,Z) :- spouse(Y,Z), is_brother(X,Y) , male(X).

is_sisterinlaw(X,Z) :- spouse(Y,Z), is_sister(X,Y) , female(X).

is_uncle(X,Y) :- parent(Z,Y), is_brother(X,Z).

is_aunt(X,Y) :- parent(Z,Y), is_sister(X,Z).


find_position:-

    write("Whose relations do you wish to know? "),nl,
    read(In),
    write("Parents: "), parent(Out1, In), write(Out1),nl,
    write("Children: "), child(Out2, In), write(Out2),nl,
    write("Grandfather: "), is_grandfather(Out3, In), write(Out3),nl,
    write("Grandmother: "), is_grandmother(Out4, In), write(Out4),nl,
    write("First cousin: "), is_firstcousin(Out5, In), write(Out5),nl,
    write("Husband: "), is_husband(Out6, In), write(Out6),nl,
    write("Wife: "), is_wife(Out7, In), write(Out7),nl,
    write("Son: "), is_son(Out8, In), write(Out8),nl,
    write("Daughter: "), is_daughter(Out9, In), write(Out9),nl,
    write("Brother: "), is_brother(Out9, In), write(Out9),nl,
    write("Sister: "), is_sister(Out10, In), write(Out10),nl,
    write("Siblings: "), siblings(Out11, In), write(Out11),nl,
    write("Brother-in-law: "), is_brotherinlaw(Out12, In), write(Out12),nl,
    write("Sister-in-law: "), is_sisterinlaw(Out13, In), write(Out13),nl,
    write("Uncle: "), is_uncle(Out14, In), write(Out14),nl,
    write("Aunt: "), is_aunt(Out15, In), write(Out15),nl.
