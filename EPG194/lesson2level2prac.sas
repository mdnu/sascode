*this sas program will import the np_traffic csv file and display
its contents, with no truncation of the observation data;

proc import datafile="/home/marknunez0/EPG194/data/np_traffic.csv" 
			dbms=csv
			out=traffic 
			replace;
	guessingrows=max;
run;

proc contents data=traffic;
run;
