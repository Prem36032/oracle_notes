Aggregate function / Group function:
SELECT MIN(salary) FROM employees
SELECT MAX(salary) FROM employees
SELECT ROUND(AVG((salary)) FROM employees
SELECT SUM(salary) FROM employees
SELECT COUNT(salary) FROM employees

--ANALYTICAL function:
					  MIN() OVER()
					  MAX() OVER()
					  SUM() OVER()
					  AVG() OVER()
					COUNT() OVER()
			         LEAD() OVER()
			          LAG() OVER()
			  FIRST_VALUE() OVER()
			   LAST_VALUE() OVER()
					 RANK() OVER()
			   DENSE_RANK()
			      LISTAGG()
				  
  
SELECT employee_id
     , first_name
	 , hire_date
	 , salary
	 , LEAD(first_name,1,0) OVER(ORDER BY employee_id) lead_sal1
	 , LEAD(salary,2,0) OVER(ORDER BY employee_id) lead_sal2
	 , LAG(salary,1,0) OVER(ORDER BY employee_id) lag_sal1
	 , LAG(salary,2,0) OVER(ORDER BY employee_id) lag_sal2
  FROM employees;

SELECT employee_id
	 , first_name
     , FIRST_VALUE(first_name) OVER() first_person
	 , LAST_VALUE (first_name) OVER() last_person
  FROM employees;
  
  SELECT employee_id
       , first_name
	   , department_id
	   , salary
       , MAX(salary) OVER(PARTITION BY department_id ORDER BY employee_id ASC) max_sal
    FROM employees
ORDER BY department_id ASC;

  SELECT employee_id
       , department_id
	   , first_name
       , LEAD(first_name,1,'No manager') OVER(PARTITION BY department_id ORDER BY employee_id) reporting_to
    FROM employees
ORDER BY 1;

  SELECT employee_id
       , department_id
	   , first_name
	   , salary
	   , RANK() OVER(ORDER BY salary DESC)rank
	   , DENSE_RANK() OVER(ORDER BY salary DESC) dense_rank
    FROM employees;

-- Nth maximum salary (Method 1 & 2) inline VIEW

SELECT * FROM
(SELECT ROWNUM rnk , salary FROM employees ORDER BY salary DESC) 
WHERE rnk =5;


SELECT * FROM
(SELECT ROWNUM rnk, salary FROM(SELECT DISTINCT salary FROM employees ORDER BY salary DESC))
WHERE rnk = 5;


SELECT * FROM(SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) dense_rank2
    FROM employees)
WHERE dense_rank2 = 5;



-- Find Nth maximum salary

SELECT * FROM
(SELECT ROWNUM rnk, salary FROM(SELECT DISTINCT salary FROM employees ORDER BY salary DESC))
WHERE rnk = 5;

-- Display second maximum salary from each department_id

SELECT * FROM
(SELECT department_id
     , salary
     , DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) rnk
  FROM employees)
WHERE rnk = 2;


-- Display second hired person from each department

SELECT * FROM
(SELECT department_id
     , hire_date
     , first_name
     , DENSE_RANK() OVER (PARTITION BY department_id ORDER BY hire_date DESC) rnk
  FROM employees)
WHERE rnk = 2;
	
	
--LISTAGG:

	
CREATE TABLE employee(did NUMBER, name VARCHAR2(30));
BEGIN
INSERT INTO employee VALUES (10,'jennifer');
INSERT INTO employee VALUES (10,'Murugan');
INSERT INTO employee VALUES (20,'Michael');
INSERT INTO employee VALUES (20,'Pat');
INSERT INTO employee VALUES (20,'Raj');
INSERT INTO employee VALUES (30,'Neena');
INSERT INTO employee VALUES (30,'Rahul');
INSERT INTO employee VALUES (30,'Rahul');
INSERT INTO employee VALUES (30,'Rakesh');
COMMIT;
END;
/

  SELECT did
       , LISTAGG(name,',') WITHINN GROUP(ORDER BY name ASC)
    FROM employees
GROUP BY did;

19C NEW FEATURE:

  SELECT did
       , LISTAGG (DISTINCT name,',') WITHINN GROUP(ORDER BY name ASC)
    FROM employees
GROUP BY did;

 SELECT LISTAGG(name,',') WITHINN GROUP(ORDER BY name ASC)
   FROM employees;
   
  SELECT manager_id
       , LISTAGG (DISTINCT name,',') WITHINN GROUP(ORDER BY name ASC)
    FROM employees
GROUP BY manager_id;

1	A
1	B						1		A,B,C
1	C				=>		 
2	M						2		M,N
2	N

manager_id and all the employees reporting to them job_id and all the employees with that job_id

ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING:

SELECT employee_id
     , first_name
	 , department_id
	 , salary
	 , SUM(salary) OVER(PARTITION BY department_id ORDER BY salary DESC
	                    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)"first_person"
  FROM employees; 
  
  
ROWS BETWEEN UNBOUNDED PRECEEDING AND UNBOUNDED FOLLOWING
ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING






























