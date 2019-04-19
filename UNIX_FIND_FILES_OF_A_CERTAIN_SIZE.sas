/*UNIX_FIND_FILES_OF_A_CERTAIN_SIZE.sas*/
%let outfile=aco_over_1_gig;

x "cd /n04/data/aco; find . -type f -size +1G -fls /n04/data/p4vrept/&outfile..txt"

filename in1 "/n04/data/p4vrept/&outfile..txt";
run;

data acoin;
   infile in1 truncover;
   input @1 alldata $254.;

   length  lid group filesize path_filename permissions date field1-field11  alldata2-alldata9 $254.;
   field1 = substr(alldata,1,index(alldata,' '));
   alldata2 = trim(left(substr(alldata,index(alldata,' '))));
   field2 = substr(alldata2,1,index(alldata2,' '));
   alldata3 = trim(left(substr(alldata2,index(alldata2,' '))));
   permissions = substr(alldata3,1,index(alldata3,' '));
   alldata4 = trim(left(substr(alldata3,index(alldata3,' '))));
   field4 = substr(alldata4,1,index(alldata4,' '));
   alldata5 = trim(left(substr(alldata4,index(alldata4,' '))));
   lid = substr(alldata5,1,index(alldata5,' '));
   alldata6 = trim(left(substr(alldata5,index(alldata5,' '))));
   group = substr(alldata6,1,index(alldata6,' '));
   alldata7 = trim(left(substr(alldata6,index(alldata6,' '))));
   filesize = substr(alldata7,1,index(alldata7,' '));
   alldata8 = trim(left(substr(alldata7,index(alldata7,' '))));
   field8 = substr(alldata8,1,index(alldata8,' '));
   alldata9 = trim(left(substr(alldata8,index(alldata8,' '))));
   field9 = substr(alldata9,1,index(alldata9,' '));
   alldata10 = trim(left(substr(alldata9,index(alldata9,' '))));
   field10 = substr(alldata10,1,index(alldata10,' '));
   if field10 not in('2010','2011','2012','2013','2014','2015','2016','2017','2018') then 
   		field10 = '2019';
   date = trim(left(field8))||'-'||trim(left(field9))||'-'||trim(left(field10));
   path_filename = substr(alldata10,index(alldata10,' '));
run;

proc export data=acoin
file="/n04/data/p4vrept/&&outfile..xlsx"
dbms=xlsx replace;
sheet="Sheet1";
run;
