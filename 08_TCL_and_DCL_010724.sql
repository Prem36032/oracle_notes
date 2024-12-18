--TCL : Transaction Control Language

    -> COMMIT            --SAVE
	-> ROLLBACK          --UNDO
	-> SAVEPOINT         --to split the transaction(Max:5)

ROLLBACK TO s3;

--Important FAQ

--#1
     Transaction?
          List of statements which we execute between two points. 	 
		  
--#3

CREATE table t1

1000 => t1

COMMIT;

500=> t1

CREATE table t2 | ALTER Statement|

10000 => t2

ROLLBACK;

SELECT COUNT(*) FROM t1;

1500

SELECT COUNT(*) FROM t2;

0

--#4

    Proper EXIT will commit all the changes we make.
    Abort the session | Kill the session.

--MERGE STATEMENT

        MERGE = INSERT + UPDATE.

CREATE TABLE infy_course_tb(cid NUMBER, C_name VARCHAR(30));

CREATE TABLE infy_bkp_COURSE_tb
AS
SELECT * FROM infy_course_tb WHERE 1=2;

SELECT * FROM infy_course_tb;

SELECT * FROM infy_bkp_COURSE_tb ORDER BY 1;
		  
INSERT INTO infy_course_tb VALUES(10,'Oracle')
INSERT INTO infy_course_tb VALUES(20,'Angular')		  
INSERT INTO infy_course_tb VALUES(30,'Testing')		  
INSERT INTO infy_course_tb VALUES(40,'Big Data')		  
INSERT INTO infy_course_tb VALUES(50,'Cloud')		  
INSERT INTO infy_course_tb VALUES(60,'Data Science')	

UPDATE infy_course_tb SET C_name= 'Oracle Database' WHERE c_id = 10;

MERGE INTO infy_bkp_COURSE_tb b
USING infy_course_tb c	 
ON(c.cid= b.cid)
WHEN MATCHED THEN 
    UPDATE
    SET b.c_name = c.c_name	 
WHEN NOT MATCHED THEN
    INSERT VALUES (c.cid,c.c_name);
	
--in update part -- Optional DELETE STATEMENT | which must contain WHERE clause.

--GTT Global Temporary Table.
 
    Session wise Data | TRUNCATE
	
CREATE GLOBAL TEMPORARY TABLE my_temp_table1(
       id NUMBER,
	   description VARCHAR2(20))
ON COMMIT DELETE ROWS;

CREATE GLOBAL TEMPORARY TABLE my_temp_table(
       id NUMBER,
	   description VARCHAR2(20))
ON COMMIT PRESERVE ROWS;

TABLESPACE : USER | SYSAUX | INFY_TBS

Global Temporary Table : TEMP(GTT| ORDER BY| DISTINCT| GROUP BY)

--#1

    If the TRUNCATE Statement is issued against a temporary table, only the session specific data is truncated.
	There is no affect on the data of other sessions.
	
--#2
    
	Data in temporary table is stored in temp segments in the temp tablespace.
	
--#3

    Data in temporary tables is automatically delete at end of the database session, even if it ends abnormally.
	
	Indexes can be created in temporary tables.
	
--PPT- Private Temporary Tables(18C)
		  
		  ON COMMIT DROP DEFINITION
		  
		  ON COMMIT PRESERVE DEFINITION
		  
		 table name must start with ora$ptt.
		 
SELECT DECODE(1,2,3,4,5) FROM dual;
SELECT DECODE(1,2,3,4,5,6) FROM dual;		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  