predicates
	go
	fibonacci(integer,integer,integer)
clauses
	go:-
		write("Enter number: "),
		readint(N),
		fibonacci(N,0,1).
	fibonacci(1,X,_):-
		write(X).
	fibonacci(2,_,X):-
		write(X).
	fibonacci(N,A,B):-
		S=A+B,
		NewA=B,
		NewB=S,
		NN=N-1,
		fibonacci(NN,NewA,NewB).
		
		