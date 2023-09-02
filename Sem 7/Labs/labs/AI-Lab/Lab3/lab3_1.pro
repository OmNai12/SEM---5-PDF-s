domains
	color = symbol
	name = string
predicates
	favorite(name,color)
	is(name,color)
	response(char)
	go
clauses
	go :-
		write("What is your name? "),
		readln(Name),
		favorite(Name,Color),
		write(Name,"likes color ",Color,"."),nl.
	go :-
		write("Sorry, I don't able to find your favorite color"),nl.

	is(Name,red_1) :-
		write("you are social,assertive & energetic (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,red_2) :-
		write("you are also moody and impulsive (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,red_3) :-
		write("you feel deep sympathy for fellow human beings (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,red_4) :-
		write("you are optimist (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,red_5) :-
		write("you are also a complainer (y/n) ?"),
		response(Reply),
		Reply='y'.

	is(Name,orange_1) :-
		write("you are good natured and enjoy being with others (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,orange_2) :-
		write("you are swayed by outside opinions (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,orange_3) :-
		write("you have strong loyalties (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,orange_4) :-
		write("you are very good at heart (y/n) ?"),
		response(Reply),
		Reply='y'.

	is(Name,yellow_1) :-
		write("you are imaginative and help the world (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,yellow_2) :-
		write("you speak lofty ideas without applying in practical (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,yellow_3) :-
		write("you are shy and mental loner (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,yellow_4) :-
		write("you crave admiration for your wisdom (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,yellow_5) :-
		write("you are a safe friend (y/n) ?"),
		response(Reply),
		Reply='y'.

	is(Name,green_1) :-
		write("you are good citizen and pillar of community (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,green_2) :-
		write("you are sensitive to social customs and etiquette (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,green_3) :-
		write("you are frank,moral and reputable (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,green_4) :-
		write("you make yourself a splendid teacher (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,green_5) :-
		write("you feel deep affection for your family (y/n) ?"),
		response(Reply),
		Reply='y'.

	is(Name,blue_1) :-
		write("you are deliberate and introspective (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,blue_2) :-
		write("you have conservative convictions (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,blue_3) :-
		write("you are sensitive to the feelings of others (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,blue_4) :-
		write("you are tight rein on your passions and enthusiasms (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,blue_5) :-
		write("you are loyal friend and lead a sober life (y/n) ?"),
		response(Reply),
		Reply='y'.

	is(Name,purple_1) :-
		write("you have good mind,a ready wit and ability to observe things (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,purple_2) :-
		write("you get angry easily (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,purple_3) :-
		write("you display fine_arts creativity (y/n) ?"),
		response(Reply),
		Reply='y'.
	
	is(Name,brown_1) :-
		write("you perform your duties very well (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,brown_2) :-
		write("you are clever with money matters (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,brown_3) :-
		write("you are dependable and steady (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,brown_4) :-
		write("you dislike impulsiveness and bargain very well (y/n) ?"),
		response(Reply),
		Reply='y'.

	is(Name,grey_1) :-
		write("you are cautions, try to strike compromise in sithuations (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,grey_2) :-
		write("you encounter and seek composure and peace (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,grey_3) :-
		write("you try very hard to fit yourself (y/n) ?"),
		response(Reply),
		Reply='y'.
	
	is(Name,black_1) :-
		write("you are above average,worldly,coventional,proper,polite and regal (y/n) ?"),
		response(Reply),
		Reply='y'.
	is(Name,black_2) :-
		write("you have depression and dignity (y/n) ?"),
		response(Reply),
		Reply='y'.

	favorite(Name,red) :-
		is(Name,red_1),
		is(Name,red_2),
		is(Name,red_3),
		is(Name,red_4),	
		is(Name,red_5).
	favorite(Name,orange) :-
		is(Name,orange_1),
		is(Name,orange_2),
		is(Name,orange_3),
		is(Name,orange_4).
	favorite(Name,yellow) :-
		is(Name,yellow_1),
		is(Name,yellow_2),
		is(Name,yellow_3),
		is(Name,yellow_4),	
		is(Name,yellow_5).
	favorite(Name,green) :-
		is(Name,green_1),
		is(Name,green_2),
		is(Name,green_3),
		is(Name,green_4),	
		is(Name,green_5).
	favorite(Name,blue) :-
		is(Name,blue_1),
		is(Name,blue_2),
		is(Name,blue_3),
		is(Name,blue_4),	
		is(Name,blue_5).
	favorite(Name,purple) :-
		is(Name,purple_1),
		is(Name,purple_2),
		is(Name,purple_3).
	favorite(Name,brown) :-
		is(Name,brown_1),
		is(Name,brown_2),
		is(Name,brown_3),
		is(Name,brown_4).
	favorite(Name,grey) :-
		is(Name,grey_1),
		is(Name,grey_2),
		is(Name,grey_3).
	favorite(Name,black) :-
		is(Name,black_1),
		is(Name,black_2).
	response(Reply) :-
		readchar(Reply),
		write(Reply),nl.