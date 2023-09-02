domains
	health_condition,habit_detail = symbol
	name = string
predicates
	health(name,health_condition)
	habit(name,habit_detail)
	response(char)
	go
clauses
	go :-
		write("What is your name? "),
		readln(Name),
		health(Name,Health_condition),
		write(Name," health is ",Health_condition,"."),nl.
	go :-
		write("Sorry, I don't able to find your health condition"),nl.

	habit(Name,bad_1) :-
		write("you has habit of regular smoking (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,bad_2) :-
		write("you has habit of excessive drinking regularly (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,bad_3) :-
		write("you has habit of taking drugs (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,bad_4) :-
		write("you has habit of eating oily food and taking too much sugar with foods (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,bad_5) :-
		write("you acts like an owl means sleep hours is less (y/n) ?"),
		response(Reply),
		Reply='y'.

	habit(Name,good_1) :-
		write("you has habit of drinking milk regularly (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,good_2) :-
		write("you has habit of eating green vegetables or eggs in meal (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,good_3) :-
		write("you has habit of drinking enough water during day (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,good_4) :-
		write("you has habit of regular exercise (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,good_5) :-
		write("you has regular sleep and regular walk (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,good_6) :-
		write("you has habit of brushing teeth (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,good_7) :-
		write("you washing hair and using showers regularly (y/n) ?"),
		response(Reply),
		Reply='y'.

	habit(Name,moderate_1) :-
		write("you has habit of eating oily food and having regular walk (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,moderate_2) :-
		write("you has habit of food with excessive sugar and having regular walks (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,moderate_3) :-
		write("you has habit of eating oily food and doing regular exercise (y/n) ?"),
		response(Reply),
		Reply='y'.
	habit(Name,moderate_4) :-
		write("you has habit of eating food with excessive sugar and taking walk (y/n) ?"),
		response(Reply),
		Reply='y'.

	health(Name,bad) :-
		habit(Name,bad_1),
		habit(Name,bad_2),
		habit(Name,bad_3),
		habit(Name,bad_4),	
		habit(Name,bad_5).
	health(Name,good) :-
		habit(Name,good_1),
		habit(Name,good_2),
		habit(Name,good_3),
		habit(Name,good_4),
		habit(Name,good_5),
		habit(Name,good_6),
		habit(Name,good_7).
	health(Name,moderate) :-
		habit(Name,moderate_1),
		habit(Name,moderate_2),
		habit(Name,moderate_3),
		habit(Name,moderate_4).
	response(Reply) :-
		readchar(Reply),
		write(Reply),nl.