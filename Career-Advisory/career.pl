cls :- write('\e[2J').

add(X,List,[X|List]).

/*    debugging, coding, database, web designging, problem solver, logical thinking, problem solving, working with data,
    imagination, creativity, design thinking, user experience, ui design, dealing with people, talking to people, market research
    hardware, processors, circuits,
*/

recommend(W, X, Y, Z,O)		:- (W == 1, X == 1, Y==1, Z==0), O = 'CSD might suit you.',nl.
recommend(W, X, Y, Z,O)		:- (W == 1, X == 0, Y==1, Z==0), O = 'CSSS might suit you.',nl.
recommend(W, X, Y, Z,O)		:- (W == 0, X == 0, Y==0, Z==1), O = 'ECE might suit you.',nl.
recommend(W, X, Y, Z,O)		:- (W == 1, X == 0, Y==0, Z==0), O = 'CSE might suit you.',nl.

welcome:-
    nl,write('Welcome to AI Career Counselor'),nl,
    write('Enter your roll number: '),read(Roll),nl,
    write('Please enter your branch from the list.'), nl, list_branches,
    nl,write('Enter number here: '),read(Branch_id),
    refer(Branch_id).


list_branches:-
    write('0: CSE'),nl,
    write('1: ECE'),nl,
    write('2: CSD'),nl,
    write('3: CSSS'),nl.


refer(Branch_id):-
    nth0(Branch_id, [cse, ece, csd, csss], Elem),
    (   Branch_id =:= 0 ->
            format('You chose ~w', [Elem]),nl,nl,
            cse
            ;
        Branch_id =:= 1 ->
            format('You chose ~w', [Elem]),nl,nl
            ;
        Branch_id =:= 2 ->
            format('You chose ~w', [Elem]),nl,nl
            ;
        Branch_id =:= 3 ->
            format('You chose ~w', [Elem]),nl,nl
            ;
            write('Incorrect option.'),
            nl,fail
    ).

cse :-
    write('We will ask you a set of questions, answer them 0 for No, 1 for Yes'), nl,
    write('Would you say you are very proficient at coding? '), read(Code),
    write('Would you say you are very proficient at designing? '), read(Des),
    write('Would you say you are very proficient at Social Science? '), read(Soc),
    write('Would you say you are very proficient at Electronics? '), read(Elec),
    recommend(Code, Des, Soc, Elec, Out), write(Out),nl.
