data np_summary2;
	set pg1.np_summary;
	ParkType = scan(ParkName, -1);
	keep Reg Type ParkName ParkType;
run;

*note that the value of ParkType in row 4 is "Preserve";
