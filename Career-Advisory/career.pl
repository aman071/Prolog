welcome:-
    write('Welcome to AI Career Counselor'),nl,
    write('Please enter your branch first: '),
    read(Branch_id),
    refer(Branch_id).

refer(Branch_id):-
    (   Branch_id =:= 0 ->
            write('cse')
            ;
        Branch_id =:= 1 ->
            write('ece')
            ;
        Branch_id =:= 2 ->
            write('csd')
            ;
        Branch_id =:= 3 ->
            write('csss')
            ;
            write('Incorrect option.'),
            nl,fail
    ).

cse :-
    write('I will ask a set of questions, please answer them 0 for No, 1 for Yes'),

