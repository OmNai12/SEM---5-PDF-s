domains
	simbol = string
predicates
	pria (simbol)
	raja (simbol)
	guling (simbol, simbol)
	pendekar (simbol)
	tidaksetia (simbol, simbol)
clauses
	pria (lembusora).
	raja (jayakatwang).
	guling (lembusora, jayakatwang).
	pendekar (X) :- pria (X).
	tidaksetia (X, Y) :- pendekar (X),
				raja (Y),
				guling (X, Y).