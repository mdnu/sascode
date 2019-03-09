%let ParkCode=ZION;
%let SpeciesCat=Bird;

proc freq data=pg1.np_species;
	*where Species_ID like "YOSE%" and Category like "Mammal";
	where Species_ID like "&ParkCode%" and Category like "&SpeciesCat";
	tables Abundance Conservation_Status;
run;

*note that 88 rows meet the two specified conditions for YOSE and Mammal;
*note that 301 rows meet the two specified conditions for ZION and Bird;
