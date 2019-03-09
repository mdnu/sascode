*we generate the mean, min, and max stats for the specific
columns (variables) Precip, Snow, TempMin, and TempMax.
we want our output values up to a max of 2 decimal points.
we group by Year and Name using class, and name our report
"Weather Statistics by Year and Park";

title "Weather Statistics by Year and Park";
proc means data=pg1.np_westweather mean min max maxdec=2;
	var Precip Snow TempMin TempMax;
	class Year Name;
run;
title;

*note that the mean tempmin in death value in 2016 was 65.61 fahrenheit.;
