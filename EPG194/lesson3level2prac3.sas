*in this code, we are sorting np_largeparks.
basically, removing the duplicates (first via sorting by all, then using noduprecs).
we output the table with duplicates removed to temp table park_clean, and output a
table of duplicates in temp table park_dups.
there are 30 rows in park_dups table;

proc sort data=pg1.np_largeparks out=park_clean noduprecs dupout=park_dups;
	by _all_;
run;
