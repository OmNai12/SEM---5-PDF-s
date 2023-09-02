predicates
	go
	sum(integer,integer)
clauses
	go:-
		write("Enter number: "),
		readint(Y),
		sum(0,Y).
	sum(S,0):-
		write("Sum is : ",S),nl.
	sum(S,Y):-
		Z=S+Y,
		NN=Y-1,
		sum(Z,NN).
		