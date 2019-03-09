*initial code taken from p106p01.sas;
*we set the excel style to snow, and the sheet name
to "South Pacific Summary";

ods excel file="&outpath/StormStats.xlsx" style=snow
		options(sheet_name='South Pacific Summary');
ods noproctitle;

proc means data=pg1.storm_detail maxdec=0 median max;
    class Season;
    var Wind;
    where Basin='SP' and Season in (2014,2015,2016);
run;

ods excel options(sheet_name="Detail");
*note that we add a new sheet name for the proc print;
proc print data=pg1.storm_detail noobs;
    where Basin='SP' and Season in (2014,2015,2016);
    by Season;
run;

ods excel close;
ods proctitle;
*note that we turn off proc titles when we started and 
turn them back on again at the end;
