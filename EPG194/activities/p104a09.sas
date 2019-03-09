***********************************************************;
*  Activity 4.09                                          *;
*    Run the program. Why does the program fail?          *;
***********************************************************;

data girls boys;
    set sashelp.class;
    if sex="F" then do;
		 Gender="Female";
	     output girls;
	end;
    else do;
		 Gender="Male";
		 output boys;
	end;
run;

*the program fails because the if-then-do loops aren't closed by an end statement.
we fix this above.;
