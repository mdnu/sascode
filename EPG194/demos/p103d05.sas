***********************************************************;
*  Identifying and Removing Duplicate Values              *;
***********************************************************;
*  Syntax and Example                                     *;
*                                                         *;
*    Remove duplicate rows:                               *;
*    PROC SORT DATA=input-table <OUT=output-table>        *;
*        NODUPRECS <DUPOUT=output-table>;                 *;
*        BY _ALL_;                                        *;
*    RUN;                                                 *;
*                                                         *;
*    Remove duplicate key values:                         *;
*    PROC SORT DATA=input-table <OUT=output-table>        *;
*        NODUPKEY <DUPOUT=output-table>;                  *;
*        BY <DESCENDING> col-name (s);                    *;
*    RUN;                                                 *;
***********************************************************;

***********************************************************;
*  Demo                                                   *;
*    1) Modify the first PROC SORT step to sort by all    *;
*       columns and remove any duplicate rows. Write the  *;
*       removed rows to a table named STORM_DUPS.         *;
*       Highlight the step and run the selected code.     *;
*       Confirm that there are 107,821 rows in            *;
*       STORM_CLEAN and 214 rows in STORM_DUPS.           *;
*    2) Run the second PROC SORT step and confirm that    *;
*       the first row for each storm represents           *;
*       the minimum value of Pressure.                    *;
*       Note: Because storm names can be reused in        *;
*             multiple years and basins, unique storms    *;
*             are grouped by sorting by Season, Basin,    *;
*             and Name.                                   *;  
*    3) Modify the third PROC SORT step to sort the       *;
*       MIN_PRESSURE table and keep the first row for     *;
*       each storm. You do not need to keep the removed   *;
*       duplicates. Highlight the step and run the        *;
*       selected code.                                    *;
***********************************************************;

*Step 1;
*here, we are sorting the data first, then removing adjacent duplicates;
proc sort data=pg1.storm_detail out=storm_clean noduprecs dupout=storm_dups;
	by _all_;
run;

*Step 2;
*we are filtering data here: criteria is Pressure and Name aren't missing.
the sort order is important: descending Season: 2016-1980,
	sort within Season by ascending Basin, Name, and Pressure;
proc sort data=pg1.storm_detail out=min_pressure;
	where Pressure is not missing and Name is not missing;
	by descending Season Basin Name Pressure;
run;

*Step 3
here, after we've sorted in step 2, we are retrieving the minimum Pressure for
each storm (this is a measure of the storm's intensity).
i.e. we only keep the first occurence for each unique value of Season, Basin, and Name.
we do this using "nodupkey" option;
proc sort data=min_pressure nodupkey;
	by descending Season Basin Name;
run;
