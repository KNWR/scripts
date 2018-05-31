next steps:
a) set up sql_query file w/ common query

b) can copy_paste that query into py file => create base py file w/ all the queries 
	b (i) want a prototypical py function -- can have the other functions extend?   --- could actually do this in shell, don't neeed py for this
	b (ii) 

common params:
	- limiting # of notes printed to screen
	- sorting by ... most recently created, oldest, length of note
	- min / max length of note
	- higlight only, or highlight + note, or both 
	- searching for particular word or set of words included ... 

	- could build a constructor for search based on this -- series of prompts that build the searcher ... 


- faster way of sending common, regular queries -- this i can rate 
	- is this via -- a present query in a file, so running sqlite3 database.db < file.sql

		- Using python to allow for variables in sqlite queries (ex. maxlengthofnotequery.py) could have a couple diff queries in files in the folder, think that works well - maybe running via python, if possible to access functions in a .py doc from the terminal? - advantage of this is some variables that can enter via command line, ex. notes with > X words - would pass in the x via terminal
			- https://stackoverflow.com/a/4139476 
			- even better => https://stackoverflow.com/a/3987113 

- interface for seeing results of queries  -- not super important, can have it create an html file 
	- could have a .py file that wraps each output piece in relevant html tags
	- and then having a constructor for those results? in which case a .py file is helpful


what is the file structure like? 
