proc print data=pg1.eu_occ;
	*where Hotel is missing and ShortStay is missing and Camp is missing;
	where Hotel > 40000000;
run;

*note that 101 rows are included.
*note that when we look for hotel values larger than 40 million,
the months included in the report are either month 7 or month 8, i.e. july or august;
