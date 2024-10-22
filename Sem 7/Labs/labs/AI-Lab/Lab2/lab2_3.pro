trace
domains
	course_name,difficulty_level,available_status,item_name,name=symbol
predicates
	course(course_name,difficulty_level)
	books(course_name,available_status)
	has(course_name,item_name)
	takes(name,course_name)
clauses
	course(hardware,easy).
	course(logic,not_easy).
	course(graphics,easy).
	books(hardware,available).
	books(db,available).
	has(graphics,credits_8).
	has(graphics,lab_components).
	takes(mary,compilers).
	takes(_,Y):-course(Y,easy),books(Y,available).
	takes(_,Y):-has(Y,credits_8),has(Y,lab_components).