*below, we use a proc freq step to analyze rows of pg1.np_species.
we use a tables statement to generate a freq table for Category
and an order=freq option in the step declaration to sort the results
by descending frequency.
we include 'nocum' to suppress cumulative columns, and we title the
report.;

title "Categories of Reported Species";
proc freq data=pg1.np_species order=freq;
	tables Category / nocum;
run;

*note that 5.20% of the species are fungi;

*we modify proc freq above for the following changes:
we focus on rows where species ID begins with "EVER", and Category is
not "Vascular Plant".
we enable ods graphics, and disable the procedure title.
we also add the plots=freqplot option to tables so we display freq plots.
we also add a second title "in the Everglades";

ods graphics on;
ods noproctitle;
title "Categories of Reported Species";
title2 "in the Everglades";
proc freq data=pg1.np_species order=freq;
	tables Category / nocum plots=freqplot;
	where Species_ID like "EVER%" and Category ne "Vascular Plant";
run;

title;

*note that the amphibian category has the smallest frequency, at 17;
