predicates
	go
	fact(string,string)
	attempt(integer)
clauses
	go:-
		attempt(3).
	fact("Mihir","mihir@123"):-
		write("\nWelcome Mihir !").
	fact("Riya","riya@123"):-
		write("\nWelcome Riya !").
	attempt(0):-
		write("Unsuccessful attempt message"),nl.
	attempt(N):-
		write("Enter username: "),
		readln(U),nl,
		write("Enter password: "),
		readln(P),nl,
		fact(U,P).
	attempt(N):-
		NN=N-1,
		attempt(NN).