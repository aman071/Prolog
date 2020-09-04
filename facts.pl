
parent(waseem,aman).
parent(firdaus,aman).
parent(r, waseem).
parent(s,waseem).
parent(r, reyaz).
parent(s, reyaz).
parent(reyaz, deeba).

child(aman,waseem).
child(aman,firdaus).
child(aaliya,waseem).
child(aaliya,firdaus).

male(aman).
male(r).
male(waseem).

female(firdaus).
female(s).
female(aaliya).

spouse(waseem,firdaus).

is_grandfather(X,Y) :- parent(X,Z), parent(Z,Y), male(X).
is_grandmother(X,Y) :- parent(X,Z), parent(Z,Y), female(X).

is_firstcousin(X,Y) :- is_grandfather(Z,X), is_grandfather(W,Y), Z=W.


