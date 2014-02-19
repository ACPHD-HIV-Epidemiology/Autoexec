%macro temp;
	%do year=2010 %to &latest_DUA_yr.;
		%do qtr=1 %to &latest_DUA_qtr.;
			%if &year.=2010 %then %let qtr=4; /*the Q4_2010 is the ealiest DUA that we have; the first DUA (ever) was the Q3_2010*/

			%global Q&qtr._&year._path;
			%let Q&qtr._&year._path=&DUA_path.\&year.\Q&qtr.;
			libname Q&qtr._&year. "&&Q&qtr._&year._path.";

		%end;
	%end;
%mend; %temp; run;

/*Misc libraries*/
libname DUA_root "&DUA_path.";
libname archives "&DUA_path.\Archived datasets"; /*where historical versions of analytic datasets are kept*/
libname frmtlib "&HIV_AIDS_Analysis_path.\Documentation";
libname lablib "\\acphd.ph.local\ph\AppProd\DCDCP - HIV with NAME\App\Richard";
libname denoms "&hiv_aids_analysis_path.\Data\Denominators";
libname LEO "&hiv_aids_analysis_path.\Data\LEO";
run;