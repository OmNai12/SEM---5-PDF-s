domains
	name = person(first_name,last_name) /* (First, Last) */
	address = add(house_no,street_name,city,pin_code) /* (Month, Day, Year) */
	first_name,last_name,street_name,city=symbol
	house_no=integer
	pin_code=real
	department=symbol
	position=symbol
	salary=real

predicates
	employee(name,address,symbol,symbol,real)
	salary_higher_then_thresold
	employees_available_in_department
	employees_holding_position
	check_thresold_value(real,real)
	write_person(name,salary)
	write_person(name)

clauses
	salary_higher_then_thresold:-
		write("Enter the thresold value"),
		readreal(Thresold_salary),nl,
		write("Salary higher then ",Thresold_salary),nl,nl,
		write("First_name Last_Name Salary\n"),
		employee(Person,_,_,_,Salary),
		check_thresold_value(Thresold_salary,Salary),
		write_person(Person,Salary),
		fail.

	salary_higher_then_thresold:-
		write("\n Press any key to continue: "),
		readchar(_).

	employees_available_in_department:-
		write("Enter the department name"),nl,
		Readln(Department_name),nl,
		write(Department_name," department employees"),nl,nl,
		write("First_name Last_Name\n"),
		employee(Person,_,Department_name,_,_),
		write_person(Person),
		fail.

	employees_available_in_department:-
		write("\n\n Press any key to continue: "),nl,
		readchar(_).

	employees_holding_position:-
		write("Enter the position name"),nl,
		Readln(Position_name),nl,
		write(Position_name," position employees"),nl,nl,
		write("First_name Last_Name\n"),
		employee(Person,_,_,Position_name,_),
		write_person(Person),
		fail.

	employees_holding_position:-
		write("\n\n Press any key to continue: "),nl,
		readchar(_).

	write_person(person(First_name,Last_name),Salary):-
		write(First_name," ",Last_name," ",Salary),nl.

	write_person(person(First_name,Last_name)):-
		write(First_name," ",Last_name),nl.

	check_thresold_value(Thresold_salary,Salary):-
		Salary > Thresold_salary.

	employee(person(mihir, modi),add(38,subodhnagar_society,vadodara,390011),"computer","programmer_analyst",600000).
	employee(person(ayarn, modi),add(4,dharti_township,palanpur,390012),"computer","web_developer",1100000).
	employee(person(gaurav, mori),add(69,bhutiya_mahel,bhavanagar,390013),"computer","software_developer",600000).
	employee(person(devansh, maru),add(99,thakur_ki_haveli,rajkot,390014),"it","programmer_analyst",1500000).
	employee(person(riya, modi),add(10,akshardham_society,vadodara,390015),"it","web_developer",600000).
