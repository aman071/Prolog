
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








