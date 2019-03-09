***********************************************************;
*  Activity 5.02                                          *;
*       Notice that there are no TITLE statements in the  *;
*       code. Run the program. Does the report have       *;
*       titles?                                           *;
***********************************************************;

proc means data=sashelp.heart;
	var height weight;
run;

*note that there are no titles that appear in this report.
this happens in SAS studio since titles are cleared before new
programs are submitted. titles will appear, however, for SAS enterprise
guide since titles are not cleared there.;
