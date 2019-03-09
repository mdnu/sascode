*initial code taken from p106p02.sas;
*here, we export to an rtf file with style journal, with pagebreaks
removed between proc results.;

ods rtf file="&outpath/ParkReport.rtf" style=journal startpage=no;
ods noproctitle;
options nodate;

title "US National Park Regional Usage Summary";

proc freq data=pg1.np_final;
    tables Region /nocum;
run;

proc means data=pg1.np_final mean median max nonobs maxdec=0;
    class Region;
    var DayVisits Campers;
run;

ods rtf style=sasdocprinter;
*note that to change styles for each proc result, we must
include a separate ods style statement.;
title2 'Day Vists vs. Camping';
proc sgplot data=pg1.np_final;
    vbar  Region / response=DayVisits;
    vline Region / response=Campers ;
run;
title;

ods proctitle;
ods rtf close;
options date;
*note that we omit the date using options nodate, but
turn it back on again with options date (for future submissions).;
