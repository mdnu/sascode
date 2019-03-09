data parks monuments;
	set pg1.np_summary;
	where Type in ('NP' 'NM');
	Campers = sum(OtherCamping, TentCampers, RVCampers, BackcountryCampers);
	format Campers comma10.;
	length ParkType $ 8;
	if Type = 'NP' then do;
		ParkType = 'Park';
		output parks;
	end;
	else if Type = 'NM' then do;
		ParkType = 'Monument';
		output monuments;
	end;
	keep Reg ParkName DayVisits OtherLodging Campers ParkType;
run;

*note that parks has 51 rows and monuments has 63 rows;
