--Type conversion Function


       --Implicit | explicit
	   
	   TO_NUMBER()
	   TO_CHAR()
	   TO_DATE()
	   
	   DD-Mon-YY  -> Date | Which is not in date format are Character
	   
	   
--TO_NUMBER( )

SELECT 56 + '34' FROM dual;
SELECT 56 + TO_NUMBER('34') FROM dual;

SELECT 1 + TO_NUMBER('10,344','99,999') FROM dual;

SELECT TO_NUMBER(SUBSTR('INC1406202400895',-5)) FROM dual;

--TO_DATE( )

SELECT employee_id, first_name, hire_date, salary, department_id
  FROM employees
 WHERE hire_date = TO_DATE('17-06-1987','DD-MM-YYYY');

--TO_CHAR( )

SELECT employee_id, first_name, TO_CHAR(hire_date,'DD/MM/YYYY') new_format
   FROM employees;


     DD     DDth     DDSPTH
     MM     Mon      Month
     YY     YYYY     Year
     D(1-7) Dy       Day     DDD
     --FAQ: HH:MI:SS   HH24:MI:SS a.m.    am  pm
     W  (First  7 Days -1)
     J  (Julian Format)   JSP
     DL     DS
     RM
     Q

SELECT SYSDATE
    ,TO_CHAR(SYSDATE,'DD')      "DD"
    ,TO_CHAR(SYSDATE,'DDth'     "DDth"
    ,TO_CHAR(SYSDATE,'DDspth')  "DDspth"
    ,TO_CHAR(SYSDATE,'MM')      "MM"
    ,TO_CHAR(SYSDATE,'Mon')     "Mon"
    ,TO_CHAR(SYSDATE,'Month')   "Month"
    ,TO_CHAR(SYSDATE,'YY')      "YY"
    ,TO_CHAR(SYSDATE,'YYYY')    "YYYY"
    ,TO_CHAR(SYSDATE,'Year')    "Year"
    ,TO_CHAR(SYSDATE,'DDD')     "DD"
   FROM dual;

SELECT SYSDATE
    ,TO_CHAR(SYSDATE,'HH:MI:SS,A.M.')   "12HOURS"
    ,TO_CHAR(SYSDATE,'HH24:MI:SS,PM')   "24hrs"
    ,TO_CHAR(SYSDATE,0)                 "0" 
    ,TO_CHAR(10,'RM')                   "RM"
   FROM dual;



SELECT INITCAP(TO_DATE('5793','J'),'JSP')) amount FROM dual;

SELECT  employee_id, first_name, hire_date
     INITCAP(TO_CHAR(hire_date , 'DDth Month,YYYY (Day)'))   "NEW_FORMAT"   
	 INITCAP(TO_CHAR(hire_date , 'DDth "Day of the month"')) "NEW_FORMAT" 
  FROM employees;

'21-01-89' => '21st January, 1989 (Saturday)  '

SELECT TO_CHAR(TO_DATE('21-01-89','DD-MM-RR'),'DDth Month,YYYY (day)') FROM dual;

    char TO_DATE( )
	Date TO_CHAR( )
	
--EMPLOYEES HIRED IN 1994

    LIKE
    BETWEEN..AND..
    SUBSTR( )
    INSTR( )
    TO-CHAR( )

WHERE TRIM(TO_CHAR(hire_date,'Day')) IN('saturday','Sunday');

   --Display all the employees hired in wednesday	
   --Display all the employees hired in Weekend
   --Display all the employees hired in Weekdays
   
--General Function( )/ NULL Function
          
        --Mainly  used to process NULL Value
		
	NVL( )
    NVL2( )
    NULLIF( )
    COALESCE( )

SELECT employee_id, first_name, hire_date, salary, commission_pct, NVL(commission_pct,0) "NVL"
   FROM employees;

SELECT employee-id, first_name, hire_date, salary, commission_pct
     ,NVL(TO_CHAR(commission_pct),'No Commission') "NVL"
  FROM employees;

SELECT employee_id, first_name, hire_date, salary, commission_pct, NVL2(commission_pct,1,0) "NVL"
   FROM employees;
   
SELECT employee_id, first_name, hire_date, salary, commission_pct, NVL2(commission_pct,'YES','NO') "NVL"
  FROM employees;
  
--display ann income for all employees with their commission | use NVL2( )

SELECT NULLIF(2,2),NULLIF(2,1),NULLIF(1,2), NULLIF(1,1) FROM dual;

--NULLIF(NULL,NULL) -ERROR

--WE 
   
     
		  
	 