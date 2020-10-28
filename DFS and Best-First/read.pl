% Sources
% https://stackoverflow.com/questions/23183662/prolog-parsing-a-csv-file
% https://stackoverflow.com/questions/24095068/import-csv-file-data-to-populate-a-prolog-knowledge-base

:- use_module(library(apply)).
:- use_module(library(csv)).

checkn:-
  edge(Y,'Agartala',Z),
%  write(X),
  write(Y), write(Z),nl.

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

create_facts([],City,[]).
create_facts([C1|F], City, [G|H]):-
%    write("in create_facts"),nl,
%    write(C1),write(G),nl,
    asserta(edge(C1,City,G)),
    create_facts(F, City, H).

ite(Citynames, []).
ite(Citynames, [[City|D]|Ta]):-
%    write("In ITE"),nl,
%    print(City),nl,
%    print(D),
    create_facts(Citynames,City, D),
%    write("after create_facts"),nl,
    ite(Citynames, Ta).

get_rows_data:-
  csv_read_file("D:\\Myinterests\\Sem7\\AI\\Prolog\\DFS and Best-First\\roaddistance1.csv", Rows, []),
  rows_to_lists(Rows, Lists),
  cities(Lists, Citynames, Data),
%  print(Data),
  nl,
  write("Going to ITE"),nl,
  ite(Citynames, Data),
  write("checking"),
  assert(goal('Ahmedabad')),
%  checkn,
  solve('Agartala', Sol), nl, write(Sol),
  nl.

solve(Node, Solution) :-
  depthfirst([], Node, Solution).

depthfirst(Path, Node, [Node|Path]) :-
  goal(Node).

depthfirst(Path, Node, Sol) :-
  edge(Node1, Node, Cost),
  not(member(Node1, Path)),
  depthfirst([Node|Path], Node1, Sol).










