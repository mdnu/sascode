*below code will list unique values and frequencies for selected variables
Reg and Type. note that there are no lowercase codes.
there are codes that occur only once in the table: NC, NPRE and RIVERWAYS;
*note that there are no invalid values for Reg;
*however, there are three invalid values for Type: NPRE, PRESERVE, and RIVERWAYS;
proc freq data=pg1.np_summary;
	tables Reg Type;
run;

*below code will use univariate summary statistics to examine extreme values
for the 'Acres' column in pg1.np_summary;
proc univariate data=pg1.np_summary;
	var Acres;
run;

*we view the contents of the pg1.np_summary table with the code below
smallest park: "african burial ground national monument"
0.35 acres, 78 visits
largest park: "notak national preserve"
6587071 acres, 6 visits;
proc contents data=pg1.np_summary;
run;