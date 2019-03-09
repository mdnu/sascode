data Storm_cat5;
	set pg1.storm_summary;
	where MaxWindMPH >= 156 and StartDate >= "01jan2000"d;
	keep Season Basin Name Type MaxWindMPH;
run;

libname out "/home/marknunez0/EPG194/output";
data out.storm_cat5;

*note: there have been 18 cat-5 storms since jan 1st, 2000;
