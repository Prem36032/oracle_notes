--SEQUENCE

      SELECT seq.name.NEXTVAL FROM dual;
	  
--IIG DECLARE

      V_A NUMBER =seq_name.NEXTVAL
	  
BEGIN
END;
/
--12C

     CREATE TABLE employees (e_id number DEFAULT seq_name.NEXTVAL);
	 
--FORCE VIEW

    SELECT * FROM sales_tb;

CREATE OR REPLACE FORCE VIEW seles_vw
AS
SELECT sale_id,cust_id,cust_name,qty FROM seles_tb;

SELECT object_name,object_type,status
FROM all_objects;

WHERE object_name=UPPER('sales_vw');
CREATE TABLE sales_tb
       (sale_id   NUMBER
	   ,wst       NUMBER
	   ,cust_name VARCHAR2(30)
	   ,qty       NUMBER);
	   
SELECT * FROM sales_vw;

ALTER VIEW sales_vw COMPILE;

--materialized view 
          
		Mviwe/snapshot
		materialized view contain data
		used for data replication
		
		user_Mview   |   user_Mview_logs
		
		Table        view          mview

        5000         5000          5000		
                   (logical)     (physical)
				   
		5500         5500          5000
		          upto date      out dated
				  
				                   Refesh
								   complete        FAST
								   5500             500
								                   log(PRIMARY KEY|ROW ID)
     Index   NOT POSSIBLE   POSSIBLE
                            High perfomance

CREATE MATERIALIZED VIEW test_mvw
REFRESH COMPLETE
NEXT SYSDATE +1                         --for min (/1440)
AS
SELECT employee_id,first_name,hire_date,salary,department_id
FROM employees
WHERE DEPARTMENT IN (10,60,90);

--REFRESH ON DEMAND
--SQLPLUS

EXEC dbms_mview refesh('test_mvw','c');

BEGIN 
	dbms_mview.refesh('test_mvw','c');
END;

CREATE MATERIALIZED VIEW LOG ON employees WITH PRIMARY KEY;
CREATE MATERIALIZED VIEW LOG ON employees WITH ROWID;

               HDFC     (IT)
			   IM  
			   (Table)
			   2lakhs    mview
			   (VIEW)
			   
--Invisible COLUMNS
--vistual column

