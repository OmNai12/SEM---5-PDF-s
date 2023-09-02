predicates
	go
	factorial(integer,integer)
clauses
	go:-
		write("Enter number: "),
		readint(Y),
		factorial(1,Y).
	factorial(X,1):-
		write("Factorial is : ",X),nl.
	factorial(X,Y):-
		Z=X*Y,
		NN=Y-1,
		factorial(Z,NN).
		