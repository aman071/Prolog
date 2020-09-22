cls :- write('\e[2J').

add(X,List,[X|List]).

list_branches:-
    write('0: CSE'),nl,
    write('1: ECE'),nl,
    write('2: CSD'),nl,
    write('3: CSSS'),nl.


welcome:-
    nl,write('Welcome to AI Career Counselor'),nl,
    write('Enter your roll number: '),read(Roll), asserta(getRoll(Roll)),nl,
    write('Please enter your branch from the list.'), nl, list_branches,
    nl,write('Enter number here: '),read(Branch_id),
    refer(Branch_id),
    retractall(likes(Roll,_,_)).


refer(Branch_id):-
    nth0(Branch_id, [cse, ece, csd, csss], Elem),
    (   Branch_id =:= 0 ->
            format('You chose ~w', [Elem]),nl,nl,
            general_interest(Elem)
            ;
        Branch_id =:= 1 ->
            format('You chose ~w', [Elem]),nl,nl,
            general_interest(Elem)
            ;
        Branch_id =:= 2 ->
            format('You chose ~w', [Elem]),nl,nl,
            general_interest(Elem)
            ;
        Branch_id =:= 3 ->
            format('You chose ~w', [Elem]),nl,nl,
            general_interest(Elem)
            ;
            write('Incorrect option.'),
            nl,fail
    ).

/* code, des, social, electronics */
recommend(W, X, Y, Z, Roll, O)		:- (W == 1, X == 1, Y==1, Z==0), O = 'CSD might suit you. ',
                                           asserta(likes(Roll,code)),asserta(likes(Roll,des)),asserta(likes(Roll,social)), nl.

recommend(W, X, Y, Z, Roll, O)		:- (W == 1, X == 1, Y==1, Z==0), O = 'CSD might suit you. ',
                                           asserta(likes(Roll,code)),asserta(likes(Roll,social)), nl.

recommend(W, X, Y, Z, Roll, O)		:- (W == 1, X == 1, Y==1, Z==0), O = 'CSD might suit you. ',
                                           asserta(likes(Roll,social)), nl.

recommend(W, X, Y, Z, Roll, O)		:- (W == 1, X == 1, Y==1, Z==0), O = 'CSD might suit you. ',
                                           asserta(likes(Roll,code)), nl.

general_interest(From_branch):-
    write('We will ask you a set of questions, answer them 0 for No, 1 for Yes'), nl,
    write('Would you say you are very proficient at coding? '), read(Code),
    write('Do you like designing? '), read(Des),
    write('Would you say you are very interested Social Science? '), read(Soc),
    write('Would you say you are very proficient at Electronics? '), read(Elec),
    getRoll(Roll),
    recommend(Code, Des, Soc, Elec, Roll, Out), write(Out), format('Would you like to explore that or go with ~w? ',[From_branch]), nl,
    write('Enter the branch in lower case: '), read(Choice),nl,
    (  Choice == 'csd' ->
            write(' Going to CSD careers'),nl,
            csd
            ;
            format('Going forward with ~w',[From_branch]),nl,nl,
            go_to(From_branch)
    ).


/*    debugging, coding, database, web designging, problem solver, logical thinking, problem solving, working with data,
    imagination, creativity, design thinking, user experience, ui design, dealing with people, talking to people, market research
    hardware, processors, circuits,
*/

go_to(From_branch):- From_branch == 'cse', cse.
go_to(From_branch):- From_branch == 'csd', csd.
go_to(From_branch):- From_branch == 'csss', csss.
go_to(From_branch):- From_branch == 'ece', ece.


add_knowledge(What,Answer):- assert(likes(What,Answer)).

/*debugging, coding, database, web designging, problem solver, logical thinking, problem solving, working with data,
    imagination, creativity, design thinking, user experience, ui design, dealing with people, talking to people, market research
    hardware, processors, circuits,
*/

check_cse_career :-
    likes(debug,1),likes(code,1),likes(problem_solving,1),likes(data_analyst,1),
    write('You are a good fit for the following careers: '),nl.


cse :-
    write('We will ask you a set of questions, answer them 0 for No, 1 for Yes'), nl,
    write('Do you like debugging code? '), read(Answer1), add_knowledge(debug, Answer1), nl,
    write('Do you like coding? '), read(Answer2), add_knowledge(code, Answer2), nl,
    write('Do you like database management? '), read(Answer3),  add_knowledge(database, Answer3), nl,
    write('Do you like problem solving? '), read(Answer4),  add_knowledge(problem_solving, Answer4), nl,
    write('Do you like working with data? '), read(Answer5), add_knowledge(data_analyst, Answer5), nl,
    write('Do you like Machine Learning? '), read(Answer6), add_knowledge(data_analyst, Answer6), nl.
