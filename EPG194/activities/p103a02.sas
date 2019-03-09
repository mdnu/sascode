***********************************************************;
*  Activity 3.02                                          *;
*    1) Run the program. Examine the results and the log. *;
*       Are the two WHERE statements applied?             *;
*    2) Change the second WHERE statement to WHERE ALSO   *;
*       and rerun the code. Examine the results and the   *;
*       log. Are the two WHERE statements applied?        *;
***********************************************************;

*note that the two where statements are not applied concurrently.
the log tells us that the WHERE clause has been replaced.
changing second 'where' to 'where also' fixes this.
i.e. log says where clause has been augmented;
proc print data=pg1.storm_summary;
	where MaxWindMPH>156;
	where also MinPressure>800 and MinPressure<920;
run;
