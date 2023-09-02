domains
	list=symbol*
predicates
	reverse(list,list,list)
clauses
	reverse([],L2,L3):-L3=L2.
	reverse([Head|Tail],L2,L3):-reverse(Tail,[Head|L2],L3).
	