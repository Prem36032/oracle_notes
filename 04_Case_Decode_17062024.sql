GREATEST()
LEAST()

SELECT GREATEST(100,400,1600,900,600,400) FROM dual;

SELECT LEAST (100,400,1600,900,600,400) FROM dual;


--DECODE() Function and CASE Expression

    SELECT DECODE('Superman','Supermna','Option_01','Other_Option') Return
    FROM dual;
    
    SELECT DECODE('Spider','Superman','Option_01'
                          ,'Spiderman','Option_02'
                          ,'Batman','Option_03'
                          ,'Normalman','Option_04'
                                      ,'Other Option') Result
    FROM dual;

    SELECT employee_id
	      ,first_name
		  ,hire_date
		  ,salary
		  ,department_id
		  ,DECODE(department_id,10,'Administration'
		                       ,20,'Marketing'
							   ,30,'Purchasing'
							   ,40,'Human Resource'
							   ,50,'Shipping'
							      ,'Other Department') Department_name
	FROM employees
	WHERE department_id IN(10,20,30,40,50,60,70)
	ORDER BY 5;
	
	
--CASE STATEMENT

		-> Simple Case
        -> Searched Case	

--Simple Case
	
    SELECT employee_id
	      ,first_name
		  ,hire_date
		  ,salary
		  ,department_id
		  ,CASE department_id
		        WHEN 10 THEN 'Administration'
		        WHEN 20 THEN 'Marketing'
				WHEN 30 THEN 'Purchasing'
				WHEN 40 THEN 'Human Resource'
				WHEN 50 THEN 'Shipping'
				ELSE 'Other Department'
		   END Department_name
	FROM employees
	WHERE department_id IN(10,20,30,40,50,60,70)
	ORDER BY 5;
		

--Searched Case

    SELECT employee_id
	      ,first_name
		  ,hire_date
		  ,salary
		  ,department_id
		  ,CASE 
		      WHEN department_id=10 THEN 'Administration'
		      WHEN department_id=20 THEN 'Marketing'
			  WHEN department_id=30 THEN 'Purchasing'
			  WHEN department_id=40 THEN 'Human Resource'
			  WHEN department_id=50 THEN 'Shipping'
			  ELSE 'Other Department'
		   END Department_name
	FROM employees
	WHERE department_id IN(10,20,30,40,50,60,70)
	ORDER BY 5;
	
-- SALARY <=10K LS | HS | MS


--DECODE()
   
    -> Memory Consumption
    -> To break the usual order.
 
    PFA - Pending For Approval
    A  	- Approved
	R   - Rejected
	
	SELECT ref_id, cus_id, issue_type, issue_desc
	      ,DECODE(status,'PFA','Pending for Approval'
		                , 'A', 'Approved'
						, 'R', 'Rejected') status
	FROM rbi_inc_mgmt_tb;
	
	SELECT c_name FROM course_tb
	ORDER BY DECODE(c_name,'Oracle',   1
                          ,'Big Data', 2	
						  ,'Testing',  3
						            ,  4) ASC;
									
-- I need employee hired from Wednesday to Tuesday.

---------------------------------------------------------------------------------------------------------------
          DECODE()                                                      CASE
---------------------------------------------------------------------------------------------------------------
      * Function                                                   * Expression

      * Exact Match                                                * We can use all operators.

      * Default ELSE part.                                         * We need to mention it.     

      * Oracle Standard.                                           * ANSI Standard.

      * SQL statement.                                             * We can use it in both SQL and
	                                                                 PL/SQL (END CASE).
																	 
      * Slow.                                                      * Fast.

---------------------------------------------------------------------------------------------------------------

--What? | Operator? | ELSE | Standard | Statement | Performance


-- NULL with DECODE().
-- NULL with CASE.


-- How to get DISTINCT Record?

  SELECT DISTINCT first_name FROM employees;
  
  SELECT UNIQUE   first_name FROM employees;
  
  SELECT first_name
  FROM employees
  GROUP BY first_name;
  
  SELECT first_name, COUNT(*)
  FROM employees
  GROUP BY first_name
  HAVING COUNT(*) >=1;

  
--How to get Duplicate Record? 

  SELECT first_name, COUNT(*)
  FROM employees
  GROUP BY first_name
  HAVING COUNT(*) >1;
 




























































































































