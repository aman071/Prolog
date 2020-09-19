cls :- write('\e[2J').

welcome:-
    nl,write('Welcome to AI Career Counselor'),nl,
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
    write('I will ask a set of questions, answer them 0 for No, 1 for Yes').
