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
    likes(debug,0),likes(code,0),nl,
    write('See, we understand that you might not feel proficient at coding right now. However, the ability to code and debug problems, as well as loving what you do is critical to succeeding in this field. Coding is fun, and you should try to actually enjoy the process. We can make some recommendations for you to practice these skills.'),nl,
    write('1. 1. Codeacademy: One of the most popular free places to learn coding is Codeacademy. In fact, more than 45 million people have already learned how to code through this educational company’s engaging experience. '),nl,
    write('Coursera: Founded in 2012, Coursera has grown into a major for-profit educational-technology company that has offered more than 1,000 courses from 119 institutions.'),nl,
    write('3. edX: EdX is another leading online-learning platform that is open source instead of for-profit. It was founded by Harvard University and MIT in 2012, so you know that you’ll learn about cutting-edge technologies and theories. Today, edX includes 53 schools. You probably can’t go wrong with the free Introduction to Computer Science from Harvard University.'),nl,
    write('4. Udemy: Founded in 2010, Udemy is an online learning platform that can be used as a way to improve or learn job skills. While there are courses you have to pay for, there are plenty of free programming courses, which are taught via video lessons, such as Programming for Entrepreneurs '), nl,
    write('5. Khan Academy: Created in 2006 by educator Salman Khan, Khan Academy is one of the original free online-learning institutions. With step-by-step video tutorials, you can  learn how to program drawings, animations and games using JavaScript and ProcessingJS, or learn how to create webpages with HTML and CSS. See, especially, Khan\'s "Hour of Code," designed to introduce students to one hour of computer science and computer programming. '),nl.

check_cse_career :-
    likes(debug,1),likes(code,1),likes(problem_solving,1), likes(market_research, 1),
    write('Thank you for your answers! We believe that you answers may allow you to be a good fit for a CSD or CSSS career as well. Would you like to explore that? '),read(Explore),nl,
    (  Explore == 'csd' ->
            write(' Going to CSD careers'),nl,
            csd
            ;
       Explore == 'csss' ->
            write(' Going to CSSS careers'),nl,
            csss
            ;
            write(' Going to CSE careers'),nl
    ).


check_cse_career :-
    likes(debug,1),likes(code,1),likes(problem_solving,1),likes(data_analyst,1), likes(dec_making, 1), likes(ml,0),
    write('You are a good fit for the following careers: '),nl,
    write('1. Business Analyst: Analytical people shine when they’re able to critically examine an issue and come up with a solution—a key process in the role of a business analyst.'), nl,
    write('2. Accountant: Analytical brains often go hand in hand with a love of facts and figures, making them a natural fit for accounting. Attention to detail will prove extremely useful when interpreting and analysing financial data for clients.'), nl,
    write('3. Logistics Manager: It can take a hefty amount of data to manage the large-scale storage and distribution of goods, and to ensure a supply chain runs effectively. '), nl,
    write('4. Data Engineer: Data engineers build massive reservoirs for data and are key in managing those reservoirs as well as the data churned out by our digital activities. They develop, construct, test, and maintain data-storing architecture — like databases and large-scale data processing systems. '), nl,
    write('5. Software Developer/Engineer: Software developers design or customize software (usually for computers but potentially for a range of machinery or hardware). They are involved in optimizing existing software to improve efficiency or overcome problems. An important part of their job is to evaluate software requirements and user needs to determine software feasibility.'),nl,
    write('6. Web Developer: Web developers design and build websites – back-end developers design the technical construction and overall framework for a site, whereas front end developers are responsible for how a website looks. They spot and correct bugs identified through testing or user feedback. Developers integrate graphics, audio and video into the website and create and test web applications.'),nl.



check_cse_career :-
    likes(debug,1),likes(code,1),likes(problem_solving,1),likes(data_analyst,1), likes(dec_making, 1), likes(big_pic, 1), likes(ml,1),

    write('You are a good fit for the following careers: '),nl,
    write('1. Database Administrator: DB Admins identify user needs and create and administer databases that meet them. They maintain databases, ensuring they are up to date, secure and backed up. They are also involved in identifying and fixing bugs in the system, developing systems to ensure that this does not affect operational efficiency or risk data loss. Also, they create and test modifications to the structure of the database as required.'), nl,
    write('2. Business Intelligence Analyst: BI Analysts devise and assess market strategies by analysing connected trends such as market, share or product trends and utilize business intelligence and trend data to recommend strategies for growth and development. They ensure that colleagues have access to synthesised business data and provide management with clear analysis and reports. They are responsbile for maintaining knowledge of cutting edge business and industry trends and are involved in gathering information from a wide range of sources such as public information, industry resources and purchased sources.'), nl,
    write('3. Machine Learning Engineer: A Machine Learning Engineer is an engineer (duh!) that runs various machine learning experiments using programming languages such as Python, Java, Scala, etc. with the appropriate machine learning libraries.  '), nl,
    write('4. NLP Scientist: NLP stands for Natural language processing and it involves giving machines the ability to understand human language. This means that machines can eventually talk with humans in our own language(Need a friend to talk to? Talk with your machine!). An NLP Scientist basically helps in the creation of a machine that can learn patterns of speech and also translate spoken words into other languages. This means that the NLP Scientist should be fluent in the syntax, spelling, and grammar of at least one language in addition to machine learning so that a machine can acquire the same skills. '), nl.




cse :-
    write('We will ask you a set of questions, answer them 0 for No, 1 for Yes'), nl,
    write('Do you like debugging code? '), read(Answer1), add_knowledge(debug, Answer1), nl,
    write('Do you like coding? '), read(Answer2), add_knowledge(code, Answer2), nl,
    write('Do you like database management? '), read(Answer3),  add_knowledge(database, Answer3), nl,
    write('Do you like problem solving? '), read(Answer4),  add_knowledge(problem_solving, Answer4), nl,
    write('Do you like working with data? '), read(Answer5), add_knowledge(data_analyst, Answer5), nl,
    write('Do you like Machine Learning? '), read(Answer6), add_knowledge(ml, Answer6), nl,
    write('Would you say you have good decision-making skills? '), read(Answer7), add_knowledge(dec_making, Answer7), nl,
    write('Would you say you have the ability to Communicate the Big Picture? '), read(Answer8), add_knowledge(big_pic, Answer8), nl,
    write('Do you like doing market research? '), read(Answer9), add_knowledge(market_research, Answer9), nl.


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
