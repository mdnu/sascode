/**********************************************/
/* DO NOT EDIT THE CODE BELOW                 */
/**********************************************/

libname PG1 "&path";

%include "&path/_1create_class.sas";
%include "&path/_2create_natpark.sas";
%include "&path/_3create_storm.sas";

proc contents data=pg1._all_ nods;
run;