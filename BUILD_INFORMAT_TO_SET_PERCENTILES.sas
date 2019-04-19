%MACRO DOIT(VAR,REVERSE);
PROC SQL NOPRINT;
	DELETE FROM _ALL_OF_IT WHERE FMTNAME="&VAR._";
QUIT;
DATA _&VAR.(KEEP=FMTNAME NUM MEAN MEDIAN PERC15 PERC25 PERC30 PERC40 PERC50 PERC60 
				PERC70 PERC75 PERC85 REVERSE);
	SET BENCH_CMB_201809(WHERE=(MEASURE="&VAR."));
	LENGTH FMTNAME $10.;
	REVERSE = &REVERSE.;
	FMTNAME="&VAR._";
	NUM = pract_cnt;
	MEAN = ntwrk_rate;
	MEDIAN = median;
%IF &REVERSE. = 1 %THEN %DO;
	PERC15 = PCT15;
	PERC25 = PCT25;
	PERC30 = PCT30;
	PERC40 = PCT40;
	PERC50 = PCT50;
	PERC60 = PCT60;
	PERC70 = PCT70;
	PERC75 = PCT75;
	PERC85 = PCT85;
%END;
%ELSE %DO;
	PERC15 = PCT85;
	PERC25 = PCT75;
	PERC30 = PCT70;
	PERC40 = PCT60;
	PERC50 = PCT50;
	PERC60 = PCT40;
	PERC70 = PCT30;
	PERC75 = PCT25;
	PERC85 = PCT15;
%END;
RUN;
PROC APPEND BASE=_ALL_OF_IT DATA=_&VAR. FORCE;
RUN;
%MEND DOIT;
%DOIT(QN02_3_A,1);
%DOIT(QN02_4_A,1);
%DOIT(QN05,1);
%DOIT(QN08_A,1);
%DOIT(QN09_A,1);
%DOIT(QN10,1);
%DOIT(QN12_6,1);
%DOIT(QN13,1);
%DOIT(QN36_A,1);
%DOIT(QN39_A,1);
%DOIT(QN40_A,1);
%DOIT(QN41_A,1);
%DOIT(QN44_A,1);
%DOIT(QN45_A,0);
%DOIT(QN51,1);
%DOIT(QN54,1);
%DOIT(QN58_P,1);
%DOIT(QN61,1);
%DOIT(QN64_A,1);
%DOIT(QN69_A,1);
%DOIT(QN70_A,0);
%DOIT(QN70_S,0);
%DOIT(QN71_1_A,0);
%DOIT(QN71_1_S,0);
%DOIT(QN71_2_A,0);
%DOIT(QN71_2_S,0);
%DOIT(QN71_3_A,0);
%DOIT(QN71_3_S,0);
%DOIT(QN75,1);
%DOIT(QN76_A,1);
%DOIT(QN77_P,0);
%DOIT(QN77_A,0);
%DOIT(QN77_S,0);
%DOIT(QN78_A,0);
%DOIT(QN78_S,0);

DATA _ALL_OF_IT_(KEEP=START END LABEL TYPE FMTNAME SORTVAR);
	SET _ALL_OF_IT;
	LENGTH LABEL $10.;
IF REVERSE = 1 THEN DO;
	/*
	START = 0;
	END = ROUND(PERC10,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC0';
	SORTVAR = 1;
	OUTPUT;
	START = ROUND(PERC10,.01);
	END = ROUND(PERC15,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC10';
	SORTVAR = 2;
	OUTPUT;
	START = ROUND(PERC15,.01);
	*/
	START = 0;
	END = ROUND(PERC25,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC15';
	SORTVAR = 3;
	OUTPUT;
	START = ROUND(PERC25,.01);
	END = ROUND(PERC30,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC25';
	SORTVAR = 4;
	OUTPUT;
	START = ROUND(PERC30,.01);
	END = ROUND(PERC40,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC30';
	SORTVAR = 5;
	OUTPUT;
	START = ROUND(PERC40,.01);
	END = ROUND(PERC50,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC40';
	SORTVAR = 6;
	OUTPUT;
	START = ROUND(PERC50,.01);
	END = ROUND(PERC60,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC50';
	SORTVAR = 7;
	OUTPUT;
	START = ROUND(PERC60,.01);
	END = ROUND(PERC70,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC60';
	SORTVAR = 8;
	OUTPUT;
	START = ROUND(PERC70,.01);
	END = ROUND(PERC85,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC70';
	SORTVAR = 9;
	OUTPUT;
/*
	START = ROUND(PERC75,.01);
	END = ROUND(PERC85,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC75';
	SORTVAR = 10;
	OUTPUT;
*/
	START = ROUND(PERC85,.01);
	END = 999999999;
*	END = ROUND(PERC90,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC85';
	SORTVAR = 11;
	OUTPUT;
	/*
	START = ROUND(PERC90,.01);
	END = 999999999;
	TYPE = 'N';
	LABEL='PERC90';
	SORTVAR = 12;
	OUTPUT;
	*/
END;
ELSE DO;
/*
	START = 0;
	END = ROUND(PERC90,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC90';
	SORTVAR = 1;
	OUTPUT;
	START = ROUND(PERC90,.01);
	END = ROUND(PERC85,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC85';
	SORTVAR = 2;
	OUTPUT;
	START = ROUND(PERC85,.01);
*/
	START = 0;
	END = ROUND(PERC85,.01);
	TYPE = 'N';
	LABEL='PERC85';
	SORTVAR = 3;
	OUTPUT;
	START = ROUND(PERC85,.01)+.0001;
	END = ROUND(PERC70,.01);
	TYPE = 'N';
	LABEL='PERC70';
	SORTVAR = 4;
	OUTPUT;
	START = ROUND(PERC70,.01)+.0001;
	END = ROUND(PERC60,.01);
	TYPE = 'N';
	LABEL='PERC60';
	SORTVAR = 5;
	OUTPUT;
	START = ROUND(PERC60,.01)+.0001;
	END = ROUND(PERC50,.01);
	TYPE = 'N';
	LABEL='PERC50';
	SORTVAR = 6;
	OUTPUT;
	START = ROUND(PERC50,.01)+.0001;
	END = ROUND(PERC40,.01);
	TYPE = 'N';
	LABEL='PERC40';
	SORTVAR = 7;
	OUTPUT;
	START = ROUND(PERC40,.01)+.0001;
	END = ROUND(PERC30,.01);
	TYPE = 'N';
	LABEL='PERC30';
	SORTVAR = 8;
	OUTPUT;
	START = ROUND(PERC30,.01)+.0001;
	END = ROUND(PERC25,.01);
	TYPE = 'N';
	LABEL='PERC25';
	SORTVAR = 9;
	OUTPUT;
	START = ROUND(PERC25,.01)+.0001;
	END = 999999999;
*	END = ROUND(PERC15,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC15';
	SORTVAR = 10;
	OUTPUT;
	/*
	START = ROUND(PERC15,.01);
	END = ROUND(PERC10,.01)-.01+.0099;
	TYPE = 'N';
	LABEL='PERC10';
	SORTVAR = 11;
	OUTPUT;
	START = ROUND(PERC10,.01);
	END = 999999999;
	TYPE = 'N';
	LABEL='PERC0';
	SORTVAR = 12;
	OUTPUT;
	*/
END;
RUN;

PROC SORT DATA=_ALL_OF_IT_;
	BY FMTNAME START SORTVAR;
RUN;
DATA _ALL_OF_IT_2;
	SET _ALL_OF_IT_;
	BY FMTNAME START SORTVAR;
	IF LAST.START THEN OUTPUT;
RUN;

PROC FORMAT CNTLIN=_ALL_OF_IT_2;
RUN;

DATA AAA;
	VAR1 = .78;
	DOIT = PUT(VAR1,QN02_3_A_.);
RUN;

%macro setflag(var,INVERSE);
	&var._ROUND = ROUND(&var.,.01);
	IF den_&var. = . THEN &var._PERCENTILE = '......';
	ELSE IF den_&var. < 10 THEN &var._PERCENTILE = ' <10  ';
	ELSE 	&var._PERCENTILE = PUT(ROUND(&var.,.01),&var._.);
%mend setflag;

DATA WHAT_PERCENTILE/*(KEEP=den_QN02_3_A QN02_3_A QN02_3_A_ROUND QN02_3_A_PERCENTILE den_QN02_3_A_FLAG)*/;
	SET BEN2019.ATTR_PROV_BENCH_201809;
		%SETFLAG(QN02_3_A,1);
		%SETFLAG(QN02_4_A,1);
		%SETFLAG(QN05,1);
		%SETFLAG(QN08_A,1);
		%SETFLAG(QN09_A,1);
		%SETFLAG(QN10,1);
		%SETFLAG(QN12_6,1);
		%SETFLAG(QN13,1);
		%SETFLAG(QN36_A,1);
		%SETFLAG(QN39_A,1);
		%SETFLAG(QN40_A,1);
		%SETFLAG(QN41_A,1);
		%SETFLAG(QN44_A,1);
		%SETFLAG(QN45_A,0);
		%SETFLAG(QN51,1);
		%SETFLAG(QN54,1);
		%SETFLAG(QN58_P,1);
		%SETFLAG(QN61,1);
		%SETFLAG(QN64_A,1);
		%SETFLAG(QN69_A,1);
		%SETFLAG(QN70_A,0);
		%SETFLAG(QN70_S,0);
		%SETFLAG(QN71_1_A,0);
		%SETFLAG(QN71_1_S,0);
		%SETFLAG(QN71_2_A,0);
		%SETFLAG(QN71_2_S,0);
		%SETFLAG(QN71_3_A,0);
		%SETFLAG(QN71_3_S,0);
		%SETFLAG(QN75,1);
		%SETFLAG(QN76_A,1);
		%SETFLAG(QN77_P,0);
		%SETFLAG(QN77_A,0);
		%SETFLAG(QN77_S,0);
		%SETFLAG(QN78_A,0);
		%SETFLAG(QN78_S,0);
/*
	IF den_QN02_3_A = . THEN den_QN02_3_A_FLAG = '...';
	ELSE IF den_QN02_3_A < 10 THEN den_QN02_3_A_FLAG = '<10';
	ELSE den_QN02_3_A_FLAG = '10>';
	QN02_3_A_ROUND = ROUND(QN02_3_A,.01);
	QN02_3_A_PERCENTILE = PUT(ROUND(QN02_3_A,.01),$QN02_3_A_.);
*/
RUN;

PROC SQL;
	CREATE TABLE WHAT_PERCENTILE2 AS
	SELECT CASE WHEN A.ENTITY_ID IS NOT NULL THEN 'TP' ELSE ' ' END AS TP_FLAG,
			B.*
		FROM (SELECT DISTINCT ENTITY_ID FROM practice_map2) A
			RIGHT OUTER JOIN WHAT_PERCENTILE B ON A.ENTITY_ID = B.entity_ru
		ORDER BY B.ENTITY_RU;
QUIT;

%macro percentage_in_each_percentile(var,INVERSE);
PROC SQL NOPRINT;
	DELETE FROM _SUM_OF_IT WHERE MEASURE="&VAR.";
QUIT;
PROC SQL;
	CREATE TABLE SUM1_&VAR. AS
	SELECT  "&VAR." AS MEASURE,
			&VAR._PERCENTILE AS THE_PERCENTILE,
			TYPE_VALUE,
			ENT_CNT,
			round((ENT_CNT/TOTAL_ENT_CNT),.01) AS PERCENT_MEETING
	FROM (
	SELECT &VAR._PERCENTILE,
			'ALL' AS TYPE_VALUE,
			TOTAL_ENT_CNT,
			COUNT(DISTINCT entity_ru) AS ENT_CNT
		FROM WHAT_PERCENTILE2 A,
			 (SELECT COUNT(DISTINCT ENTITY_RU) AS TOTAL_ENT_CNT
				FROM WHAT_PERCENTILE2
			  WHERE TP_FLAG = 'TP') SUB
	WHERE TP_FLAG = 'TP'
	GROUP BY 1, 'ALL', 3
	UNION ALL
	SELECT &VAR._PERCENTILE,
			'>10' AS TYPE_VALUE,
			TOTAL_ENT_CNT,
			COUNT(DISTINCT entity_ru) AS ENT_CNT
		FROM WHAT_PERCENTILE2,
			 (SELECT COUNT(DISTINCT ENTITY_RU) AS TOTAL_ENT_CNT
				FROM WHAT_PERCENTILE2
			  WHERE TP_FLAG = 'TP' AND &VAR._PERCENTILE NOT IN(' <10')) SUB
	WHERE TP_FLAG = 'TP' AND &VAR._PERCENTILE NOT IN(' <10')
	GROUP BY 1, '>10', 3) SUB2;
QUIT;
PROC APPEND BASE=_SUM_OF_IT DATA=SUM1_&VAR. FORCE;
RUN;
%mend percentage_in_each_percentile;
%percentage_in_each_percentile(QN02_3_A,1);
%percentage_in_each_percentile(QN02_4_A,1);
%percentage_in_each_percentile(QN05,1);
%percentage_in_each_percentile(QN08_A,1);
%percentage_in_each_percentile(QN09_A,1);
%percentage_in_each_percentile(QN10,1);
%percentage_in_each_percentile(QN12_6,1);
%percentage_in_each_percentile(QN13,1);
%percentage_in_each_percentile(QN36_A,1);
%percentage_in_each_percentile(QN39_A,1);
%percentage_in_each_percentile(QN40_A,1);
%percentage_in_each_percentile(QN41_A,1);
%percentage_in_each_percentile(QN44_A,1);
%percentage_in_each_percentile(QN45_A,0);
%percentage_in_each_percentile(QN51,1);
%percentage_in_each_percentile(QN54,1);
%percentage_in_each_percentile(QN58_P,1);
%percentage_in_each_percentile(QN61,1);
%percentage_in_each_percentile(QN64_A,1);
%percentage_in_each_percentile(QN69_A,1);
%percentage_in_each_percentile(QN70_A,0);
%percentage_in_each_percentile(QN70_S,0);
%percentage_in_each_percentile(QN71_1_A,0);
%percentage_in_each_percentile(QN71_1_S,0);
%percentage_in_each_percentile(QN71_2_A,0);
%percentage_in_each_percentile(QN71_2_S,0);
%percentage_in_each_percentile(QN71_3_A,0);
%percentage_in_each_percentile(QN71_3_S,0);
%percentage_in_each_percentile(QN75,1);
%percentage_in_each_percentile(QN76_A,1);
%percentage_in_each_percentile(QN77_P,0);
%percentage_in_each_percentile(QN77_A,0);
%percentage_in_each_percentile(QN77_S,0);
%percentage_in_each_percentile(QN78_A,0);
%percentage_in_each_percentile(QN78_S,0);

data _sum_of_it;
   set _sum_of_it;
   array change _numeric_;
        do over change;
            if change=. then change=0;
        end;
run ;

proc sort data=_sum_of_it;
	by measure TYPE_VALUE;
run;
proc transpose data=_sum_of_it out=_sum_of_it_1;
*	where TYPE_VALUE='>10';
	by measure TYPE_VALUE;
	id the_percentile;
	idlabel the_percentile;
	var ent_cnt percent_meeting;
run;
