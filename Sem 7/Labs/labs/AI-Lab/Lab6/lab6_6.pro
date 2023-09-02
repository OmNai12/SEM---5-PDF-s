trace
domains
	list=integer*
predicates
	split(list,list,list)
clauses
	split([], [], []).
	split([Head|Tail], [Head|List1], List2) :- Head>=0, split(Tail, List1, List2).
	split([Head|Tail], List1, [Head|List2]) :- Head<0, split(Tail, List1, List2).
	


