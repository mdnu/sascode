***********************************************************;
*  LESSON 2, PRACTICE 1                                   *;
*    a) Complete the PROC PRINT statement to list the     *;
*       first 20 observations in PG1.NP_SUMMARY.          *;
*    b) Add a VAR statement to include only the following *;
*       variables: Reg, Type, ParkName, DayVisits,        *;
*       TentCampers, and RVCampers. Highlight the step    *;
*       and run the selected code.                        *;
*       Do you observe any possible inconsistencies in    *;
*       the data?                                         *;
*    c) Copy the PROC PRINT step and paste it at the end  *;
*       of the program. Change PRINT to MEANS and remove  *;
*       the OBS= data set option. Modify the VAR          *;
*       statement to calculate summary statistics for     *;
*       DayVisits, TentCampers, and RVCampers. Highlight  *;
*       the step and run the selected code.               *;
*       What is the minimum value for tent campers? Is    *;
*       that value unexpected?                            *;
*    d) Copy the PROC MEANS step and paste it at the end  *;
*       of the program. Change MEANS to UNIVARIATE.       *;
*       Highlight the step and run the selected code.     *;
*       Are there negative values for any of the columns? *;
*    e) Copy the PROC UNIVARIATE step and paste it at the *;
*       end of the program. Change UNIVARIATE to FREQ.    *;
*       Change the VAR statement to a TABLES statement to *;
*       produce frequency tables for Reg and Type.        *;
*       Highlight the step and run the selected code.     *;
*       Are there any lowercase codes? Are there any      *;
*       codes that occur only once in the table?          *;
*    f) Add comments before each step to document the     *;
*       program. Save the program as np_validate.sas in   *;
*       the output folder.                                *;
***********************************************************;

*below code will show a summary of first 20 obs from np_summary table.
we see inconsistencies in the data: Type column has inconsistent column names;
proc print data=pg1.np_summary (obs=20);
	var Reg Type ParkName DayVisits TentCampers RVCampers;
run;

*below code will compute the means of the whole table.
notice that the minimum value for tent campers is 0.
this is not unexpected, since it's possible that some parks would have
zero tent campers (think of extreme weather parks);
proc means data=pg1.np_summary;
	var DayVisits TentCampers RVCampers;
run;

*below code will use univariate summary statistics to examine extreme values.
notice that none of the columns have negative values;
proc univariate data=pg1.np_summary;
	var DayVisits TentCampers RVCampers;
run;

*below code will list unique values and frequencies for selected variables
Reg and Type. note that there are no lowercase codes.
there are codes that occur only once in the table: NC, NPRE and RIVERWAYS;
proc freq data=pg1.np_summary;
	tables Reg Type;
run;
