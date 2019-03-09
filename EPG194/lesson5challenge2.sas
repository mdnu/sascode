*we use a proc means step to analyze rows from pg1.np_multiyr.
we omit displaying the proc means report, we analyze Visitors grouped
by Region and Year. we only keep the rows that are a result of the combination
of Region and Year (how do we do this? with ways 2).
we drop _freq_ and _type_ columns, and create a column for TotalVisitors.
we use idgroup to add new columns with the top 3 max values of visitors for
each region and year;

proc means data=pg1.np_multiyr noprint;
	var Visitors;
	class Region Year;
	ways 2;
	output out=top3parks(drop=_freq_ _type_)
		sum=TotalVisitors
		idgroup(max(Visitors) out[3](Visitors ParkName)=);
		*out of Visitors and ParkName, we get the 3 max values.
		this code is a bit confusing, so return to it later.;
run;

*note that for the alaska region in 2010, the third highest # of park visitors
was 188,594.;
