% Sources
% https://stackoverflow.com/questions/23183662/prolog-parsing-a-csv-file
% https://stackoverflow.com/questions/24095068/import-csv-file-data-to-populate-a-prolog-knowledge-base

:- use_module(library(apply)).
:- use_module(library(csv)).
:- dynamic edge/3.

checkn:-
  edge(Y,'Agartala',Z),
%  write(X),
  write(Y), write(Z),nl.

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
  Data=T.

create_facts([],City,[]).
create_facts([C1|F], City, [G|H]):-
%    write("in create_facts"),nl,
    asserta(edge(C1,City,G)),
    asserta(edge(City,C1,G)),
    create_facts(F, City, H).

ite(Citynames, []).
ite(Citynames, [[City|D]|Ta]):-
%    write("In ITE"),nl,
%    print(City),nl,
%    print(D),nl,nl,
    create_facts(Citynames,City, D),
%    write("after create_facts"),nl,
    ite(Citynames, Ta).

get_rows_data:-
  retractall(goal(_)),
  csv_read_file("D:\\Myinterests\\Sem7\\AI\\Prolog\\DFS and Best-First\\roaddistance1.csv", Rows, []),
  rows_to_lists(Rows, Lists),
  cities(Lists, Citynames, Data),
%  print(Data),
%  write("Going to ITE"),nl,
%  write(Citynames),nl, write(Data),
  ite(Citynames, Data), nl,
  write("checking"),
%  checkn,
  assert(goal('Hubli')),
  solve('Agartala', Sol), nl, write(Sol).

solve(Node, Solution) :-
  dfs([], Node, Solution).

dfs(Path, Node, [Node|Path]) :-
  goal(Node).

dfs(Path, Node, Sol) :-
%  write('hi'),nl,
  edge(Neighbor, Node, _),
  Neighbor \= Node,
  \+ member(Neighbor, Path),
%  write(Path),nl,
  dfs([Node|Path], Neighbor, Sol).










