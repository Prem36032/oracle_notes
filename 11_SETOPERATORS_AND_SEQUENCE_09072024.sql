SET OPERATOR | SEQUENCE | SYNONYMS

SET OPERATOR 
         
		Used to combine result set
		
		UNION
		UNION ALL
		INTERSECT
		MINUS
		
	A=10,20,30,40,50
	B=40,50,60,70,80
	
	A UNION B = 10,20,30,40,50,60,70,80
	
	A UNION ALL B =10,20,30,40,40,50,50,60,70,80
	
	A INTERSECT B =40,50
	
	A MINUS B =10,20,30
	
	B MINUS A =60,70,80
	
	A MINUS B = 10,20,30
	UNION
	B MINUS A = 60,70,80
	
--UNION
    
	Gives distinct values | Ignores the duplicates
	
	sort the records in ASC order
	
SELECT department_id ,department_name ,manager_id ,location_id FROM dept1
UNION
SELECT department_id ,department_name ,manager_id ,location_id FROM dept2


--UNION ALL

    Gives duplicates values as well
	
	wont sort the records
	
SELECt department_id ,department_name ,manager_id ,location_id FROM dept1
UNION ALL 
SELECT department_id ,department_name ,manager_id ,location_id FROM dept2

PERFORMANCE: UNION<UNION ALL

SELECt department_id ,department_name ,manager_id ,location_id FROM dept1
MINUS
SELECT department_id ,department_name ,manager_id ,location_id FROM dept2
UNION
(SELECt department_id ,department_name ,manager_id ,location_id FROM dept2
MINUS
SELECt department_id ,department_name ,manager_id ,location_id FROM dept1)

     No. of columns must be same   --Manage by using NULL
	 
	 Order of the datatype must be same --Manage it by using type conversion function
	 
	 First query alias name or column name will be considered for entire result set (Heading)
	 
	 TOP to BOTTOM
	 
	 Order by clause must come in last query 
	 
--TASK: Need 5 query to get distinct records from first_name column

    t1
	--       SELECT c1 FROM t1 
	c1        UNION 
	--       SELECT c1 FROM t1;
	1
	2
	3
	3
	4
	5
	
--SEQUENCE(-SEQ)

    It is a schema object | sharable object 
	
	use to generate UNIQUE number | Mostly used to generate primary key values 
	
	We can use sequence in INSERT | SELECT | in PLSQL we can assign it to variable (11g)
	
	Max number :99999...999(27)  (10^27)-1
	
	Data dictionary table:user_sequence:Identity columns 
	--other database : AUTOINCREMENT
	
CREATE TABLE case_tb( id NUMBER PRIMARY KEY,name VARCHAR2(30));

    SELECT * FROM case_tb;
	
	SELECT * FROM it_tb;
	
CREATE  sequence stud_seq
START WITH 1
MINVALUE 1
MAXVALUE 10
INCREMENT BY 1
NOCYCLE
NOCACHE

CREATE SEQUENCE mystud_seq;

INSERT INTO case_tb VALUES(stud_seq.NEXTVAL,'GR_01')--1
INSERT INTO case_tb VALUES(stud_seq.NEXTVAL,'GR_02')--2
INSERT INTO case_tb VALUES(stud_seq.NEXTVAL,'GR_03')--3
INSERT INTO it_tb   VALUES(stud_seq.NEXTVAL,'GR_01')--4
INSERT INTO it_tb   VALUES(stud_seq.NEXTVAL,'GR_02')--5
INSERT INTO case_tb VALUES(stud_seq.NEXTVAL,'GR_03')--6
INSERT INTO case_tb VALUES(stud_seq.NEXTVAL,'GR_04')--7
INSERT INTO case_tb VALUES(stud_seq.NEXTVAL,'GR_08')--8
INSERT INTO case_tb VALUES(stud_seq.NEXTVAL,'GR_09')--9
INSERT INTO case_tb VALUES(stud_seq.NEXTVAL,'GR_10')--10
                                                   
--Error
												   
ERROR: ORA-08004:sequence STUD_SEQ.NEXTVAL exceeds MAXVALUE and cannot be instatiated

Why there is a gap in sequence generated value?

    --If the same sequence in used in same other table
    --Rollback
    --Memory Related issues 

SELECT * FROM user_sequence WHERE sequence_name IN('stud_seq','mystud_id');

INSERT INTO cse_tb VALUES(stud_seq.NEXTVAL,'Name_01');--1	
INSERT INTO cse_tb VALUES(stud_seq.NEXTVAL,'Name_02');--2
INSERT INTO cse_tb VALUES(stud_seq.NEXTVAL,'Name_03');--3

SELECT stud_seq.CURRVAL FROM dual;--3
SELECT stud_seq.NEXTVAL FROM dual;--4

INSERT INTO it_tb VALUES(stud_seq.NEXTVAL,'Name_03');--5

INSERT INTO it_tb VALUES(stud_seq.NEXTVAL,'Name_01');
.
.
.
INSERT INTO cse_tb VALUES(stud_seq.NEXTVAL,'Name_09');

--NOCYCLE | CYCLE
  -------   -----
  
    897  DL
	897  DP
	
	ODR INC SR REF ORA AMZ FLK
	
	08072024
	567
	
SELECT 'INC' || TO_CHAR(SYSDATE,'DDMMYYYY') || mystud_seq.NEXTVAL FROM dual;

--Negative value by using sequence -50 to 1 | -1 to -50


CREATE TABLE case_tb( id NUMBER PRIMARY KEY,name VARCHAR2(30));

CREATE SEQUENCE stud2_seq
START WITH -50
MINVALUE -50
MAXVALUE 1
INCREMENT BY 1
NOCYCLE
NOCACHE





