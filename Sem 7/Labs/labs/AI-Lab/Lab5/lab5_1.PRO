predicates
	min(integer,integer,integer)
	max(integer,integer,integer)
clauses
	max(Y,Z,X):-
		Y>Z,
		X=Y,!.
	max(Y,Z,X):-
		Y<Z,
		X=Z.
	min(Y,Z,X):-
		Y<Z,
		X=Y,!.
	min(Y,Z,X):-
		Y>Z,
		X=Z.
		
	