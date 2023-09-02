domains
	list=symbol*
predicates
	list_member(symbol,list)
clauses
	list_member(X,[X|_]).
	list_member(X,[_|Tail]):-list_member(X,Tail).
	