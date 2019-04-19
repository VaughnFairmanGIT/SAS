%macro reports(msr_yr, month, rundet, runsum);

/*Clean leading zero from month*/
data _null_;
	month = &month.;
	call symput('month2', month);
run;

%if &rundet. = 1 %then %do;
filename cqmdet pipe "cd &pgmdir.; cd ../reports/; chmod 0775 cqm_detail.py; ./cqm_detail.py &msr_yr. &month2.";

data _null_;
	file cqmdet;
run;
%end;

%if &runsum. = 1 %then %do;
filename cqmsum pipe "cd &pgmdir.; cd ../reports; chmod 0775 cqm_monthly_summary.py; ./cqm_monthly_summary.py &msr_yr. &month2.";

data _null_;
	file cqmsum;
run;
%end;

%mend reports;
