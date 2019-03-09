*below, we use a proc freq step to analyze rows of pg1.np_codelookup.
we generate a 2-way freq (cross tabulation) for Type by Region.
we exclude all park types containing "Other".
we order the levels such that the level with most rows appear first,
using the 'order=freq' option in our proc declaration.
we also suppress column percentages with the nocol option.
we title the report as "Park Types by Region";

title "Park Types by Region";
proc freq data=pg1.np_codelookup order=freq;
	tables Type*Region / nocol;
	where Type not like '%Other%';
	*recall that statements like the one above must be in single quotes;
run;

*note that the top three park types based on total frequency count are:
National Historic Site (76), National Monument (69), and National Park (59);

*we modify proc freq above for the following changes:
we limit the park types to the top three park types from above.
we also use crosslist to display the table, alongside nocol.
note that this requires ods graphics on.
we add a freq plot which groups the bars by row variable (groupby=row), 
displaying row %s (scale=grouppercent), and has a horizontal orientation.
(orient=horizontal). we call the report "Selected Park Types by Region".
remember to clear the title at the end.;

title "Selected Park Types by Region";
ods graphics on;
proc freq data=pg1.np_codelookup order=freq;
	tables Type*Region / nocol crosslist
		plots=freqplot(groupby=row scale=grouppercent orient=horizontal);
	where Type in ("National Historic Site" "National Monument" "National Park");
	*recall that statements like the one above must be in single quotes;
run;
title;

*note that the region with the highest row percent value is Intermountain with 49.28%;
