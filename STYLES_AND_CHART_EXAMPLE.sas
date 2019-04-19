.header /*Header for Tables*/
{
  background-color: #FFFFFF;
  border-width: 1px;
  border-color: #FFFFFF;
  border-style: solid;
  color: #00a4e4;
  text-align: left;
  vertical-align: middle;
  font-family: Helvetica;
  font-size: 11pt;
  font-style: normal;
  font-weight: bold;
}

.body
{
  background-color: #FFFFFF;
  color: #000000;
  font-family: Helvetica;
  font-size: 11pt;
  font-style: normal;
  font-weight: normal;
  margin-left: 8px;
  margin-right: 8px;
}
.data
{
  background-color: #F6F7F8;
  border-color: #000000;
  border-style: solid;
  color: #333333;
  text-align: left;
  font-family: Helvetica;
  font-size: 11pt;
  font-style: normal;
  font-weight: normal;
  margin-left: 1pt;
  margin-right: 1pt;
  margin-top: 1pt;
  margin-bottom: 1pt;
  text-wrap: no;
  vertical-align: middle;
}
.NoteContent
{
  color: #333333;
  text-align: left;
  background-color: #FFFFFF;
  font-family: Helvetica;
  font-size: 9pt;
  font-style: normal;
  font-weight: normal;
  vertical-align: middle;
}


.systemtitle
{
  background-color: #FFFFFF;
  color: #000000;
  font-family: Helvetica;
  font-size: 14pt;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  vertical-align: middle;
}
.systemtitle2
{
  background-color: #FFFFFF;
  color: #0769CD;
  font-family: Helvetica;
  font-size: 12pt;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  text-transform: uppercase;
  vertical-align: middle;
}
.systemtitle3
{
  background-color: #FFFFFF;
  color: #0769CD;
  font-family: Helvetica;
  font-size: 12pt;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  text-transform: uppercase;
  vertical-align: middle;
}
.systemtitle4
{
  background-color: #FFFFFF;
  color: #0769CD;
  font-family: Helvetica;
  font-size: 12pt;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  text-transform: uppercase;
  vertical-align: middle;
}
.systemtitle5
{
  background-color: #FFFFFF;
  color: #0769CD;
  font-family: Helvetica;
  font-size: 12pt;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  text-transform: uppercase;
  vertical-align: middle;
}
.systemtitle6
{
  background-color: #FFFFFF;
  color: #0769CD;
  font-family: Helvetica;
  font-size: 12pt;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  text-transform: uppercase;
  vertical-align: middle;
}
.systemtitle7
{
  background-color: #FFFFFF;
  color: #0769CD;
  font-family: Helvetica;
  font-size: 12pt;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  text-transform: uppercase;
  vertical-align: middle;
}
.systemtitle8
{
  background-color: #FFFFFF;
  color: #0769CD;
  font-family: Helvetica;
  font-size: 12pt;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  text-transform: uppercase;
  vertical-align: middle;
}
.systemtitle9
{
  background-color: #FFFFFF;
  color: #0769CD;
  font-family: Helvetica;
  font-size: 12pt;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  text-transform: uppercase;
  vertical-align: middle;
}
.systemtitle10
{
  background-color: #FFFFFF;
  color: #0769CD;
  font-family: Helvetica;
  font-size: 12pt;
  font-style: normal;
  font-weight: bold;
  text-align: left;
  text-transform: uppercase;
  vertical-align: middle;
}


proc template;
	define style <<NAME>>;
		import '<<PATH>>/<<NAME>>.css';
		class GraphData1 / color=cxe1eff6;
		class GraphData2 / color=cxf2f5f7;
		class GraphData3 / color=cx0f88c1;
		class GraphData4 / color=cx00a2e2;
		class GraphData5 / color=cxef9528;
		class GraphData6 / color=cx8dc53e;
		class GraphData7 / color=cxe21b22;
		class GraphData8 / color=cxa74099;
		class GraphData9 / color=cx009bdf;
		class GraphData10 / color=cx00599d;
		class GraphOther / color=cxE67125;
		class Graph / outputheight=6in outputwidth=7.5in bordercolor=white;
		class GraphAxisLines / linethickness=1px contrastcolor=cx333333;

	end;
run;

proc format;
	value $bg
		"0" = "Not Specified"
		"1" = "Brand - Single Source"
		"3" = "Generic"
		"5" = "Brand - Multi Source";
run;

/*GRAPHS AND CHARTS*/
proc template;
	*Pie Chart on Worksheet 1;
	define statgraph simplepie;
	    begingraph / border=false backgroundcolor=white;
		entrytitle "TOP THERAPEUTIC CLASSES BY COST" / textattrs=(color=cx0769CD weight=bold);
      	layout region;
      		piechart category=tc_short response=qtr_tot_cost / datalabellocation=callout 
				othersliceopts=(label="Other Classes") othersliceopts=(type=percent percent=6);

		endlayout;
		Drawtext textattrs=(color=gray size=52pt) "CONFIDENTIAL" /
      	transparency=.75 rotate=-35
      	width=110 widthunit=percent justify=center ;	
    endgraph;
	end;
	*TClass by Brand Prescribing Volume (Worksheet 1);
	define statgraph tclass;
	    begingraph / border=false backgroundcolor=white;
      	layout overlay / yaxisopts=(griddisplay=off) y2axisopts=(griddisplay=off) border=false;
        	barchart category=tc_short response=mmn_mr_proc_ct / 
				barwidth=.6 
				display=(fill fillpattern)
				fillattrs=(color=cx00a2e2)
				fillpatternattrs=(pattern=l3 color=cx00719e)
				outlineattrs=(color=cx00a2e2)
				barlabel=false name='bar1';
			barchart category=tc_short response=eacl_prv_alcrg_at / 
				barwidth=.3 
				yaxis=y2
				fillattrs=(color=cxEF9528)
				outlineattrs=(color=cxEF9528) name='bar2';
			/*barchart category=tc_short response=mmn_mr_proc_ct / 
				barwidth=.6 
				fillattrs=(color=cx00a2e2 transparency=1) 
				outlineattrs=(color=cx00a2e2 thickness=0px)
				barlabelattrs=(color=cx333333)
				barlabel=true;*/
			discretelegend 'bar1' 'bar2';
		endlayout;
		drawtext textattrs=(color=gray size=52pt) "CONFIDENTIAL" /
      	transparency=.75 rotate=-35
      	width=110 widthunit=percent justify=center ;
    endgraph;
	end;
	*Therapeutic Class CPD/Estd Days Supplied Barchart on Therapeutic Class Worksheets;
	define statgraph barchartcost;
	    begingraph / border=true backgroundcolor=white;
		entrytitle "&entrytitle.";
      	layout overlay / yaxisopts=(griddisplay=on label=" " shortlabel=" " labelattrs=(SIZE=.1)) 
						 xaxisopts=(griddisplay=on label=" " shortlabel=" " labelattrs=(SIZE=.1)) border=false;
        	barchart category=Drug_Name response=Total_Cost /
				barwidth=.3
				display=(fill fillpattern)
				fillattrs=(color=cx00a2e2)
				fillpatternattrs=(pattern=l1 color=cx00719e)
				outlineattrs=(color=cx00a2e2)
				barlabel=false name='bar1'
				orient=horizontal;
			/*
			barchart category=graph_name response=eacldr_estd_days_spld_ct / 
				barwidth=.3 
				yaxis=y2
				fillattrs=(color=cxEF9528)
				outlineattrs=(color=cxEF9528) name='bar2';
			*/
			/*barchart category=graph_name response=cost_per_day / 
				barwidth=.6 
				fillattrs=(color=cx00a2e2 transparency=1) 
				outlineattrs=(color=cx00a2e2 thickness=0px)
				barlabelattrs=(color=cx333333)
				barlabel=true;*/
			discretelegend 'bar1' /* 'bar2' */;
		endlayout;
/*		drawtext textattrs=(color=gray size=52pt) "CONFIDENTIAL" / 
      	transparency=.75 rotate=-35
      	width=110 widthunit=percent justify=center ;  */
    endgraph;
	end;
	define statgraph barchartutil;
	    begingraph / border=true backgroundcolor=white;
		entrytitle "&entrytitle.";

      	layout overlay / yaxisopts=(griddisplay=on label=" " shortlabel=" " labelattrs=(SIZE=.1)) 
						 xaxisopts=(griddisplay=on label=" " shortlabel=" " labelattrs=(SIZE=.1)) border=false;
        	barchart category=Drug_Name response=Utilization /
				barwidth=.3 
				display=(fill fillpattern)
				fillattrs=(color=cxff8000)
				fillpatternattrs=(pattern=l1 color=cx00719e)
				outlineattrs=(color=cxff8000)
				barlabel=false name='bar1'
				orient=horizontal;
			/*
			barchart category=graph_name response=eacldr_estd_days_spld_ct / 
				barwidth=.3 
				yaxis=y2
				fillattrs=(color=cxEF9528)
				outlineattrs=(color=cxEF9528) name='bar2';
			*/
			/*barchart category=graph_name response=cost_per_day / 
				barwidth=.6 
				fillattrs=(color=cx00a2e2 transparency=1) 
				outlineattrs=(color=cx00a2e2 thickness=0px)
				barlabelattrs=(color=cx333333)
				barlabel=true;*/
			discretelegend 'bar1' /* 'bar2' */;
		endlayout;
/*		drawtext textattrs=(color=gray size=52pt) "CONFIDENTIAL" / 
      	transparency=.75 rotate=-35
      	width=110 widthunit=percent justify=center ;  */
    endgraph;
	end;
run;


ods _all_ close;

ods html path="<<PATH>>"
		 gpath="<<GPATH>>"
		 body="barGraph300.html";
run;

ODS PATH work.templat(update) sasuser.templat(read)
               sashelp.tmplmst(read);

ods graphics on / reset=all imagefmt=jpeg  HEIGHT=250 WIDTH=325
	IMAGENAME="<<NAME>>_BM_BY_COST";
%let entrytitle = Brand Multi Source Drugs by Cost;
%include "<<PATH>>/<<NAME>>.sas";
proc sgrender data=Brand_Multi_cost (obs=10) template=barchartcost;
run;
