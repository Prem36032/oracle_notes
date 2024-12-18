--FUNCTION IN ORACLE

   SINGLE ROW FUNCTION (n->n)
   MULTIPLE ROW FUNCTION (n <> 1)
   
--FAQ : DIFFERENCE BTW


--SINGLE ROW FUNCTION (n ->n)

      case function;
      
        case manipulation;
           --UPPER()       --LOWER()    --INITCAP()

       	Character Manipulation;

        *LENGTH()
        *CONCAT()
        *REVERSE()
        *SUBSTR()       INSTR()
        *LPAD()         RPAD()
        *LTRIM()        RTRIM()
        *REPLACE()      TRANSLATE()		



--NUMBER FUNCTION

    *ROUND()  *TRUNC()  *MOD()  *POWER()  
    *ABS()    *SIGN()   *CEIL() *FLOOR()

--DATE  FUNCTION

    *MONTHS_BETWEEN()
    *ADD_MONTHS()
    *NEXT_DAY()
    *LAST_DAY()


--TYPE CONVERSION

    *TO_NUMBER()
    *TO_CHAR()
    *TO_DATE()
    *TO_TIMESTAMP()

--GENERAL FUNCTION\NULL FUNCTION 
    
   *NVL()
   *NVL2()
   *NULLIF()
   *COALESCE()


--MULTIPLE ROW FUNCTION (n->1)

      ->Group function\ Aggregate FUNCTION
       
        *MIN()
        *MAX()
        *SUM()
        *AVG()
        *COUNT()

      --DECODE() function\case statement 
      --Greates() & least()

--CASE FUNCTION

      --Case Manipulation
      *UPPER()     *LOWER()    *INITCAP()


SELECT first_name,UPPER(first_name)upper_name,LOWER(first_name)lower_name,INITCAP(first_name)init_cap FROM employees;

SELECT INITCAP('Wlecome to my big data learing session')welcome_text FROM dual;

SELECT employee_id,firat_name,hire_date,salary,department_id FROM employee WHERE first_name=INITCAP('Steven');

CREATE TABLE text_case(name VARCHAR2(30));

INSERT INTO text_case VALUE('Steven');

INSERT INTO text_case VALUE('steven');

INSERT INTO text_case VALUE('STEVEN');

INSERT INTO text_case VALUE('STeVEn');

SELECT *FROM text_case;

SELECT INITCAP(name)
 FROM text_case
WHERE LOWER(name)=LOWER('Steven');


   --Try to use all functions in WHERE clause



--CHARACTER MANIPULATION FUNCTION

      *LENGTH()
      *CONCAT()
      *REVERSE()
      *SUBSTR()
      *INSTR()
      *LPAD()      *RPAD()             --add
      *LTRIM()     *RTRIM()	  *TRIM()  --remove\cut
	  *REPLACE()   *TRANSLATE()
	  
	  
SELECT first_name,
       LENGTH(first_name),
       CONCAT(first_name,salary),
       INITCAP(REVERSE(first_name))rev_name
  FROM employee;


--INITCAP(reverse(first_name))<==NESTED FUNCTIONS||TOTAL SINGLE LINE ACCEPT FUNCTIONS ARE 255

SELECT first_name,
       LENGTH(first_name),
       CONCAT(first_name,salary),
       INITCAP(REVERSE(first_name))rev_name
  FROM employee;


--SUBSTR() ->Used to get of the string

        ary ->3
		ary 1=>input
		ary 2=>Where to start |strating position
		ary 3=>How many character requested (NOT ENDING POINT)
	
SELECT first_name
    ,SUBSTR(first_name,1,3)"SUB_01"
    ,SUBSTR(first_name,2,3)"SUB_02"
    ,SUBSTR(first_name,2, )"SUB_03"
    ,SUBSTR(first_name,-3,3)"SUB_04"
  FROM employees;

--Much more are in SUBSTR()

SELECT employees_id,frist_name,hire_date,FROM employee;

\* i want to print all the first_name which contain first character as 'a'


SELECT employee_id,first_name
     ,SUBSTR(frist_name,1,1)SUB_01  
 FROM employees 
 where SUBSTR(first_name,1,1)='A';

--Task display  all the name which strats with a,e,i,o,u|SUBSTR()|IN|case
--Display all the employee who are all hired in year 94
--write a query to display second character from frist_name
--write a query to display last character from frist_name(Hint,-1,1)


SELECT SUBSTR('2000-1',2,2)"first_result"
       SUBSTR(2000-1,-2,2)"second_result"
	   
	FROM dual;


--INSTR()

    *is used to get position of the character
    * ary=4

    *ary1=>input string  
    *ary2=>search string
    *ary3=>search start from
    *ary4=>occurence of the particular character

SELECT INSTR('Murugappan annamalai','a' )"INSTR_01",
       INSTR('Murugappan annamalai','a',1,2)"INSTR_02",	
       INSTR('Murugappan annamalai','a',1,3)"INSTR_03",		   
  	FROM dual;
	
--FAQQ:Difference between SUBSTR() and INSTR()  -2points


-----------------------------------------------------------------------------------
              SUBSTR()                                    INSTR()
-----------------------------------------------------------------------------------
   ----core points
   ->It is used to get part of the string         ->INSTR() is used to get the position of
                                                       the particular character

   ->3 ary                                        ->4 ary

   result -> part of the input                    result -> position (number)
   
   
   
--LPAD|RPAD() - For adding somthing on right/left side and it alignment purpose;



SELECT frist_name
      ,salary
      ,LPAD(salary,8,0)"LPAD"
      ,RPAD(salary,8,'X')"RPAD"
FROM employees;
	  
 SELECT RPAD(employee_id,3,' ')
        ||' '||RPAD(frist_name,10,' ')
		||' '||LPAD(salary,5,'')salary details
FROM employees
   WHERE department_id IN(10,60,90);

--LTRIM|RTRIM|TRIM()|is uesd to cut something|Default will cut space on both sides like TRIM;


SELECT '00000000180900002332000'data
       ,LTRIM('00000000180900002332000','0')
	   ,RTRIM('00000000180900002332000','0')
	   ,RTRIM(LTRIM('00000000180900002332000','0'),'0')
	   ,TRIM('0' FROM '00000000180900002332000')
FROM dual;
	   

SELECT 'Murugappan   'name 
       LENGTH(TRIM('Murugappan    '))name_len
   FROM dual;


--REPALCE() AND TRANSLATE()


SELECT REPLACE('Hi<name>','How are you?','<name>','Rani')welcome_text FROM  dual;


SELECT 'welcome to oracle session' "TEXT"
       ,REPLACE('welcome to oracle session','lc','xy') "REPLACE"
       ,TRANSLATE('welcome to oracle session','lc','xy') "TRANSLATE"
FROM dual;

SELECT  REPLACE ('J123U123N123E123BAT123CH123',123,'')"batch" FROM dual;

SELECT TRANSLATE('J123U456N789E145BAT590CH123','0123456789','')"BATCH_NAME" FROM dual;

	   
	

--NUMBER FUNCTION()

        *ROUND()     *TRUNC()    *MOD()     *POWER()
        *ABS()       *SIGN()     *CEIL()    *FLOOR()    *SQRT()

--ROUND()     --BANKING&FINANCE 

   -->--  +Ve |Next value|>=5  +1 else same VALUE


SELECT ROUND(956.567,2)"ROUND_01"
       ,ROUND(956.562,2)"ROUND_02"
	   ,ROUND(956.562,1)"ROUND_03"
	   ,ROUND(956.522,1)"ROUND_04"
	   ,ROUND(956.122,0)"ROUND_05"
	   ,ROUND(956.722,0)"ROUND_06"
	   ,ROUND(956.122  )"ROUND_07"
   FROM dual;
   
   
   -->-- -Ve|same value |>=5


       -1    10
       -2    100
       -3    1000


SELECT ROUND(956.567,-1)"ROUND_01"
       ,ROUND(956.567,-2)"ROUND_02"
	   ,ROUND(886.567,-1)"ROUND_03"
	   ,ROUND(856.567,-2)"ROUND_04"
	   ,ROUND(1924.567,-3)"ROUND_05"
   FROM dual;
	
	
--TRUNC()


SELECT TRUNC(987.5698,3)"TRUNC_01"
       ,TRUNC(987.5698,2)"TRUNC_02"
       ,TRUNC(987.5698,1)"TRUNC_03"
       ,TRUNC(987.5698,0)"TRUNC_04"
       ,TRUNC(987.5698  )"TRUNC_05"
   FROM dual;	   
   
   
SELECT TRUNC(987.5698,-1)"TRUNC_01"
       ,TRUNC(987.5698,-1)"TRUNC_02"
       ,TRUNC(1987.5698,-3)"TRUNC_03"
       ,TRUNC(1287.5698,-3)"TRUNC_04"
   FROM dual;
   
   
--MOD()

SELECT MOD(13,4),MOD(14,10),MOD(-14,10)
   FROM dual;


--FAQ| Query to print odd number|even number -employees_id


--POWER()

SELECT POWER(2,2),POWER(5,30),POWER(5,5)
   FROM dual;


--ABS()

SELECT ABS(-900),ABS(900) FROM dual;
SELECT ABS(2000,-22000) FROM dual;


--SIGN()


+Ve Value  | 1
-Ve Value | -1


CREATE TABLE SIGN_TB (id_number);

INSERT INTO SIGN_TB values(-10);
INSERT INTO SIGN_TB values(100);

SELECT id,sign(id) FROM dual;


--Query to display all the positive values.
--Query to display all the negative values.
--Query to display sum of all positive values SUM(id).
--Query to display the sum of all negative values SUM(id).


--CEIL() & FLOOR()


SELECT CEIL(7,9),CEIL(7,3),FLOOR(9,1),FLOOR(9,0) FROM dual;


--DATE FUNCTIONS

        *MONTHS_BETWEEN()        --<--WHICH RETURN NUMBER AS OUTPUT
		*ADD_MONTHS()
		*NEXT_DAY()
		*LAST_DAY()        
		
		
SELECT SYSDATE FROM dual;
		
SELECT SYSDATE +10 FROM dual;

SELECT SYSDATE -25 FROM dual;

SELECT ROUND(SYSDATE - TO_DATE('02-JUN-24')) FROM dual;

SELECT ROUND (SYSDATE = TO_DATE('02-JUN-24')) FROM dual;

     Date + Number = Date 
	 Date - Number = Date
	 Date - Date   = number
	 Date + Date   = Error    (--Error Date + Date is not allowed)


--MONTHS_BETWEEN()

      --KEEP THE RECENT DATE AS FIRST input

SELECT MONTHS_BETWEEN (SYSDATE,'12-MAY-14')||'MONTHS' "MONTHS DIFF" FROM dual;

--YEARS BETWEEN USING MONTHS_BETWEEN()/12

SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'12-MAY-99')/12)||'YEARS OLD' "AGE" FROM dual;

--(sysdate-that date)/365

-->--Base column->Derived column-

SELECT employee_id  
       ,first_name
       ,hire_date
       ,ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)/12)||'years' "EXP" 
 FROM employees;
WHERE ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)/12)>35; 
   
--DOB->AGE

SELECT ROUND(MONTHS-between(SYSDATE,'12-JUN-03')/12||'years' "AGE" FROM dual;


--ADD_MONTHS()

SELECT SYSDATE
       ,ADD_MONTHS(SYSDATE,3) "AM_01"
       ,ADD_MONTHS(SYSDATE,6) "AM_02"
       ,ADD_MONTHS(SYSDATE,-3) "AM_03"	   
       ,ADD_MONTHS(SYSDATE,-6) "AM_04"	   
	FROM dual;

--NEXT_DAY()

SELECT NEXT_DAY(SYSDATE,'Friday')	     "ND_01" 
       NEXT_DAY(SYSDATE,'Sunday')	     "ND_02"
       NEXT_DAY(SYSDATE,'Wednesday')	 "ND_03"
       NEXT_DAY(SYSDATE,(10*7),'Sunday') "ND_04"
	FROM dual;

--LAST_DAY()

SELECT LAST_DAY(SYSDATE) FROM dual;

SELECT LAST_DAY(SYSDATE-15) FROM dual;
	
	   
	   