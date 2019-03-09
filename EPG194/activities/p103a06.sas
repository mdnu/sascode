***********************************************************;
*  Activity 3.06                                          *;
*    1) Highlight the PROC PRINT step and run the         *;
*       selected code. Notice how the values of Lat, Lon, *;
*       StartDate, and EndDate are displayed in the       *;
*       report.                                           *;
*    2) Change the width of the DATE format to 7 and run  *;
*       the PROC PRINT step. How does the display of      *;
*       StartDate and EndDate change?                     *;
*    3) Change the width of the DATE format to 11 and run *;
*       the PROC PRINT step. How does the display of      *;
*       StartDate and EndDate change?                     *;
*    4) Highlight the PROC FREQ step and run the selected *;
*       code. Notice that the report includes the number  *;
*       of storms for each StartDate.                     *;
*    5) Add a FORMAT statement to apply the MONNAME.      *;
*       format to StartDate and run the PROC FREQ step.   *;
*       How many rows are in the report?                  *;
***********************************************************;

*we change date9. to date7.
what this does is change the four digit year to a two digit year.
next, we changed the width again to 11 (i.e. date11.)
what changed? now the date includes dashes in between the date values;
proc print data=pg1.storm_summary(obs=20);
	format Lat Lon 4. StartDate EndDate date11.;
run;

*for the code below, we're adding a format statement for StartDate using
"monname.". before, the data was shown individually, not grouped by month.
adding this format statement will group all occurences by the month that they
occured, hence giving us 12 rows of data;
proc freq data=pg1.storm_summary order=freq;
	tables StartDate;
	*Add a FORMAT statement;
	format StartDate monname.;
run;
