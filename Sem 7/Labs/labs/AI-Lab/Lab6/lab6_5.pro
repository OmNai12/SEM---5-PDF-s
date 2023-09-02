domains
	list=symbol*
predicates
	nth_element(list,integer)
clauses
	nth_element([Head|_],1):-
		write(Head),nl.
	nth_element([_|Tail],N):-
		NN=N-1,
		nth_element(Tail,NN).
	