***********************************************************;
*  Importing a Comma-Delimited (CSV) File                 *;
***********************************************************;
*  Syntax and Example                                     *;
*                                                         *;
*    PROC IMPORT DATAFILE="path/filename.csv" DBMS=CSV    *;
*  				  OUT=output-table <REPLACE>;             *;
*        <GUESSINGROWS=n|MAX>;                            *;
*    RUN;                                                 *;
***********************************************************;

proc import datafile="/home/marknunez0/EPG194/data/class_birthdate.csv" 
			dbms=csv out=work.class_birthdate_import
			replace;
run;

***********************************************************;
*  Demo                                                   *;
*  1) Complete the PROC IMPORT step to read               *;
*     STORM_DAMAGE.CSV and create a temporary SAS table   *;
*     named STORM_DAMAGE_IMPORT. Replace the table if it  *;
*     exists.                                             *;
*  2) Complete the PROC CONTENTS step to examine the      *;
*     properties of STORM_DAMAGE_IMPORT.                  *;
*  3) Highlight the demo program and submit the selected  *;
*     code.                                               *;
***********************************************************;

*Complete the PROC IMPORT step;
*the code below will import the unstructured CSV file, specifying that it
is a csv file, and creates a sas table in the work library named
"storm_damage_import".
note that the "replace" keyword is included so that if we run this program
more than once, and the storm_damage_import table already exists, it will
be replaced with the most recent one we've imported.;
proc import datafile="/home/marknunez0/EPG194/data/storm_damage.csv" dbms=csv
			out=storm_damage_import replace ;
run;

*Complete the PROC CONTENTS step;
*below will read the storm_damage_import table in the work library.;
proc contents data=storm_damage_import;
run;

*this code essentially imports unstructured data for use in SAS.
if the CSV file is ever updated, all we need to do is re-run that proc
import step above.;