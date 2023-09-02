predicates
	go
	fibonacci(integer)
	fibonacci2(integer,integer,integer)
clauses
	go:-
		write("Enter number: "),
		readint(N),
		fibonacci(N).
	fibonacci(0):-
		nl.
	fibonacci(1):-
		write("0").
	fibonacci(2):-
		write("0 1").
	fibonacci(N):-
		write("0 1"),
		NN=N-2,
		fibonacci2(NN,0,1).
	fibonacci2(N,A,B):-
		N>0,
		S=A+B,
		NewA=B,
		NewB=S,
		NN=N-1,
		write(" ",S),
		fibonacci2(NN,NewA,NewB).
		
		