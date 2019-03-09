*a modification of lesson4level2prac3.sas using SELECT-WHEN;

data parks monuments;
	set pg1.np_summary;
	where Type in ('NP' 'NM');
	Campers = sum(OtherCamping, TentCampers, RVCampers, BackcountryCampers);
	format Campers comma10.;
/* 	select (Type); */
/* 		when('NP') do; */
/* 			ParkType = 'Park'; */
/* 			output parks; */
/* 		end; */
/* 		when('NM') do; */
/* 			ParkType = 'Monument'; */
/* 			output monuments; */
/* 		end; */
/* 	end; */
	select (Type);
		when('NP') do;
			ParkType = 'Park';
			output parks;
				end;
				otherwise do;
					ParkType = 'Monument';
					output monuments;
				end;
	end;
	keep Reg ParkName DayVisits OtherLodging Campers ParkType;
run;

*note that parks has 51 rows and monuments has 63 rows;
