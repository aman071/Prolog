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
    write('Do you like doing market research? '), read(Answer9), add_knowledge(market_research, Answer9), nl,
    check_cse_career.

check_csd_career :-
    likes(design_thinking,0),nl,
    write('See, we understand that you might not feel very confident in design thinking right now. It is a process, a mindset which takes time to develop. However, that mindset is crucial for this field. As well as loving what you do is critical. It is a very fulfilling process or going from ideation to product, making products or services for users so that you can improve their lives. You should try to actually enjoy the process. We can make some recommendations for you to practice these skills.'),nl,
    write('1. Udemy: Introduction to Graphic Design: Udemy, as most of you already know, is an online learning platform aimed at professionals, catering courses created by experts. The platform is filled with amazing courses whose legibility you can judge by the number of people who have rated/taken the course. '),nl,
    write('2. Skillshare: Skillshare is another online learning platform, but it also doubles as a community for creative individuals. It offers plenty of graphic design courses, all of which can be readily accessed by a subscription plan. You don’t have to pay for the courses individually, but through a single monthly subscription fee, you get access to all of Skillshares content.'),nl,
    write('3. Hackdesign.org: Hackdesign offers one of the most complete and structured online course for learning graphic designing. If you want to explore this skill but don’t feel like investing, then you will find Hack Design to offer the perfect solution. You will get access to a number of links and posts, all of which are well structured.'),nl,
    write('4. DesignLab: DesignLab is an ideal online graphic design learning platform for you. The platform provides users with complete hands-on projects to help them grasp the designing concepts. '), nl.

check_csd_career :-
    likes(design_thinking,1), likes(code, 1), likes(ui, 1), likes(gaming, 0), nl,
    write('You are a good fit for the following careers: '),nl,
    write('1. Graphic designer: These professionals create designs for marketing collateral, product illustrations, brand identities and websites using computer software like the Adobe® Creative Suite. They merge technical skill with artistic ability to create a design that resonates with its desired audience. Graphic designers may work independently as freelancers or contractors, in an in-house setting for a company or in an agency setting.'), nl,
    write('2. UI designer: User interface design is, in fact, a crucial subset of UX—but it’s important to recognize that they are two separate roles. UI design focuses on the user’s visual experience, determining how they interact with the product interface.'), nl,
    write('3. Web designer: Often described as the graphic designers of the digital world, they are responsible for planning, designing, and building websites, calling on a mixture of both technical and creative skills. The art lies in understanding the client’s vision and turning it into a visually compelling, fully functional website.'), nl,
    write('4. NLP Scientist: NLP stands for Natural language processing and it involves giving machines the ability to understand human language. This means that machines can eventually talk with humans in our own language(Need a friend to talk to? Talk with your machine!). An NLP Scientist basically helps in the creation of a machine that can learn patterns of speech and also translate spoken words into other languages. This means that the NLP Scientist should be fluent in the syntax, spelling, and grammar of at least one language in addition to machine learning so that a machine can acquire the same skills. '), nl.


check_csd_career :-
    likes(design_thinking,1), likes(code, 1), likes(ux, 1), likes(gaming,1), nl,
    write('You are a good fit for the following careers: '),nl,
    write('1. UX designer:  They conduct extensive research into the customer’s needs and use these findings to make smart design decisions.'), nl,
    write('2. Product designer: Product designers are concerned with both the aesthetics and functionality of a product. When designing or redesigning an object, product designers will consider things like shape, ergonomics, size, color, and weight.'), nl,
    write('4. Video game designer: Video game designers are storytellers, programmers, and visual artists all rolled into one. They are responsible for drawing up video game concepts based on the target audience, and then bringing this concept to life.'), nl.


csd :-
    write('We will ask you a set of questions, answer them 0 for No, 1 for Yes'), nl,
    write('Do you like design thinking? '), read(Answer1), add_knowledge(design_thinking, Answer1), nl,
    write('Do you like coding? '), read(Answer2), add_knowledge(code, Answer2), nl,
    write('Would you say you have a good imagination? '), read(Answer3),  add_knowledge(imagination, Answer3), nl,
    write('Would you say you are a creative person? '), read(Answer4),  add_knowledge(creative, Answer4), nl,
    write('Do you like the domain of user experience? '), read(Answer5), add_knowledge(ux, Answer5), nl,
    write('Do you like the domain of user interface design? '), read(Answer6), add_knowledge(ui, Answer6), nl,
    write('Do you like talking to users? '), read(Answer7),  add_knowledge(talk_to_user, Answer7), nl,
    write('Do you like doing market research? '), read(Answer8), add_knowledge(market_research, Answer8), nl,
    write('Do you like gaming? '), read(Answer9), add_knowledge(gaming, Answer9), nl.


check_csss_career :-
    likes(market_research,1), likes(data_collection, 1), likes(data_analyst, 1), likes(analytical, 1), nl,
    write('You are a good fit for the following careers: '),nl,
    write('1. Survey Researcher: Survey researchers find employment in academic institutions, nonprofit organizations, corporations, research firms, government agencies and polling organizations. The surveys they create may cover a wide range of topics, from scientific to political and social to economic. Survey researchers are professionals who specialize in creating quality surveys and interpreting the information that results. '), nl,
    write('2. Data Warehouse Specialist: A data warehouse specialist works with teams of computer gurus, designing and implementing systems that solve specific client problems. You also make sure the system is maintained, reconciled, updated, and backed up as needed.'), nl,
    write('3. Data Architect: Data Architects ensure the complete and successful building and integration of data systems and all of their components. With careful architecture, they ensure the implementation, organization, and reliability of those systems.'), nl,
    write('4. Human-Centered Machine Learning Designer: Human-Centered Machine Learning Designer develops various systems that can perform Human Centered Machine Learning based on information processing and pattern recognition. This allows the machine to “learn” the preferences of individual humans.'), nl.

csss :-
    write('We will ask you a set of questions, answer them 0 for No, 1 for Yes'), nl,
    write('Do you like logical reasoning? '), read(Answer1), add_knowledge(logical, Answer1), nl,
    write('Do you like analytical methods of evaluation? '), read(Answer2), add_knowledge(analytical, Answer2), nl,
    write('Do you like market research? '), read(Answer3),  add_knowledge(market_research, Answer3), nl,
    write('Do you like data collection? '), read(Answer4),  add_knowledge(data_collection, Answer4), nl,
    write('Do you think about solutions from economic, societal, and environment contexts? '), read(Answer5), add_knowledge(context, Answer5),nl,
    write('Do you like doing Data Analytics? '), read(Answer6), add_knowledge(data_analyst, Answer6), nl.

check_ece_career :-
    likes(electronics,0),nl,
    write('See, we understand that you might not feel very confident in this field right now. That is completely alright. However, it is a process. Loving what you do is critical. It is a very wide domain and has so many possibilities and interesting applications. There are tons of research going onon in this field and the possibility to innovate is limitless. You should try to enjoy the process. We can make some recommendations for you to practice these skills.'),nl,
    write('1. MIT OpenCourseWare: MITOpenCourseWare provides lecture notes, exams, and videos without any required registration. The course best suited for those seeking to learn electrical engineering is Circuits and Electronics, which includes more than 20 video lectures. '),nl,
    write('2. Collin Cunningham’s MAKE Series: MAKE magazine is on YouTube, bringing DIY to technology. For people who want to learn electrical engineering online, Collin Cunningham’s MAKE Series is a perfect place to start.'),nl,
    write('3. Electromechanical Library: The Electromechanical Library’s focus is on devices, systems, and applications, and includes a robust collection of interest to people who want to study electrical engineering.'),nl,
    write('4. Arduino: Arduino is an “open-source electronics prototyping platform based on flexible, easy-to-use hardware and software.” The best part about Arduino is that they provide materials for purchase as well as free online video tutorials so that beginners in electrical engineering can gain hands-on experience and practice.'), nl.

check_ece_career :-
    likes(debug,1), likes(code, 1), likes(complicated, 1), likes(robotics, 0), nl,
    write('You are a good fit for the following careers: '),nl,
    write('1. Graphic designer: These professionals create designs for marketing collateral, product illustrations, brand identities and websites using computer software like the Adobe® Creative Suite. They merge technical skill with artistic ability to create a design that resonates with its desired audience. Graphic designers may work independently as freelancers or contractors, in an in-house setting for a company or in an agency setting.'), nl,
    write('2. UI designer: User interface design is, in fact, a crucial subset of UX—but it’s important to recognize that they are two separate roles. UI design focuses on the user’s visual experience, determining how they interact with the product interface.'), nl,
    write('3. Web designer: Often described as the graphic designers of the digital world, they are responsible for planning, designing, and building websites, calling on a mixture of both technical and creative skills. The art lies in understanding the client’s vision and turning it into a visually compelling, fully functional website.'), nl,
    write('4. NLP Scientist: NLP stands for Natural language processing and it involves giving machines the ability to understand human language. This means that machines can eventually talk with humans in our own language(Need a friend to talk to? Talk with your machine!). An NLP Scientist basically helps in the creation of a machine that can learn patterns of speech and also translate spoken words into other languages. This means that the NLP Scientist should be fluent in the syntax, spelling, and grammar of at least one language in addition to machine learning so that a machine can acquire the same skills. '), nl.


check_ece_career :-
    likes(design_thinking,1), likes(code, 1), likes(ux, 1), likes(gaming,1), nl,
    write('You are a good fit for the following careers: '),nl,
    write('1. UX designer:  They conduct extensive research into the customer’s needs and use these findings to make smart design decisions.'), nl,
    write('2. Product designer: Product designers are concerned with both the aesthetics and functionality of a product. When designing or redesigning an object, product designers will consider things like shape, ergonomics, size, color, and weight.'), nl,
    write('4. Video game designer: Video game designers are storytellers, programmers, and visual artists all rolled into one. They are responsible for drawing up video game concepts based on the target audience, and then bringing this concept to life.'), nl.


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
    write('Do you like physics? '), read(Answer6), add_knowledge(physics, Answer6), nl,
    write('Do you enjoy Electronics? '), read(Answer7), add_knowledge(electronics, Answer7), nl.
    /*Why Six Sigma for ECE professionals. How does it help? Six Sigma is a customer-centric manufacturing approach to realizing fewer defects and thus lowering costs and increasing customer satisfaction.

The engineering fraternity is greatly benefited from Six Sigma certification as it helps to break down a task into a much-simplified form. It will provide tools and techniques to standardize work methods thus reducing rework and wastage.*/
