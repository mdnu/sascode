*this code creates an output table called 'countrylist' from pg1.eu_occ table.
what happens is we remove the duplicate key values using nodupkey, and afterwards
we sort by Geo and by Country;
proc sort data=pg1.eu_occ out=countrylist nodupkey;
	by Geo Country;
run;
*note that the value of Geo is AT, and the value of Country is Austria;

*now we want to read ONLY Geo and Country from pg1.eu_occ.
i.e. we exclude all other columns, unlike what happens in the above code.
we use the KEEP= data set option;
proc sort data=pg1.eu_occ(keep=Geo Country) out=countrylist nodupkey;
	by Geo Country;
run;
