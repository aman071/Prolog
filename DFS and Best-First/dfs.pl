solve(Node, Solution) :-
  depthfirst([], Node, Solution).

depthfirst(Path, Node, [Node|Path]) :-
  goal(Node).

depthfirst(Path, Node, Sol) :-
  edge(Node, Node1),
  not(member(Node1, Path)),
  depthfirst([Node|Path], Node1, Sol).

edge(1, 3).
edge(1, 2).
edge(2, 4).
edge(3, 5).
edge(5, 6).
edge(4, 6).
goal(6).

