***********************************************************;
*  Activity 3.04                                          *;
*    1) Change the value in the %LET statement from NA to *;
*       SP.                                               *;
*    2) Run the program and carefully read the log.       *;
*       Which procedure did not produce a report?         *;
*       What is different about the WHERE statement in    *;
*       that step?                                        *;
***********************************************************;

%let BasinCode=SP;

proc means data=pg1.storm_summary;
	where Basin="&BasinCode";
	var MaxWindMPH MinPressure;
run;

*note that the freq step below did not produce a report.
why? since there were 0 observations found. the reason is that
this statement used single quotes and not double quotes. fix this and
the problem is solved. we'll get a second report.;
proc freq data=pg1.storm_summary;
	where Basin="&BasinCode";
	tables Type;
run;
