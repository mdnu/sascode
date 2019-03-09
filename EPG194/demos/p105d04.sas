***********************************************************;
*  Creating Summary Statistics Reports                    *;
***********************************************************;
*  Syntax and Example                                     *;
*                                                         *;
*    PROC MEANS DATA=input-table stat-list;               *;
*        VAR col-name (s);                                *;
*        CLASS col-name (s);                              *;
*        WAYS n;                                          *;
*    RUN;                                                 *;
***********************************************************;

proc means data=sashelp.heart mean median std maxdec=1;
	var Height Weight Cholesterol;
	class Chol_Status BP_Status;
	ways 1;
run;   

***********************************************************;
*  Demo (Highlight the PROC MEANS step and run the        *;
*        selected code after each step.)                  *;
*    1) Run the step and examine the starting report.     *;
*    2) List the following statistics in the PROC MEANS   *;
*       statement: MEAN, MEDIAN, MIN, and MAX. Add the    *;
*       MAXDEC=0 option to round statistics to the        *;
*       nearest integer.                                  *;
*    3) The CLASS statement can be used to calculate      *;
*       statistics for groups. Add a CLASS statement and  *;
*       list the BasinName column.                        *;
*    4) Add StormType as an additional column in the      *;
*       CLASS statement. Run the program and notice that  *;
*       one report is created with statistics that are    *;
*       calculated for the combination of BasinName and   *;
*       StormType values.                                 *;
*    5) The WAYS statement can be used to indicate the    *;
*       combinations of class columns to use for creating *;
*       the report. Add the WAYS statement and provide a  *;
*       value of 1.                                       *;
*    6) Change the WAYS statement to list 0, 1, and 2.    *;
***********************************************************;

*we specify that we want to compute the summary stats below,
as well as having maxdec=0 enabled to round up to the nearest
integer;
proc means data=pg1.storm_final mean median min max maxdec=0;
	var MaxWindMPH;
	class BasinName StormType;
	*class statement groups the data, so we calculate stats for each
	value of BasinName. note that unlike by statement which requires
	sorting before grouping, we don't need to sort here.
	we also include StormType to subgroup within BasinName values;
	
	*ways 1;
	*allows us to control how the values of the class variables are used
	to segment the data. ex: ways 1 creates two tables. each table uses the
	values from one of the class columns. first table uses values from StormType
	while the 2nd uses values from BasinName.;
	
	ways 0 1 2;
	*above produces 1 graph for 0, 2 graphs for 1, and 1 graph for 2.
	note that when ways is 2, we use the combination of BasinName and StormType,
	and ways 0 uses no class variables: i.e. we compute summary stats for the whole
	table instead.;
run;
