*initial code taken from p106p03.sas;
*note that we omit bookmarks.;

options orientation=landscape;
ods pdf file="&outpath/StormSummary.pdf" style=journal nobookmarkgen;

title1 "2016 Northern Atlantic Storms";

ods layout gridded columns=2 rows=1;
ods region;

proc sgmap plotdata=pg1.storm_final;
    *openstreetmap;
    esrimap url='http://services.arcgisonline.com/arcgis/rest/services/World_Physical_Map';
    bubble x=lon y=lat size=maxwindmph / datalabel=name datalabelattrs=(color=red size=8);
    where Basin='NA' and Season=2016;
    keylegend 'wind';
run;

ods region;
proc print data=pg1.storm_final noobs;
	var name StartDate MaxWindMPH StormLength;
	where Basin="NA" and Season=2016;
	format StartDate monyy7.;
run;

ods layout end;
ods pdf close;
options orientation = portrait;
