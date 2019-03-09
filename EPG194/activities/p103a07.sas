***********************************************************;
*  Activity 3.07                                          *;
*    1) Modify the OUT= option in the PROC SORT statement *;
*       to create a temporary table named STORM_SORT.     *;
*    2) Complete the WHERE and BY statements to answer    *;
*       the following question: Which storm in the North  *;
*       Atlantic basin (NA or na) had the strongest       *;
*       MaxWindMPH?                                       *;
***********************************************************;

*this code will sort the data in storm_summary (in an output table),
with a focus on north atlantic basins, where we're sorting by max wind MPH
in descending order.
hence, we find that hurricane Allen had the strongest MaxWindMPH;
proc sort data=pg1.storm_summary out=storm_sort;
	where Basin in ("NA" "na");
	by descending MaxWindMPH;
run;
