*libname statement to create a library named NP
which reads np_info.xlsx in course data.
to view the imported excel data, go to your libraries folder
and you should see the NP library with three imported tables.;

options validvarname=v7;

libname NP xlsx "/home/marknunez0/EPG194/data/np_info.xlsx";

*below is a proc step to read the "Parks" table in the NP library.
this sas program will essentially replace the whitespace in the "Parks"
table column names with underscores, following SAS naming convention;
proc contents data=NP.PARKS;
run;

*we clear the NP library below;
libname NP clear;
