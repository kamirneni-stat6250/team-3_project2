*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding graduation numbers and rates for various California High
Schools
Dataset Name: Graduates_analytic_file created in external file
STAT6250-01_w18-team-3_project2_data_preparation.sas, which is assumed to be
in the same directory as this file
See included file for dataset properties
;

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file that generates analytic dataset cde_2014_analytic_file;
%include '.\STAT6250-01_w18-team-3_project2_data_preparation.sas'



*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the top five California High Schools that experienced the biggest increase in total number of graduates between 2013-2014 and 2014-2015?'
;

title2
'Rationale: This would be interesting to find out to see if more students are graduating from high school as years go by.'
;

footnote1
'The top five California High Schools are: California School for the Blind, Alameda High, Argonaut High, Forest Charter, and Vantage Point Charter.'
;

footnote2
'This shows that these schools really improved their graduation rates and they would be good schools to study for other schools wishing to increase their graduation rates.'
;

Note: This compares the column "Total" from Grads1314to the column of the same 
name from Grads1415.

*
Methodology: When combining the files Grads1314 and Grads1415 in data
preparation, take the difference of values of the column Total for each school
and create a new variable called Total_Graduates_Rate_Change. After, use proc
sort to create a temporary sorted table in descending order by
Total_Graduates_Rate_Change and then proc print to display the first ten rows
of the sorted dataset.
Limitations: We don't really know if schools kept the same amount of students 
per year. It's possible that a school could have increased the number of
students it instructs which could increase the amount of graduates even if
it's at a lower rate.
Followup Steps: Possibly check if the total number of graduates increased for
the bottom ten schools in terms of total graduates.
;

proc print 
        data=Graduates_analytic_file_sorted(obs=10)
    ;
    id 
        CDS_CODE
    ;
    var 
        Total_Graduates_Rate_Change
    ;
run; 
title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the top five schools with the highest graduation rate?'
;

title2
'Rationale: These schools would be interesting to research to see why they have the highest graduation rate, and maybe try out some of their teaching techniques on other schools that don’t have as high of a graduation rate.'
;

footnote1
'The top five schools are: Magnolia High, Sycamore Junior High, Woodbury High, Edison High, and Grizzly Hill.'
;

footnote2
'These five schools are the best at making sure their students graduate. They should be researched to see if they use any interesting stratagies for this.'
;

*
Methodology: Use PROC PRINT to print out the first twenty observations
for the GRADRATE column in the temporary dataset created in the data prep file. 
Then compare the graduation rates.
Limitations: This doesn't take into account total number of students. It's
possible a school could have a low total number of students so it would 
have an better chance of having a higher graduation rate.
Followup Steps: Check the bottom ten schools with the lowest gradution rates.
;

proc print 
        data=Graduates_analytic_file(obs=20)
    ;
    id 
        CDS_CODE
    ;
    var 
        SCHOOL GRADRATE
    ;
run;
title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: Which grade has the highest number of dropouts?'
;

title2
'Rationale: This is important to know since then we would know which grade to target the most with counseling or help from teachers.'
;

footnote1
'The grade with the highest number of dropouts was grade 9.'
;

footnote2
'This shows that we need to start early with counseling and making sure students are focused from an early age.'
;

*
Methodology: Use proc means to find the sum for the columns D9, D10, D11, and 
D12 in the Graduates_analytic_file file created in data.
preparation. Then see which one has the highest number.
Limitations: None
Followup Steps: See which high schools have the highest number of dropouts,
which would demonstrate that these schools maybe need to improve their
teaching/counseling services or something.
;

proc means 
        data=Graduates_analytic_file
        sum
    ;
    id
        CDS_CODE
    ;
    var
        D9 D10 D11 D12
    ;
run;
title;
footnote;
