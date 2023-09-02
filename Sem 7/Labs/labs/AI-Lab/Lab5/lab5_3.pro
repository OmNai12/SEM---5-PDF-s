predicates
	isdivisible(integer,integer)
	isprime(integer)
clauses
	isprime(X):-
		X<4,!.
	isprime(X):-
		not(isdivisible(X,4)).
	isdivisible(X,Y):-
		X mod Y = 0,!.
	isdivisible(X,Y):-
		YY = Y + 1,
		X/2 > YY,
		isdivisible(X,YY).
	