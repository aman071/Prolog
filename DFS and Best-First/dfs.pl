go(Start, Goal) :-
	empty_stack(Empty_been_list),
	stack(Start, Empty_been_list, Been_list),
	path(Start, Goal, Been_list).

	% path implements a depth first search in PROLOG

	% Current state = goal, print out been list
path(Goal, Goal, Been_list) :-
	reverse_print_stack(Been_list).

path(State, Goal, Been_list) :-
	mov(State, Next),
	% not(unsafe(Next)),
	not(member_stack(Next, Been_list)),
	stack(Next, Been_list, New_been_list),
	path(Next, Goal, New_been_list), !.

reverse_print_stack(S) :-
	empty_stack(S).

reverse_print_stack(S) :-
	stack(E, Rest, S),
	reverse_print_stack(Rest),
	write(E), nl.


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

