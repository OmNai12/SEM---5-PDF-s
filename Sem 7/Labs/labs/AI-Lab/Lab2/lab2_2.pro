domains
	name=symbol
predicates
	male(name)
	female(name)
	parent(name,name)
	father(name,name)
	mother(name,name)
	grandfather(name,name)
	grandmother(name,name)
	brother(name,name)
	sister(name,name)
	uncle(name,name)
	aunt(name,name)
	nephew(name,name)
	niece(name,name)
	wife(name,name)
clauses
	male(pandu).
	male(nakula).
	male(sahadeva).
	male(arjuna).
	male(bhima).
	male(yudhishthhira).
	male(srutakarma).
	male(sutasoma).
	male(abhimanyu).
	male(iravan).
	male(babhruvahana).

	female(madri).
	female(kunti).
	female(draupadi).
	female(satatika).
	female(prativindhya).
	female(subhadra).
	female(ulupi).
	female(citrangada).
	female(srutakirti).

	parent(madri,nakula).
	parent(pandu,nakula).
	parent(madri,sahadeva).
	parent(pandu,sahadeva).
	
	parent(pandu,arjuna).
	parent(kunti,arjuna).
	parent(pandu,bhima).
	parent(kunti,bhima).
	parent(pandu,yudhishthhira).
	parent(kunti,yudhishthhira).

	parent(nakula,satatika).
	parent(draupadi,satatika).

	parent(sahadeva,srutakarma).
	parent(draupadi,srutakarma).

	parent(bhima,sutasoma).
	parent(draupadi,sutasoma).

	parent(yudhishthhira,prativindhya).
	parent(draupadi,prativindhya).

	parent(arjuna,srutakirti).
	parent(draupadi,srutakirti).
	parent(arjuna,abhimanyu).
	parent(subhadra,abhimanyu).
	parent(arjuna,iravan).
	parent(ulupi,iravan).
	parent(arjuna,babhruvahana).
	parent(citrangada,babhruvahana).

	wife(madri,pandu).
	wife(kunti,pandu).
	wife(draupadi,nakula).
	wife(draupadi,sahadeva).
	wife(draupadi,bhima).
	wife(draupadi,yudhishthhira).
	wife(draupadi,arjuna).
	wife(subhadra,arjuna).
	wife(ulupi,arjuna).
	wife(citrangada,arjuna).

	father(X,Y):-parent(X,Y),male(X).
	mother(X,Y):-parent(X,Y),female(X).
	grandfather(X,Y):-parent(X,Z),parent(Z,Y),male(X).
	grandmother(X,Y):-parent(X,Z),parent(Z,Y),female(X).
	brother(X,Y):-parent(Z,X),parent(Z,Y),male(X).
	sister(X,Y):-parent(Z,X),parent(Z,Y),female(X).
	uncle(X,Y):-father(Z,Y),brother(X,Z),male(X).
	aunt(X,Y):-father(Z,Y),brother(W,Z),wife(X,W),female(X).
	nephew(X,Y):-father(Z,X),brother(Y,Z),male(X).
	nephew(X,Y):-father(Z,X),brother(W,Z),wife(Y,W),male(X).
	niece(X,Y):-father(Z,X),brother(Y,Z),female(X).
	niece(X,Y):-father(Z,X),brother(W,Z),wife(Y,W),female(X).