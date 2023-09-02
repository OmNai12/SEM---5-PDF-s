predicates
	go
	findroot(integer,integer,integer)
clauses
	go:-
		write("enter a,b,c in order: "),
		readint(A),
		readint(B),
		readint(C),
		findroot(A,B,C).
	findroot(A,B,C):-
		T1=B*B,
		T2=4*A*C,
		T3=T1-T2,
		T3<0,
		write("roots are complex"),nl.
	findroot(A,B,C):-
		T1=B*B,
		T2=4*A*C,
		T3=2*A,
		T4=T1-T2,
		R1=(((-1)*B)+sqrt(T4))/T3,
		R2=(((-1)*B)-sqrt(T4))/T3,
		write("roots are ",R1," and ",R2,"."),nl.