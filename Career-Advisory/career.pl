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

csd :-
    write('We will ask you a set of questions, answer them 0 for No, 1 for Yes'), nl,
    write('Do you like design thinking? '), read(Answer1), add_knowledge(design_thinking, Answer1), nl,
    write('Do you like coding? '), read(Answer2), add_knowledge(code, Answer2), nl,
    write('Would you say you have a good imagination? '), read(Answer3),  add_knowledge(imagination, Answer3), nl,
    write('Would you say you are a creative person? '), read(Answer4),  add_knowledge(creative, Answer4), nl,
    write('Do you like the domain of user experience? '), read(Answer5), add_knowledge(ux, Answer5), nl,
    write('Do you like the domain of user interface design? '), read(Answer6), add_knowledge(ui, Answer6), nl,
    write('Do you like talking to users? '), read(Answer7),  add_knowledge(talk_to_user, Answer7), nl,
    write('Do you like doing market research? '), read(Answer8), add_knowledge(market_research, Answer8), nl.


csss :-
    write('We will ask you a set of questions, answer them 0 for No, 1 for Yes'), nl,
    write('Do you like logical reasoning? '), read(Answer1), add_knowledge(logical, Answer1), nl,
    write('Do you like analytical methods of evaluation? '), read(Answer2), add_knowledge(analytical, Answer2), nl,
    write('Do you like market research? '), read(Answer3),  add_knowledge(market_research, Answer3), nl,
    write('Do you like data collection? '), read(Answer4),  add_knowledge(data_collection, Answer4), nl,
    write('Do you think about solutions from economic, societal, and environment contexts? '), read(Answer5), add_knowledge(context, Answer5),nl,
    write('Do you like doing Data Analytics? '), read(Answer6), add_knowledge(data_analyst, Answer6), nl.

ece :-
    write('We will ask you a set of questions, answer them 0 for No, 1 for Yes'), nl,
    /*desktop suport*/
    write('Do you like debugging code? '), read(Answer1), add_knowledge(debug, Answer1), nl,
    write('Do you like coding? '), read(Answer2), add_knowledge(code, Answer2), nl,
    /*system control, technical advisor */
    write('Do you like designing of complicated systems but also testing? '), read(Answer3),  add_knowledge(complicated, Answer3), nl,
    /*robotics*/
    write('Do you like designing of controllers, micro-controllers, programmable logic controllers? '), read(Answer4),  add_knowledge(controllers, Answer4), nl,
    write('Do you like analysis, synthesis, and modification of signals? '), read(Answer5), add_knowledge(signals, Answer5), nl,
    /*instrumentation*/
    write('Do you like physics? '), read(Answer6), add_knowledge(physics, Answer6), nl.
    /*Why Six Sigma for ECE professionals. How does it help? Six Sigma is a customer-centric manufacturing approach to realizing fewer defects and thus lowering costs and increasing customer satisfaction.

The engineering fraternity is greatly benefited from Six Sigma certification as it helps to break down a task into a much-simplified form. It will provide tools and techniques to standardize work methods thus reducing rework and wastage.*/
