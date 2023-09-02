trace
predicates
	isLeap(integer)
clauses
	isLeap(X):-
		X mod 4 = 0,
		X mod 100 <> 0,!.
	isLeap(X):-
		X mod 400=0.