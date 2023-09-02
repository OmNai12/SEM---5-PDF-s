domains
	list=symbol*
predicates
	concatenate(list,list,list)
clauses
	concatenate([],L,L).
	concatenate([X|L1],L2,[X|L3]):-concatenate(L1,L2,L3).
	