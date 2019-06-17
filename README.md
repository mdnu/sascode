# sascode
miscellaneous sas code

the data step
```
def new1 new2;
	set old;
	where column in ('A' 'B');
	format newvar comma10.;
	newvar = sum(var1,var2,var3);
  
	select(column);
		when ('A') do;
			newvar2 = 'valueA';
			output new1;
		end;
		otherwise do;
			newvar2 = 'valueB'
			output new2;
		end;
	end;
	keep var1 var2 var3;
run;
```

the contents procedure
```
proc contents data=new;
run;
```

the freq procedure
```
proc freq data=work.new order=freq;
	tables var1;
  	tables var1*var2;
  	tables var3*var4 / crosslist plots=freqplot(twoway=stacked orient=horizontal);
  	where var3 in ('A', 'B', 'C');
run;
```

the means procedure
```
proc means data=work.new noprint;
	var var1;
	class col1 col2;
	ways 2;
	output out=new2(drop=_freq_ _type_)
		sum=totalvar1
		idgroup(max(var1) out[3](var1 varlabel)=);
run;
```

the sort procedure
```
proc sort data=work.new(keep=var1 var2) out=work.new2 nodupkey;
	by var1 var2;
run;
```

the univariate procedure
```
proc univariate data=work.new nextrobs=10;
	var variable;
run;
```

the sgplot procedure
```
title1 'plot title';
proc sgplot data=work.new;
	where var3 in ('A', 'B', 'C');
	hbar var4 / group=type;
	keylegend / opaque across=1 position=bottomright location=inside;
	xaxis grid;
run;
title;

title2 'plot title';
proc sgplot data=work.new;
	where var3 in ('A', 'B', 'C');
	hbar var4 / group=type
                fillattrs=(transparency=0.5) dataskin=crisp;
	keylegend / opaque across=1 position=bottomright location=inside;
	xaxis grid;
run;
title;
```

the print procedure
```
proc print data=work.new;
	var var1 var2 var2;
	where [arguments];
run;
```

the sql procedure
```
proc sql;
select var1, var2, sheet.varA, var3, var4
	from work.sheet inner join work.sheet_info
    		on sheet.varA=sheet_info.varA
	order by varB desc, varC;
quit;
```

the sgmap procedure
```
proc sgmap plotdata=work.newmap;
	*openstreetmap;
	esrimap url='http://services.arcgisonline.com/arcgis/rest/services/World_Physical_Map';
	bubble x=lon y=lat size=maxwindmph / datalabel=name datalabelattrs=(color=red size=8);
	where var1='A' and var2=999;
	keylegend 'legend';
run;
```
