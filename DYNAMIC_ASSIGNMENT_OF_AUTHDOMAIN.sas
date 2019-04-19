/* DYNAMIC_ASSIGNMENT_OF_AUTHDOMAIN.sas */
%put &sysuserid.;
%macro setenv;
%global access_auth;
%if %substr(&sysuserid.,1,3) = app %then %do;
	%let access_auth = DefaultAuth;
%end;
%else %do;
	%let access_auth = LDAP_Auth;
%end;
%mend setenv;
%setenv;

%put _all_;
