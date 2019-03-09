%let cat=Amphibian;

data &cat;
	set pg1.np_species;
	where Category="&cat";
	drop Abundance Seasonality Conservation_Status;
run;

proc freq data=&cat;
	tables Record_Status;
run;

*note that 90.22% of mammal species have a Record_Status value of Approved;
*we also replaced 'mammal' with the macrovariable 'cat' for category.
we do this so that we can replace 'Mammal' with 'Amphibian'.
recall that macrovariables must be within double-quotes in references;

*note that the overall frequency of Amphibian is 619+124=743, where 619 are approved;
