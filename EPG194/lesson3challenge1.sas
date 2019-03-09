*below code uses univariate summary stats to examine extreme values.
we turn ODS trace on to determine what output object is added for 'Extreme Observations';
*note that the output object we're looking for is called "ExtremeObs" in the log;
*ods trace on;

*now we're adding an ODS select to examine the Extreme Observation output.
there are ten extreme observations listed: the five lowest and five highest.;
*ods select ExtremeObs;

*now we modify the ods select to include ten for each lowest/highest instead
of just five, hence twenty extreme observations listed;
ods select ExtremeObs;
proc univariate data=pg1.eu_occ nextrobs=10;
	var Camp;
run;
*ods trace off;