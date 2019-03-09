***********************************************************;
*  Filtering Rows with Basic Operators                    *;
***********************************************************;
*  Syntax and Example                                     *;
*                                                         *;
*    WHERE expression;                                    *;
*                                                         *;
*    Basic Operators:                                     *;
*         = , EQ                                          *;
*         ^= , ~= , NE                                    *;
*         > , GT                                          *;
*         < , LT                                          *;
*         >= , GE                                         *;
*         <= , LE                                         *;
*    SAS Date Constant                                    *;
*         "ddmmmyyyy"d ("01JAN2015"d)                     *;
***********************************************************;

proc print data=sashelp.cars;
	var Make Model Type MSRP MPG_City MPG_Highway;
	where Type="SUV" and MSRP <= 30000;
run;	

***********************************************************;
*  Demo                                                   *;
*    1) Write a PROC PRINT step to list the data in       *;
*       PG1.STORM_SUMMARY.                                *;
*    2) Write a WHERE statement to include rows with      *;
*       MaxWindMPH values greater than or equal to 156    *;
*       (Category 5 storms). Highlight the PROC PRINT     *;
*       step and run the selected code.                   *;
*    3) Modify the WHERE statement for each of the        *;
*       conditions below. Highlight the PROC PRINT step   *;
*       and run the selected code after each condition.   *;
*       a) Basin equal to WP (West Pacific)               *;
*       b) Basin equal to SI or NI (South Indian or North *;
*          Indian)                                        *;
*       c) StartDate on or after January 1, 2010          *;
*       d) Type equal to TS (tropical storm) and Hem_EW   *;
*          equal to W (west)                              *;
*       e) MaxWindMPH greater than 156 or MinPressure     *;
*          less than 920                                  *;
*    4) In the final WHERE statement, are missing values  *;
*       included for MinPressure? How can you exclude     *;
*       missing values?                                   *;
***********************************************************;

proc print data=pg1.storm_summary;
	*we only print category 5 storms;
	*where MaxWindMPH >= 156;
	
	*here, we only print basins in the west pacific;
	*where Basin in ("WP");
	
	*here, we only print basins in south and north indian oceans;
	*where Basin in ("SI" "NI");
	
	*here, we only print data on or after jan 1st, 2010;
	*where StartDate>= "01jan2010"d;

	*here, we only print tropical storms in western hemisphere;
	*where Type="TS" and Hem_EW="W";

	*simple and/or example.
	problem: this result will include missing values, which are treated as
	the smallest possible value;
	where MaxWindMPH > 156 or MinPressure < 920;
	
	*simple and/or example.
	here we exclude the missing values;
	where MaxWindMPH > 156 or 0 < MinPressure < 920;
run;
