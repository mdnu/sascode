***********************************************************;
*  Joining Tables with PROC SQL                           *;
***********************************************************;
*  Syntax and Example                                     *;
*                                                         *;
*    PROC SQL;                                            *;
*        SELECT col-name, col-name                        *;
*        FROM input-table1 INNER JOIN input-table2        *;
*        ON table1.col-name=table2.col-name;              *;
*    QUIT;                                                *;
***********************************************************;

/* proc sql; */
/* select class_update.Name, Grade, Age, Teacher  */
/*     from pg1.class_update inner join pg1.class_teachers */
/*     on class_update.Name=class_teachers.Name; */
/* quit;   */

***********************************************************;
*  Demo                                                   *;
*    1) Open PG1.STORM_SUMMARY and PG1.STORM_BASINCODES   *;
*       and compare the columns. Identify the matching    *;
*       column.                                           *;
*    2) Add PG1.STORM_BASINCODES to the FROM clause to    *;
*       perform an inner join on Basin. Remember to       *;
*       qualify the columns as table-name.col-name in the *;
*       ON expression.                                    *;
*    3) Add the BasinName column to the query after       *;
*       Basin. Highlight the step, run the selected code, *;
*       and examine the log. Why does the program fail?   *;
*    4) Modify the query to qualify the Basin column in   *;
*       the SELECT clause. Highlight the step and run the *;
*       selected code.                                    *;
***********************************************************;

proc sql;
select Season, Name, storm_summary.Basin, BasinName, MaxWindMPH
    from pg1.storm_summary inner join pg1.storm_basincodes
    	on storm_summary.basin=storm_basincodes.basin
    order by Season desc, Name;
    *we join the pg1.storm_basincodes table.
	the "on" clause provides criteria for how
	columns should be matched using inner join.;
	
	*note that only the uppercase basin codes are included. why?
	since there were no lowercase basin codes in the storm_basincodes lookup table
	we didn't have a matching value for the full basin name;
quit;
