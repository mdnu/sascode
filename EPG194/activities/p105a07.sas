***********************************************************;
*  Activity 5.07                                          *;
*    1) Run the PROC MEANS step and compare the report    *;
*       and the wind_stats table. Are the same statistics *;
*       in the report and table? What do the first five   *;
*       rows in the table represent?                      *;
*    2) Uncomment the WAYS statement. Delete the          *;
*       statistics listed in the PROC MEANS statement and *;
*       add the NOPRINT option. Run the program. Notice   *;
*       that a report is not generated and the first five *;
*       rows from the previous table are excluded.        *;
*    3) Add the following options in the OUTPUT statement *;
*       and run the program again. How many rows are in   *;
*       the output table?                                 *;
*         output out=wind_stats mean=AvgWind max=MaxWind; *;
***********************************************************;

proc means data=pg1.storm_final mean median max;
	var MaxWindMPH;
	class BasinName;
	*ways 1;
	output out=wind_stats;
	*note that out=wind_stats will create different stats from the
	ones made by the proc means statement. the output data has 5 rows
	for each value of BasinName, one for each statistic in the _STAT_
	column. the stats in the first 5 rows of the output data summarizes
	the whole table.;
run;

*we now uncomment the ways statement and delete the stats specified
in the proc means statement. we also include a noprint option. note that
no report is generated, and the first 5 rows of the previous table are omitted.;
proc means data=pg1.storm_final noprint;
	var MaxWindMPH;
	class BasinName;
	ways 1;
	*output out=wind_stats;
	*we modify the output statement below;
	output out=wind_stats mean=AvgWind max=MaxWind;
run;

*note that there are 6 rows in the output table generated from the previous step.
one row for each BasinName value.;
