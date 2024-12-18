PSEUDOCOLUMNS

    It is not a column inside the table but it act like a column
	Mostly used in PL/SQL
	
	USER 
	UID
	SYSDATE
	SYSTIMESTAMP
	ROWNUM
	ROWID
	LEVEL
	
	--Sequence related pseudocolumn
	
	NEXTVAL
	CURRVAL
	
	ORA-ROWSCN
	
SELECT employee_id, first_name, hire_date, SYSDATE 
  FROM employees
 WHERE department_id = 80;

USER and UID;

SELECT USER<UID FROM dual;

SYSDATE and SYSTIMESTAMP;

SELECT SYSDATE,SYSTIMESTAMP FROM dual;

SELECT *
  FROM bi_inc_mgmb_tb
 WHERE TRUNC(req_dttm) = TRUNC(SYSTIMESTAMP);
 
--ROWNUM

    Generate contains number of Runtime | before order by 
	
SELECT ROWNUM,d.* FROM departments d;

SELECT ROWNUM,d.* FROM departments d WHERE ROWNUM=1
SELECT ROWNUM,d.* FROM departments d WHERE ROWNUM<=5
SELECT ROWNUM,d.* FROM departments d WHERE ROWNUM<5

--Need to get 5th record

SELECT ROWNUM,d.* FROM departments d WHERE ROWNUM=5;

SELECT * FROM
        (SELECT ROWNUM rn,d.* FROM departments d WHERE ROWNUM<5
		)
	WHERE rn=5;
	
--Important FAQ | nth maximum salary 

      --Query to get maximum salary 
	  
SELECT MAX(salary) FROM employees;

--Query to get second maximum salary 

SELECT MAX(salary)
   FROM employees 
  WHERE salary<(SELECT MAX(salary) FROM employees);

SELECT MAX(salary)
   FROM employees 
 WHERE salary NOT IN(SELECT MAX(salary) FROM employees);

--Query to get nth maximum salary 

SELECT * FROM 
   (SELECT ROWNUM rnk,salary
       FROM (SELECT DISTINCT salary FROM employees
                 ORDER BY salary DESC)
   )
  WHERE rnk = 5;

--Display top 10 salary from the employees table
--last 10 salary from the employee table

--ROWID

    Physical address for each row  in oracle | it is unique
    LENGTH : 18
    Give better performance

SELECT ROWID ,d.* FROM departments d;
SELECT ROWID ,d.* FROM departments d;
    WHERE ROWID='AAAC8/AAEAAAAA3AAD';
--Write a query to get first inserted record 
--Wirte a query to get last inserted RECORD
--last inserted 5 ROWS
--first inserted 3 row 
--How to delete duplicate records

CREATE TABLE delete_duplicate(name VARCHAR2(30));

BEGIN
INSERT INTO delete_duplicate VALUES('Rajesh')
INSERT INTO delete_duplicate VALUES('Rajesh')
INSERT INTO delete_duplicate VALUES('Saranya')
INSERT INTO delete_duplicate VALUES('Kumar')
INSERT INTO delete_duplicate VALUES('Rahul')
INSERT INTO delete_duplicate VALUES('Neena')
INSERT INTO delete_duplicate VALUES('Neena')
INSERT INTO delete_duplicate VALUES('Neena')
INSERT INTO delete_duplicate VALUES('Ravi')
INSERT INTO delete_duplicate VALUES('Ravi')
COMMIT;
END;
/

DELETE FROM delete_duplicates
      WHERE ROWID NOT IN (SELECT MAX(ROWID)
	                         FROM delete_duplicate
						   GROUP BY name);
						   
SELECT * FROM delete_duplicate:

DELETE FROM delete_duplicate
   WHERE (name.ROWID) NOT IN (SELECT name,MAX(ROWID)
                                 FROM delete_duplicate
							   GROUP BY name);
					
SELECT name,SCN_TO_TIMESTAMP(ORA-ROWSCN)
    FROM delete_duplicate;
	
	
--LEVEL

*
***
*****
*******

SELECT RPAD('*',LEVEL,'*')pat
    FROM dual
  CONNECT BY LEVEL <=5
  
SELECT LPAD(RPAD('*',LEVEL,'*'),5,' ')
     ||RPAD('*',LEVEL-1,'*')pat
	FROM dual
   CONNECT BY LEVEL <=5;
   
   TOP to BOTTOM     PK=FK
   BOTTOM to TOP     FK=PK
   
SELECT RPAD(' ',(LEVEL-1)*5,' ')||first_name reparting_tb
   FROM employees
  CONNECT BY PRIOR employee_id=manager_id
START WITH manager_id IS NULL;















	

 