*we use a proc means step to analyze rows from pg1.np_westweather.
we exclude rows where values for Precip are != 0,
we analyze Precip grouped by Name and Year,
we only create an output table called "rainstats", with columns.
for N and SUM statistics (i.e. noprint, and output statements),
naming the columns RainDays and TotalRain respectively,
and we keep the rows that are the combination of Year and Name.
i.e. ways 2;

proc means data=pg1.np_westweather noprint;
	where Precip ne 0;
	var Precip;
	class Name Year;
	ways 2;
	output out=rainstats n=RainDays sum=TotalRain;
run;

*note that there are 12 rows in rainstats;

*we now print the rainstats table with a proc print step.
we omit printing obs numbers, and we display column labels.
we display the columns in the order: Name, Year, RainDays, TotalRain;

title "Rain Statistics by Year and Park";
proc print data=rainstats noobs label;
    var Name Year RainDays TotalRain;
    label Name="Park Name"
    		RainDays = "Number of Days Raining"
    		TotalRain = "Total Rain Amount (inches)";
run;
title;

*note that the total rain amount (inches) in row one is 2.45;
