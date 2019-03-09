data work.shoes;
	set sashelp.shoes;
	NetSales=Sales-Returns;
run;

/* above creates a new table called work.shoes */

proc means data=work.shoes mean sum MAXDEC=2;
	var NetSales;
	class region;
run;

/* above computes the means, with max decimals of 2 places 
this process analyzes the NetSales variable, dependent on the
class 'Region'.
i.e. we are looking at the NetSales grouped by Region and observing
the # of observations, the means, and the sums of all NetSales
for each region*/