***********************************************************;
*  Activity 5.06                                          *;
*    1) Add options to include N (count), MEAN, and MIN   *;
*       statistics. Round each statistic to the nearest   *;
*       integer.                                          *;
*    2) Add a CLASS statement to group the data by Season *;
*       and Ocean. Run the program.                       *;
*    3) Modify the program to add the WAYS statement so   *;
*       that separate reports are created for Season and  *;
*       Ocean statistics. Run the program.                *;
*       Which ocean had the lowest mean for minimum       *;
*       pressure?                                         *;
*       Which season had the lowest mean for minimum      *;
*       pressure?                                         *;
***********************************************************;

*we specify in the proc means declaration to include the following:
N, MEAN, and MIN. we round these to the nearest integer.
we also add a class statement to group data by Season and Ocean.;

proc means data=pg1.storm_final N MEAN MIN maxdec=0;
	var MinPressure;
	where Season >=2010;
	class Season Ocean;
	
	*add a ways statement so we create separate reports for both
	Season and Ocean;
	ways 1;
run;

*note that the pacific ocean had the lowest mean for min pressure for oceans,
and 2015 had the lowest mean for min pressure for seasons.;
