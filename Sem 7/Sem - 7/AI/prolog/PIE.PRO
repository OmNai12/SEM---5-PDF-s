/*****************************************************************************
			Prolog Inference Engine
			=======================

  Copyright (c) 1986, 88 by Borland International, Inc

  Module PIE.PRO: The declarations and main program

  This program implements the Prolog inference engine as described in
  appendix K (META-PROGRAMMING) in the Turbo Prolog manual.
*****************************************************************************/

config "pie.sys"
check_determ code=3600 trail=1000 errorlevel=0

CONSTANTS
% implement_trace = true

DOMAINS
  TERM  = reference
		var(VID);
		cmp(REFSYMB,TERML);list(TERM,TERM); nill;
		atom(REFSYMB); int(REFINT);
		str(REFSTR); char(REFCHAR)

  TERML = reference TERM*

  REFINT	= reference INTEGER
  REFSYMB	= reference STRING
  REFSTR	= reference STRING
  REFCHAR	= reference char
  VID		= reference STRING

/*---------- INTERPRETER ENVIRONMENT ------------------*/
  E	= e(VID,TERM)
  ENV	= reference E*

/*---------- MISC HANDY DOMAIN DECLARATIONS ------------------*/
  OP	= STRING	% Storing of operators
  XFY	= STRING	% xfy; yfx; xfx; yfy; fx; fy; xf; yf
  ASSOC = x; y		% The associavity to the left or the right
  PRIOR = INTEGER	% Priority of operators
  DISPLAY = SYMBOL	% Display mode for term writer

  FILE = temp; seeing; telling

/*---------- SCANNER DOMAINS ------------------*/
  TOK		= lbrack; rbrack; lpar; rpar; lcurly; rcurly;
		  var(STRING);	  atom(STRING);
		  int(INTEGER); str(STRING); char(CHAR);
		  comma; bar; dot

  CURSORTOK	= t(TOK,CURSOR)
  CURSOR	= INTEGER
  TOKL		= CURSORTOK*

/*---------- PARSER DOMAINS ------------------*/
  STERM            = var(STRING);
		     cmp(STRING,STERML);
		     list(STERM,STERM); nill;
		     atom(STRING);
		     int(INTEGER);
		     str(STRING);
		     char(CHAR)

  STERML           = STERM*

PREDICATES % Need to be compiles first due to memory limitations
  nondeterm call(STRING,TERML)

/* ---------- The clause and operator database ------------------- */
DATABASE
   determ traceflag
   op(PRIOR,XFY,OP)
   clause(STERM,STERM)

CLAUSES
  op(1200,xfx,":-").	op(1100,xfy,";").	op(1000,xfy,",").
  op(900,fy,"not").	op(700,xfx,"=").	op(700,xfx,"\\=").
  op(700,xfx,"is").	op(700,xfx,"<").	op(700,xfx,"=<").
  op(700,xfx,">").	op(700,xfx,">=").	op(700,xfx,"==").
  op(700,xfx,"\\==").	op(700,xfx,"=..").	op(500,yfx,"+").
  op(500,fx,"+").	op(500,yfx,"-").	op(500,fx,"-").
  op(400,yfx,"*").	op(400,yfx,"/").	op(300,xfx,"mod").

/*****************************************************************************
	Include files	
*****************************************************************************/

include "pie.sca"	% The scanner
include "pie.par"	% The operator precedence parser
include "pie.out"	% The term
include "pie.inf"	% The inference engine

/*****************************************************************************
	USER INTERFACE
*****************************************************************************/

DATABASE - counter
  determ counter(INTEGER)

PREDICATES
  run
  init_counter
  count
  wsol(INTEGER)
  wenv(ENV)
  handle_usergoal(STERM)
  errorhnd(INTEGER)
  nondeterm repread(STRING,STRING)

CLAUSES
  run:- textmode(ROWS,COLS),
  	RR=ROWS-1,
  	makewindow(3,7,7,"Prolog Inference Engine Trace",2,20,20,60),
  	makewindow(1,112,0,"",RR,0,1,COLS),
  	write(" Esc: Aborts     help: help information     list:list clauses     edit:editor"),
  	makewindow(2,7,7,"Prolog Inference Engine Dialog",0,0,RR,COLS),
  	write("\nGoal: "),
	readln(FIRSTL),
	repread(FIRSTL,L),
	init_counter,
  	tokl(0,L,TOKL),	s_term(TOKL,_,TERM),
	trap(handle_usergoal(TERM),E,errorhnd(E)),
ifdef implement_trace
	traceflag, % If trace is turned on show the trace window
	retractall(traceflag),
	shiftwindow(3),
	write("Press any key\n"),
	readchar(_),
	shiftwindow(2),
enddef
	fail.

  handle_usergoal(cmp(":-",[HEAD,BODY])):-!,
	convhead(HEAD,HEAD1),
	assert(clause(HEAD1,BODY)),
	write("Asserted").
  handle_usergoal(TERM):-
  	free(ENV),
	getbacktrack(BTOP),
	unify_body(TERM,ENV,BTOP),
	wenv(ENV),nl,
	count,
	free(ENV), % Give only one solution when there are no variables
	cutbacktrack(BTOP),
	fail.
  handle_usergoal(_):-
	closefile(seeing),closefile(telling),
	counter(X),wsol(X).

  errorhnd(0):-!.
  errorhnd(N):-
	errormsg("prolog.err",N,A,_),
	write(A).

  repread(L,L).
  repread(_,L):-write("\nGoal: "),readln(LL),repread(LL,L).

  init_counter:-
	retractall(_,counter),assert(counter(0)).

  count:-retract(counter(N)),N1=N+1,assert(counter(N1)).

  wsol(0):-!,write("No solutions").
  wsol(1):-!,write("1 Solution").
  wsol(N):-write(N," Solutions").

  wenv(L):-free(L),!,write("True").
  wenv([e(VAR,TERM)|T]):-free(T),!,write(VAR,'='),wterm("write",TERM).
  wenv([e(VAR,TERM)|T]):-write(VAR,'='),wterm("write",TERM),write(", "),wenv(T).

GOAL run.
