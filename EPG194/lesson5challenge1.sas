*initial code taken from p105p03.sas;
*we first highlight the first title and step and run them.
this subsets the pg1.np_codelookup table for three park types:
National Historic Site, National Monument, and National Park
using a stacked layout with a horizontal orientation.;

title1 'Counts of Selected Park Types by Park Region';
ods graphics on;
proc freq data=pg1.np_codelookup order=freq;
	tables Type*Region / crosslist plots=freqplot(twoway=stacked orient=horizontal);
	where type in ('National Historic Site', 'National Monument', 'National Park');
run;

/*part b*/
*use proc sgplot for a more customized frequency bar chart.
the hbar statement makes a horizontal bar chart with separate bars for each Region.
we include a group= option which segments each bar by distinct values of Type.
we customize the appearance and position of the legend using the keylegend statement.
we add reference lines on the horizontal axis using the xaxis grid statement.;
title1 'Counts of Selected Park Types by Park Region';
proc sgplot data=pg1.np_codelookup;
    where Type in ('National Historic Site', 'National Monument', 'National Park');
    hbar region / group=type;
    keylegend / opaque across=1 position=bottomright location=inside;
    xaxis grid;
run;

*now we make our own by customizing the HBAR statement options:
we display labels on each segment of the bars (seglabel),
change the fill attributes for each bar so that the colour has 50% transparency,
and we change the colour effect on the bars using DATASKIN.;
title1 'Counts of Selected Park Types by Park Region, Report #2';
proc sgplot data=pg1.np_codelookup;
    where Type in ('National Historic Site', 'National Monument', 'National Park');
    hbar region / group=type seglabel 
    		fillattrs=(transparency=0.5) dataskin=crisp;
    keylegend / opaque across=1 position=bottomright location=inside;
    xaxis grid;
run;

title;
