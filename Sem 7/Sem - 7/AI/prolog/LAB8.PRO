domains
name,address = symbol
text = string
l = integer

predicates
start
repeat
selectItem(integer)
questionData
quiz(integer,integer)
finish
compare(text,text)

database
questionDB(l,text,text,text,text,text,text)

goal
clearwindow,

makewindow(1,7,7,"Welcome to KBC",0,0,25,80),
start.

clauses
repeat.
repeat:-
repeat.

start:-
repeat,
write("\n0. Exit"),
write("\n1. Enter a new question."),
write("\n2. Let's play KBC."),
write("\nEnter your choice:: "),
readint(Choice),
selectItem(Choice),
Choice=0.

selectItem(0).
selectItem(1):-
consult("results.txt"),
questionData,

fail.
selectItem(2):-
consult("results.txt"),
quiz(1,1000),
fail.
selectItem(2):-
finish.

questionData:-
write("\nOuestion No:: "),
readint(QNo),
write("Question:: "),
readln(Q),
write("Option A:: "),
readln(A),
write("Option B:: "),
readln(B),
write("Option C:: "),
readln(C),
write("Option D:: "),
readln(D),
write("Correct Answer :: "),

readln(Ans),
assert(questionDB(QNo,Q,A,B,C,D,Ans)),
save("results.txt").

quiz(QNo,N):-
retract(questionDB(QNo,Q,A,B,C,D,Ans)),
write("\nQuestion For ",N," Rs is :: "),
write("\nQuestion (",QNo,") ",Q),
write("\nA)",A),
write("\nB)",B),
write("\nC)",C),
write("\nD)",D),
write("\nEnter your answer :: "),
readln(Ans1),
compare(Ans,Ans1),!,
N1 = N*2,
QNo1 = QNo+1,
write("\nYou won ",N," Rs\n"),
quiz(QNo1,N1).

compare(X,Y):-
X = Y,write("Correct answer").

compare(X,Y):-
write("incorrect answer"),
fail.

finish:-
write("Hope you enjoyed the game.\n").

