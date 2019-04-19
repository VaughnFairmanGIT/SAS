/*DEEP_TEXT_SEARCH_ON_UNIX.SAS*/
x "cd /c01/sasdata/analytics/infm/divisional/aa/aaprod";
x "echo";
*filename ps_list pipe "grep -r 'LIBNAME AAAttr'";
filename ps_list pipe "grep -r 'AAShare.AAEXTRACTICIS'";
data sasjobs;
   infile ps_list;
   length process $ 180.;
   input process $ char180.;
run;
