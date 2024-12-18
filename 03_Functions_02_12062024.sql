--> FUNCTIONS

--Functions in Oracle


--NUMBER Functions

   ROUND()  TRUNC()  MOD()   POWER()
   ABS()	SIGN()   CEIL()  FLOOR()   SQRT()
   
--ROUND()   -->-- Banking & Finance

   --> +ve | Next Value | >=5  +1  Else same value
 
      SELECT ROUND(956.567,2) "ROUND_01"
            ,ROUND(956.562,2) "ROUND_02"
            ,ROUND(956.562,1) "ROUND_03"
            ,ROUND(956.522,1) "ROUND_04"
            ,ROUND(956.722,0) "ROUND_05"
            ,ROUND(956.122,0) "ROUND_06"
            ,ROUND(956.122)   "ROUND_07"
      FROM dual;
	  
   --> -ve | Same value | >=5.
   
        -1  10
		-2  100
		-3  1000
		
      SELECT ROUND(956.567,-1)  "ROUND_01"
            ,ROUND(954.562,-1)  "ROUND_02"
            ,ROUND(884.562,-2)  "ROUND_03"
            ,ROUND(824.562,-2)  "ROUND_04"
            ,ROUND(824.562,-3)  "ROUND_05"
            ,ROUND(1824.562,-3) "ROUND_06"
      FROM dual;	

--TRUNC()

    SELECT TRUNC(987.5698,3) "TRUNC-01"
		   TRUNC(987.5698,2) "TRUNC-02"
		   TRUNC(987.5698,1) "TRUNC-03"
		   TRUNC(987.5698,0) "TRUNC-04"
		   TRUNC(987.5698)   "TRUNC-05"
    FROM dual;

   
    SELECT TRUNC(983.56,-1)  "TRUNC-01"
		   TRUNC(987.56,-1)  "TRUNC-02"	 
		   TRUNC(1987.56,-3) "TRUNC-03"
		   TRUNC(1287.56,-3) "TRUNC-04"
    FROM dual;

--MOD()

    SELECT MOD(13,4), MOD(14,10), MOD(-14,10)
	FROM dual;
	
--FAQ: Query to print odd Number/ Even number - employee_id.


--POWER()
  
    SELECT POWER(2,2), POWER(5,3), POWER(5,5)
	FROM dual;
	

--ABS()

    SELECT ABS(-900), ABS(900) FROM dual;
    SELECT ABS(20000-22000) FROM dual;
	
	
--SIGN

   +ve Value |  1
   -ve Value | -1

[
  CREATE TABLE sign_tb (id Number);
  INSERT INTO sign_tb VALUES(20);
  INSERT INTO sign_tb VALUES(-16);
  INSERT INTO sign_tb VALUES(-76);
  INSERT INTO sign_tb VALUES(100);
  INSERT INTO sign_tb VALUES(21);
  INSERT INTO sign_tb VALUES(65);
  INSERT INTO sign_tb VALUES(-90);
  INSERT INTO sign_tb VALUES(43);
  INSERT INTO sign_tb VALUES(-57);
  INSERT INTO sign_tb VALUES(-82);
]

SELECT id, SIGN(id) FROM sign_tb;


--Query to display all the Positive Numbers.
--Query to display all the Negative Numbers.
--Query to display sum of all the positive values | sum(_id) 
--Query to display sum of all the Negative values | sum(_id)


--CEIL() & FLOOR()

   SELECT CEIL(7,9), CEIL(7,3), FLOOR(9,1), FLOOR(9,9)
   FROM dual;

   
--DATE FUNCTIONS

       -> MONTHS_BETWEEN()       <-- Which return number as output.
	   -> ADD_MONTHS()
	   -> NEXT_DAY()
	   -> LAST_DAY()
	   
    SELECT SYSDATE FROM dual;
    SELECT SYSDATE+10 FROM dual;
    SELECT SYSDATE-25 FROM dual;
    SELECT ROUND(SYSDATE - TO_DATE('02-Jun-24') FROM dual;
    SELECT ROUND(SYSDATE + TO_DATE('02-Jun-24') FROM dual;
	
	      -- DATE + NUMBER = DATE
		  -- DATE - NUMBER = DATE
		  -- DATE - DATE   = NUMBER
		  -- DATE + DATE   = ERROR ( ORA-00975: date + date note allowed)
 
 
--MONTHS_BETWEEN		  

        -- Keep the recent date as first input.
		
    SELECT MONTHS_BETWEEN(SYSDATE, '12-MAY-14') || 'Months' "MONTHS DIFF" FROM dual;
	
  -- Years between using MONTHS_BETWEEN()/12
   
    SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'12-MAY-99')/12) || 'Years old' "AGE" FROM dual;
	
  -- ( SYSDATE - that Date)/365

    -->-- Base Column -> Derived Column.
    
    SELECT employee_id
          ,first_name		  
          ,hire_date
		  ,ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)/12) || 'Years' "EXEP"
	FROM employees
	WHERE ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)/12)<35;

  -->DOB ->age

    SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'12-JUN-03')/12) || 'Years' "AGE" FROM dual;
	
	
--ADD_MONTHS()

    SELECT SYSDATE
          ,ADD_MONTHS(SYSDATE,3)  "AM_01"
          ,ADD_MONTHS(SYSDATE,6)  "AM_02"
          ,ADD_MONTHS(SYSDATE,-3) "AM_03"
          ,ADD_MONTHS(SYSDATE,-6) "AM_04"
    FROM dual;
	
	
--NEXT_DAY()

    SELECT NEXT_DAY(SYSDATE,'FRIDAY')           "ND_01"
          ,NEXT_DAY(SYSDATE,'SUNDAY')           "ND_02"
          ,NEXT_DAY(SYSDATE,'WEDNESDAY' )       "ND_03"
          ,NEXT_DAY(SYSDATE + (10*7),'SUNDAY' ) "ND_04"
    FROM dual;


--LAST_DAY()

    SELECT LAST_DAY (SYSDATE) FROM dual;
    SELECT LAST_DAY (SYSDATE-15) FROM dual;


-- 5+ 6+

    -- First | Mid | Last part of the mail.
	
	CREATE TABLE dec_values(rdng NUMBER;
	BEGIN
	INSERT INTO dec_values VALUES(456.45);
    INSERT INTO dec_values VALUES(16.4);
    INSERT INTO dec_values VALUES(4561.56);
    INSERT INTO dec_values VALUES(45.73);
    INSERT INTO dec_values VALUES(1.124);
    END;
	/
	
--2 Methods | TRUNC() and - | SUBSTR() and INSTR()

    SELECT SYSDATE FROM dual;
	
	SELECT ROUND(SYSDATE,'MM')     "RND_01"
		  ,ROUND(SYSDATE+8,'MM')   "RND_02"
		  ,ROUND(SYSDATE+8,'YY')   "RND_03"
		  ,ROUND(SYSDATE+100,'YY') "RND_04"
    FROM dual;

    SELECT TRUNC(SYSDATE,'MM')      "TRUNC_01"
          ,TRUNC(SYSDATE+8,'MM')    "TRUNC_02"
          ,TRUNC(SYSDATE+8,'YY')    "TRUNC_03"
          ,TRUNC(SYSDATE+100,'YY')  "TRUNC_04"
    FROM dual;
	
--txn_dt
--Hardcode

    SELECT * FROM txn_tb WHERE txn_dt BETWEEN SYSDATE-10 AND SYSDATE;

-- 15-Jun-94 | 01-Jun-94 to 30-Jun-94
-- 15-Jun-94 | 01-Jan-94 to 31-DEC-94

Display all the date in that month (based on input)
Display all the date in that year  (based on input)

--CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(SYSDATE),'DD');
--CONNECT BY LEVEL <= TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE,'YY'),12)-1,'DDD');


INFYCLE

I
N
F
Y
C
L
E


INFYCLE

I
IN
INF
INFY
INFYC
INFYCL
INFYCLE































































































