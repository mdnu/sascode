***********************************************************;
*  Reading and Filtering Data with SQL                    *;
***********************************************************;
*  Syntax and Example                                     *;
*                                                         *;
*    PROC SQL;                                            *;
*        SELECT col-name, col-name FORMAT=fmt             *;
*        FROM input-table                                 *;
*        WHERE expression                                 *;
*        ORDER BY col-name <DESC>;                        *;
*    QUIT;                                                *;
*                                                         *;
*    New column in SELECT list:                           *;
*    expression AS col-name                               *;
***********************************************************;

/* proc sql; */
/* select Name, Age, Height*2.54 as HeightCM format 5.1, */
/*        Birthdate format=date9. */
/*     from pg1.class_birthdate */
/*     where age > 14 */
/*     order by Height desc; */
/* quit;  */
 
***********************************************************;
*  Demo                                                   *;
*    1) Add a SELECT statement to retrieve all columns    *;
*       from PG1.STORM_FINAL. Highlight the step and run  *;
*       the selected code. Examine the log and results.   *;
*    2) Modify the query to retrieve only the Season,     *;
*       Name, StartDate, and MaxWindMPH columns. Format   *;
*       StartDate with MMDDYY10. Highlight the step and   *;
*       run the selected code.                            *;
*    3) Modify Name in the SELECT clause to convert the   *;
*       values to proper case.                            *;
*    4) Add a WHERE clause to include storms during or    *;
*       after the 2000 season with MaxWindMPH greater     *;
*       than 156.                                         *;
*    5) Add an ORDER BY clause to arrange rows by         *;
*       descending MaxWindMPH, and then by Name.          *;
*    6) Add TITLE statements to describe the report.      *;
*       Highlight the step and run the selected code.     *;
***********************************************************;

title "International Storms since 2000";
title2 "Category 5 (Wind > 156)";
proc sql;
*Add SELECT statement;
*select *;

*selecting subset below;
*select Season, Name, StartDate format=mmddyy10., MaxWindMPH

*name in proper case:;
select Season, propcase(Name) as Name, StartDate format=mmddyy10., MaxWindMPH
	from pg1.storm_final
	where MaxWindMPH > 156 and Season > 2000
	order by MaxWindMPH desc, Name;
	*note that we order by MaxWindMPH by descending order,
	and order within this order by Name.;
quit;

title;
