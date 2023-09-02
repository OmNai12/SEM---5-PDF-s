domains
	list=symbol*
predicates
	lastElement(list,symbol)
clauses
	lastElement([Y],X):-X=Y.
	lastElement([_|Tail],X):-lastElement(Tail,X).