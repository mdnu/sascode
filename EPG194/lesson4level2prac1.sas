*we are creating a new table called 'fox' from the pg1.np_species table.
we are only including Mammals (as Category) having Common_Name including "Fox"
in any case. we also exclude fox squirrels, and drop the following columns:
Category, Record_Status, Occurrence, and Nativeness;

data fox;
	set pg1.np_species;
	where Category='Mammal' and upcase(Common_Names) like '%FOX%' 
	and upcase(Common_Names) not like '%SQUIRREL%';
	drop Category Record_Status Occurrence Nativeness;
run;

*now we sort the above table by Common_Names;
proc sort data=fox;
	by Common_Names;
run;

libname out "/home/marknunez0/EPG194/output";
data out.fox;	

*note that the value of Common_Names in the first row is 'Arctic Fox';
