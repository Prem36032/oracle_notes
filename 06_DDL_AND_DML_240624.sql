Statements in Oracle

      DDL -Data Definition Language  (CARDT)   -- Object Level | AutoCommit
	    
		CREATE
		ALTER    --Column Level
		   ADD     RENAME   MODIFY   DROP
		RENAME
        DROP
        TRUNCATE


      DML -- Data Manipulation Language    --Data Level | manualCommit

      	INSERT
        UPDATE
        DELETE
        MERGE(INSERT + UPDATE)


      TCL --Transaction Control Language

        COMMIT
        ROLLBACK
        SAVEPOINT


      DCL --Data Control Language

        GRANT 
        REVOKE

Data Type In Oracle

  NUMBERS(P,S)       0-9              employee_id NUMBER(4)     
  SIZE: Optional                      salary      NUMBER
  MAX:  38(10^38-1)             
  
                                       897.67 --read_pt  NUMBER(3,2)
									   read_pt  NUMBER(5,2)
									   
--Variable Character Length 

   VARCHAR2            0-9                    first_name   VARCHAR2(30)
   SIZE : Mandatory    a-z|A-Z                email_id     VARCHAR2(30)
   MAX :  4000         Special Characters         
   
   
--Fixed Character Length 

   CHAR                0-9                    first_name CHAR(30)
   SIZE    : Optional  a-z|A-Z                email_id   CHAR(30)
   Default : 1         Special Characters
   
                            v_a  VARCHAR2(5)    cat |c|a|t| | |
                            v_b     CHAR(5)     cat |c|a|t| | | -> 2 SPACE
							
							   v_a <> v_b
                               LENGTH (v_a) <> LENGTH (v_b)
                               v_a = TRIM (v_a)
                               LENGTH (v_a) = LENGTH(TRIM(v_b))
							   
--DATE							   
   
   DATE                 24-jun-24        joining_dt  DATE
   Default : 7                           DOB         DATE
   
--TIMESTAMP 

    TIMESTAMP          24-jun-24 01:22:51:575000 PM +05:30
                       reg_dttm
                       apr_dttm

LONG -2GB  --Per Table we can have only one long cloumn
           --We can't use this column in GROUPBY
           --Copy not possible while having long Column

CLOB-4GB

--
BLOB 
BEILE 
ROWID 
XMLTYPE 
INT 

--DDL : Data Define Language

   CREATE
   ALTER
   RENAME
   DROP
   TRUNCATE

--Table Design Document (EXCEL)

CREATE TABLE  students_tb
(
  stud_id      NUMBER
  ,name        VARCHAR2(30)
  ,gender      CHAR
  ,dob         DATE 
  ,dept_id     VARCHAR2(10)
);

Feedback : Table created

--CTAS Create Table As Select / sub queries with Data

CREATE TABLE dept1 AS SELECT * FROM departments WHERE 1=1;

--CTAS Create Table As Select / sub queries without Data 

CREATE TABLE dept1 AS SELECT * FROM departments WHERE 1=2;


ALTER TABLE students_tb ADD feedback VARCHAR2(200)
ALTER TABLE students_tb RENAME COLUMN dept_id TO deaprtment_id; 
ALTER TABLE students_tb MODIFY department_id NUMBER;
ALTER TABLE students_tb DROP COLUMN feedback;


Feedback : Table created 

ALTER TABLE students_tb ADD(Column01  TIMESTAMP
                            ,Columno2 DATE
							,Column03 NUMBER);
							
RENAME students_tb TO stud_tb;

DROP stud_tb;

TRUNCATE TABLE stud_tb;


--DML (Data Manipulation Language)

CREATE TABLE myemp_tb
(emp_id    NUMBER
,name      VARCHAR@(30)
,hire_date DATE
,job_id    VARCHAR2(30) DEFAULT 'TRAINEE'
,dept_id   NUMBER);


--100%
INSERT INTO myemp-tb (emp_id,name     ,hire_date  ,job-id   ,dept_id)
            VALUES   (1001  ,'name_01',SYSDATE-500,'SAl_MGR',90);

INSERT INTO myemp-tb 
            VALUES   (1002  ,'name_02',SYSDATE-120,'SAl_REP',10);	


INSERT INTO myemp-tb (emp_id,name     ,hire_date  ,job-id )
            VALUES   (1003  ,'name_03',SYSDATE-220,'ACC_DEPT');
			
INSERT INTO myemp-tb (emp_id,name     ,hire_date ,dept_id)
            VALUES   (1004  ,'name_04',SYSDATE-51,90);	


--How to insert NULL
   --Ignore that column | NULL | ''
    --Not  'NULL' | ' '

--Inserting Data By Using Sub Query	

INSERT INTO dept2(SELECT * FROM departments
    WHERE department_id IN (10,20,30,40,50,60,70,80);
	
SELECT * FROM myemp_tb
     SET name= 'SARAVANAN'
 WHERE emp_id=1001;

SELECT myempt_tb
     SET name='KUMAR'
	 ,hire_date =SYSDATE
	WHERE emp_id =1002;

UPDATE  myemp_tb
     SET  name  ='KUMAR'
     ,hire_date = SYSDATE;

--DELETE

SELECT * FROM dual;


DELETE FROM dept1
    WHERE department_id  IN (10,30,50);

Feedback : 3 Row(s) Deleted


DELETE FROM dept1;


------------------------------------------------------------------------------											  
       TRUNCATE                              DELETE
------------------------------------------------------------------------------											  

       DDL                                    DML

       We can't use WHERE Clause              we can use WHERE
       --we can't delete the Data             --we can Delete the Rows
       --which we want           	          Which we want
	   
	   ROLLBACK not possible                  ROLLBACK possible
	   --We can't  get the data BACKUP
	   
	   
	   FAST                                   SLOW
	   
	   Table Truncated                        5 row(s)  Deleted
	   
	                                          High / Low  Watermark
											  
--------------------------------------------------------------------------------											  
			


			













   
   
   
   