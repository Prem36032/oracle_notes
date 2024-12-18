--VIEW_(vw)

     Virtual Table
	 
	 It is a logical Representation of Subset of Records
	 
	 View wont contains data | Saved query
	 
	 It is a schema object
	 
	 User_views
	 
--TYPES OF VIEWS

    Simple view
	complex view
	
--SIMPLE View

CREATE VIEW exec_vw
AS
SELECT employee_id ,first_name ,hire_date ,salary ,department_id
  FROM employees
 WHERE department_id=60;
 

CREATE OR REPLACE VIEW exec_vw
AS
SELECT employee_id ,first_name ,hire_date ,salary ,department_id
  FROM employees
 WHERE department_id=60;
 

CREATE VIEW exec_vw
AS
SELECT employee_id ,first_name ,hire_date ,salary ,e.department_id ,department_name
  FROM employees e,departments d
 WHERE e.department_id=d.department_id
    AND e.department_id=60;
	
SELECT * FROM exec_vw;

CREATE OR REPLACE VIEW sal_details_vw
AS
SELECT e.department_id ,d.department_name ,MIN(salary) min_sal ,MAX(salary) max_sal ,SUM(salary) sum_sal
  FROM employees e,departments d 
 WHERE e.department_id=d.department_id
   AND e.department_id IS NOT NULL
 GROUP BY e.department_id,d.department_name
ORDER BY 1 ASC;

--ALIAS NAME

CREATE OR REPLACE VIEW exec_vw
AS
SELECT employee_id ,first_name ,hire_date ,12*salary
   FROM employees
 WHERE department_id IN (10,60,90);
 
CREATE OR REPLACE VIEW exec_vw(employee_id,first_name,hdate,ann_income)
AS
SELECT employee_id ,first_name ,hire_date ,12*salary 
 FROM employees
WHERE department_id IN (10,60,90);

--Advantage of creating View

     we can provide the data they want
	 we cant access other data 
     we can make complex queries Simple
     we can Represent the data in different form

     +ve|-ve|Simple|present

DML operation on View

   --Simple view 
       DML possible

   --DELETE not possible
       DISTINCT
       GROUP FUNCTIONS
       GROUP BY	   
	   PSEUDO COLUMNS
	   COLUMN DEFINED EXPRESSION     (12*salary)
	   
	   t1     
	   
	   c1     c2     c3     c4     c5
	vw
	          c2     c3     c4           NULL
			  
	    If we have NOT NULL constraint on the column which is not selected by the View
		
--Complex View 

    DML not  possible (Using INSTEAD OF TRIGGER);
	
	
CREATE VIEW exec_vw
AS
SELECT employee_id,first_name,hire_date,salary,department_id 
  FROM employees 
 WHERE department_id=60 WITH READ ONLY;
 
CREATE VIEW exec_vw
AS
SELECT employee_id,first_name,hire_date,salary,department_id 
  FROM employees 
 WHERE department_id=60
 
table->View
view->View
table join view ->view
