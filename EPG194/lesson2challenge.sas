*this sas program will import a dat file that is delimited with "|".
it will take the delimiter into account and import the data correctly,
and will show the contents of the imported data;

proc import datafile="/home/marknunez0/EPG194/data/np_traffic.dat"
			dbms=dlm
			out=traffic2
			replace;
	guessingrows=max;
	delimiter="|";
	getnames=yes;
run;

proc contents data=traffic2;
run;
