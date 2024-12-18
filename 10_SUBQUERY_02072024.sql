SUB QUERY
   
   Query within another query (Inner query| Outer query)
   We can use sub query in SELECT|INSERT|UPDATE|DELETE
   Nested sub query Max level-255
   --we won't use ORDER BY sub query
   1 2 => 2 1
   --who are all getting salary more than avg salary 
   -------------------------------------------------
   
   --Display all the employees details who is getting maximum salary
   --who are all working as a Manager | Distinct manager_id| Handel NULL
   --who are all not working as a manager_id|
   
TYPES OF SUB QUERY


   Single Row sub query | Operator|>|<|>=|<=|<>|=
   Multiple Row sub query | Operator |IN|ALL|ANY
   Scalar sub query
   Inline view
   Multiple Column sub query
   
--Single Row sub query 

   If you query  return  Exactly one row| operator < > <= >= <> =
   
   --who are all getting salary more than average salary
   
SELECT e.employee_id ,e.first_name, e.hire_date, e.salary
  FROM employees e 
 WHERE e.salary>(SELECT AVG(salary) FROM employees);
   
   --who are all getting salary more than neena's salary | where  e.salary>17000; --Hardcode
   
SELECT e.employee_id ,e.first_name, e.hire_date, e.salary
  FROM employees e
 WHERE e.salary > (SELECT salary FROM employees WHERE first_name='neena');
   
   
   
--Multiple Rows sub query

   If you query return more than one row | operator IN ALL ANY
   
   --Error Msg ORA-01427 : Single row sub query return more than one row
   
SELECT e.employee_id ,e.first_name, e.hire_date, e.salary,e.department_id
  FROM employees e
 WHERE e.salary IN(SELECT salary FROM employees WHERE first_name = 'Alexander');

SELECT e.employee_id ,e.first_name, e.hire_date, e.salary,e.department_id 
  FROM employees e
 WHERE e.salary > ANY(SELECT salary FROM employees WHERE first_name='Alexander');

SELECT e.employee_id ,e.first_name, e.hire_date, e.salary,e.department_id 
FROM employees e
WHERE e.salary > ALL(SELECT salary FROM employees WHERE first_name='Alexander');

SELECT      Scalar sub query
FROM        Inline view
WHERE       --Nested sub query
   --GROUP   BY 
   HAVING
   --ORDER BY
   
   --Scalar sub query | sub query in SELECT CLAUSE
   
SELECT department_id,COUNT(*)
  FROM employees
 WHERE department_id IN(10,20,30,40,50)
  GROUP BY department_id
ORDER BY 1;
   
SELECT(SELECT COUNT(*) FROM employees WHERE department_id=10) "Administration"
     ,(SELECT COUNT(*) FROM employees WHERE department_id=20) "Marketing"
     ,(SELECT COUNT(*) FROM employees WHERE department_id=30) "Purchasing"
     ,(SELECT COUNT(*) FROM employees WHERE department_id=40) "Home Resource"
     ,(SELECT COUNT(*) FROM employees WHERE department_id=50) "Shipping"
     ,(SELECT COUNT(*) FROM employees WHERE department_id IN (10,20,30,40,50)) "Total"
FROM dual;
	
	
SELECT e.employee_id ,e.first_name, e.hire_date, e.salary,e.department_id,d.department_id
  FROM employees e,departments d 
 WHERE  e.department_id=d.department_id;


SELECT e.employee_id 
       ,e.first_name 
       ,e.hire_date
       ,e.salary
       ,e.department_id
       ,(SELECT d.department_name FROM departments d WHERE d.department_id=e.department_id) department_name
  FROM employees e;

--FAQ:

   SELECT * FROM sign_tb;
   
    SELECT sign(id),SUM(id)
       FROM sign_tb
    GROUP BY sign(id);


SELECT(SELECT SUM(id) FROM sign_tb WHERE sign(id)=1) Positive
         ,(SELECT SUM(id) FROM sign_tb WHERE sign(id)=1) Negative
  FROM dual;

--Inline view 

   Named sub query in FROM CLAUSE | Intern edge Result set

--Display the department which contain maximum no. of employees

SELECT X.*
   FROM(SELECT department_id,COUNT(*) dept FROM employees
          WHERE department_id is NOT NULL
         GROUP BY department_id) X
        ,(SELECT MAX(COUNT(*)) dment FROM employees
          WHERE department_id IS NOT NULL
         GROUP BY department_id) Y 
WHERE X.dept=Y.dment;

--Display the department which is allowed / allocated with more salary

SELECT X.*
  FROM(SELECT department_id ,SUM(salary)dsum FROM employees 
         WHERE department_id IS NOT NULL
  GROUP BY department_id) X
  ,(SELECT MAX(SUM(salary))dmsum
  FROM employees 
 WHERE department_id IS NOT NULL
  GROUP BY department_id) Y
  WHERE X.dsum=Y.dmsum;

--Display all the manager with team size

SELECT X.*
   FROM(SELECT manager_id,COUNT(*) repent FROM employees
     GROUP BY manager_id) X
   ,(SELECT MAX(COUNT(*)) mrepent FROM employees	
       GROUP BY manager_id) Y
WHERE X.repent=Y.mrepent;

--sub query in HAVING CLAUSE

SELECT department_id,ROUND(AVG(salary)) avg_sal
   FROM employees
 WHERE department_id IS NOT NULL
 GROUP BY department_id
 HAVING ROUND(AVG(salary))>(SELECT salary FROM employees WHERE first_name='neena');	
 
 
--Write a query to get the year which maximum number of employees hired
--same question with data from 1980-2005
--Meeting details for entire month
SELECT y.dt,x.m_date
FROM(SELECT m_date , description FROM meeting_tb)x
   ,(SELECT TO_DATE(SYSDATE-10) + LEVEL dt FROM dual CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(SYSDATE),'DD'))y
WHERE x.m_date(+)=y.dt
ORDER BY 1;


SELECT y.dt,x.m_date
FROM(SELECT m_date , description FROM meeting_tb)x
   ,(SELECT TRUNC(SYSDATE,'MM')-1 + LEVEL dt FROM dual CONNECT BY LEVEL <= EXTRACT (DAY FROM LAST_DAY(SYSDATE)))y
WHERE x.m_date(+)=y.dt
ORDER BY 1;


 
--Correlated sub query 
        outer query will executed FIRST    
		for each row there will be different input from outer query 
		we can't execute the inner query alone'
		
--Non Correlated sub query

--Who are all getting more than average salary

SELECT e.employee_id ,e.first_name ,e.hire_date ,e.salary ,e.department_id
    FROM employees e 
  WHERE e.salary > (SELECT AVG(salary) FROM employees);

--Who are all getting more than avg salary of department 90

SELECT e.employee_id ,e.first_name ,e.hire_date ,e.salary ,e.department_id
    FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id=90);

CORREALTED:

--Who are all getting salary more than average salary of their department

SELECT e.employee_id ,e.first_name ,e.hire_date ,e.salary ,e.department_id
    FROM employees e
 WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id=e.department_id);


--Who are all getting more than their manager salary 

SELECT e.employee_id ,e.first_name ,e.hire_date ,e.salary ,e.department_id
    FROM employees e
WHERE e.salary > (SELECT salary FROM employees e2 WHERE e2.employee_id=e.manager_id);

--Who are all hired before their Manager

SELECT e.employee_id ,e.first_name ,e.hira_date ,e.salary ,e.department_id,e.manager_id
    FROM employees e	
 WHERE e.hired_date < (SELECT e2.hired_date FROM employees e2 WHERE e2.employee_id=e.manager_id);
 
--Multiple Column sub query 

SELECT e.employee_id ,e.first_name ,e.hire_date ,e.salary ,e.department_id ,e.anager_id
    FROM employees e
	WHERE e.manager_id=(SELECT manager_id FROM employees WHERE first_name='Neena')
	AND e.department_id =(SELECT department_id FROM employees WHERE first_name='Neena')
 AND first_name<>'Neena';
 
SELECT e.employee_id ,e.first_name ,e.hira_date ,e.salary ,e.department_id ,e.manager_id
    FROM employees e
  WHERE (e.manager_id,e.department_id)=(SELECT manager_id,department_id FROM employee WHERE first_name='Neena')
 AND first_name<>'Neena';  

--IN and EXISTS
SELECT e.employee_id ,e.first_name ,e.hira_date ,e.salary ,e.department_id,e.manager_id
    FROM employees e 
 WHERE e.first_name IN (SELECT first_name FROM employees WHERE department_id=60);
 
--If we have any employee working for department 90,I want to dispaly all the employees 

SELECT e.employee_id ,e.first_name ,e.hira_date ,e.salary ,e.department_id ,e.manager_id
    FROM employees e 
  WHERE EXISTS (SELECT * FROM employees WHERE department_id = 90);
  
SELECT e.employee_id ,e.first_name ,e.hira_date ,e.salary ,e.department_id ,e.manager_id
    FROM employees e  
  WHERE NOT EXISTS (SELECT * FROM employees WHERE department_id=270);

--Performance

IN < EXISTS > NOT EXISTS 

--Display all the departments which contain employees 

SELECT d.department_id ,d.department_name 
  FROM departments d 
WHERE EXISTS (SELECT 3 FROM employees e WHERE e.department_id=d.department_id);

SELECT d.department_id,d.department_name 
 FROM departments d 
WHERE NOT EXISTS (SELECT 3 FROM employees e WHERE e.department_id = d.department_id); 
		 
    	 
      