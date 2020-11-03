% Sources
% https://stackoverflow.com/questions/23183662/prolog-parsing-a-csv-file
% https://stackoverflow.com/questions/24095068/import-csv-file-data-to-populate-a-prolog-knowledge-base

:- use_module(library(apply)).
:- use_module(library(csv)).
:- dynamic edge/3.

checkn:-
  edge(Y,'Agartala',Actual, Shortest),
%  write(X),
  write(Y), write(Actual), write(Shortest),nl.

%edge(Same, Same, _):-
%  write("Same").

rows_to_lists(Rows, Lists):-
  maplist(row_to_list, Rows, Lists).

row_to_list(Row, List):-
  Row =.. [row|List].

remfirst([_|Tail], Tail).

cities([]).
cities([H|T], Citynames, Data):-
  remfirst(H, Citynames),
%  print(Citynames),
%  nl,
  Data=T.

create_facts([],City,[], _).
create_facts([C1|F], City, [G|H], [I|J]):-
%    write("in create_facts"),nl,
%    write(C1),write(G),nl,
%    not(edge(C1,City,G, _)),
    asserta(edge(C1,City,G, I)),
    asserta(edge(City,C1,G, I)),
    create_facts(F, City, H, J).

ite(Citynames, [], _).
ite(Citynames, [[City|D]|Ta], [[_|DH]|TaH]):-
%    write("In ITE"),nl,
%    print(City),nl,
%    print(D),
    create_facts(Citynames,City, D, DH),
%    write("after create_facts"),nl,
    ite(Citynames, Ta, TaH).

get_rows_data:-
  retractall(goal(_)),
  retractall(edge(_,_,_,_)),
  csv_read_file("E:\\Downloads\\New folder\\roaddistance1.csv", Rows, []),
  csv_read_file("E:\\Downloads\\New folder\\heuristic.csv", RowsH, []),

  rows_to_lists(Rows, Lists),
  rows_to_lists(RowsH, ListsH),

  cities(Lists, Citynames, Data),
  cities(ListsH, _, DataH),
  nl,
%  write("Going to ITE"),nl,

  ite(Citynames, Data, DataH),
  write("checking"),
%  assert(goal('Ahmedabad')),
%  solve('Agartala', Sol), nl, write(Sol),
  bfs,
  nl.

bfs :-
  nl,
  edge('Agartala', 'Ahmedabad', _, S),!,
  insert_open([S|['Agartala']], [], L),
%  write('1. '), write(L),nl,
%  Sum is 0,
  bestfirst(L, Sol).
%  insert_pq(State, [], [State]).

bestfirst(L, Sol):-
%  write('2. in bestfirst'),nl,
  pop(L, [H|[C]], L2),
%  insert_closed(C, Closed, ClosedList),
%  write(ClosedList),nl,
%  write('3. '), write(L), write(H),nl, write(C),nl,write(L2), nl,
%  Sum is Sum+H,
%  makepath(C, Sol, Sol2),
%  \+ member(C, ClosedList),
  getneighbors(C, L2, NeighborList, Path, Sol),
  write('4.'), write(NeighborList),nl,
  bestfirst(NeighborList, Sol).

pop([], [], []).
pop([H|T], H, T).

getneighbors(Ele, _, _, Path, [Ele|Path]):-
  goal(Ele).

getneighbors(Ele, L2, NeighborList, Path, Sol):-
  write('5. finding neighbors'),write(Ele),nl,nl,
  insert_path(Ele, Path, [Sol]),
  findall([Hn,City], edge(Ele, City, _, Hn), NList),
%  write('6. findall sol '),write(NList),nl,
  append(L2, NList, NList2),
  sort(NList2, NeighborList).
%  write('7. after sort '), write(NeighborList),nl.


makepath(Node, Path, [Node|Path]) :-
  goal(Node).

makepath(Node, Path, [Node|Path]).


insert_open(Item, [], [Item]).
insert_open(Item, L, [Item|L]).

insert_closed(X, [], [X]).
insert_closed(X, [Y | S], [Y | S2]) :- insert_closed(X, S, S2).

insert_path(I, [], [I]).
insert_path(I, K, [I|K]).






