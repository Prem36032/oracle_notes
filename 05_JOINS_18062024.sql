--JOIN | SELECTING DATA FROM MULTIPLE TABLES

     Types of JOINS
	 
	 EQUI JOIN               -- Matched records
	 OUTER JOIN              --Matched+Unmatched records
	 RIGHT OUTER JOIN        -- Matched+Unmatched Right side TABLE
	 LEFT OUTER JOIN         -- Matched+Unmatched LEFT side TABLE
	 FULL OUTER JOIN         -- Matched+Unmatched FROM both TABLE
	 SELF JOIN
	 CROSS JOIN| CARTESIAN JOIN
	 NATURAL JOIN
	 
	 
	 Student_tb  s                Course_tb    c 
	 ------------------           ------------------------
	 s_name     C_id              C_id           C_name
	 ------------------           ------------------------
	 Name_01     20               10            JAVA
	 Name_02     40               20            Angular
	 Name_03     30               30            Oracle
	 Name_04     10               40            Bigdata
	 Name_05     60               50            Testing
	 ------------------           -------------------------
	 
	   EQUI JOIN                             OUTER JOIN
	                              ROJ                   LOJ                   FOJ
	 S.c_id=c.c_id           s.c_id(+)=c.c_id      s.c_id=c.c_id(+)      

    --------------------    -------------------    -------------------     ---------------------
	S_Name      c_Name      S_name    C_Name        S_Name     C_Name       S_Name      C_Name 
	--------------------    -------------------     -------------------    ---------------------
	Name_01    Angular      Name_01  Angular         Name_01  Angular       Name_01     Angular 
	Name_02    Bigdata      Name_02  Bigdata         Name_02  Bigdata       Name_02     Bigdata 
	Name_03    Oracle       Name_03  Oracle          Name_03  Oracle        Name_03     Oracle 
	Name_04    Java         Name_04  Java            Name_04  Java          Name_04     Java 
	                          -      Testing         Name_05    -           Name_05      -
                                                                              -         Testing 
	--------------------    --------------------    -------------------	    --------------------
	
	
--Equi JOIN | Matched records from TABLE


SELECT employees.employee_id
       ,employees.first_name
       ,employees.salary
       ,employees.department_id
       ,departments.department_name
    FROM employees ,departments  
WHERE employees.department_id=department.department_id;


SELECT e.employee_id
       ,e.first_name
       ,e.salary
       ,e.department_id
       ,d.department_name
    FROM employees e,departments d 
WHERE e.department_id=d.department_id;

	
	
--OUTER JOIN     -Matched + Unmatched records

Right outer join = Matched + Unmatched records FROM RIGHT side TABLE

--ALL Records FROM RIGHT side TABLE + Matched Records FROM LEFT side TABLE


SELECT e.employee_id
       ,e.first_name
       ,e.salary
       ,e.department_id
       ,d.department_name
    FROM employees e,department d 
WHERE e.department_id(+)=d.department_id;	

LEFT OUTER JOIN=Matched + Unmatched Records FROM LEFT side TABLE

--ALL Records FROM left side TABLE + Matched Records FROM RIGHT side TABLE

SELECT e.employee_id
       ,e.first_name
       ,e.salary
       ,e.department_id
       ,d.department_name
    FROM employees e,department d 
WHERE e.department_id=d.department_id(+);


--FULL OUTER JOIN = Matched + Unmatched records FROM both TABLE


     TBD
	 
	 
	 
--SELF JOIN


SELECT e.employee_id
       ,e.first_name
       ,e.salary
       ,e.department_id
	   ,e.hire_date
	   ,e.manager_id
	   ,m.first_name           manager_name
	   ,m.salary               manager_salary
	   ,m.hire_date            manager_hiredate
    FROM employees e,employees m 
WHERE e.manager_id=m.employee_id;


--Write a query to print all first_name with their manager_name (reporting manager)

SELECT e.employee_id
       ,e.first_name
       ,e.salary
       ,e.department_id
	   ,e.hire_date
	   ,e.manager_id
	   ,m.first_name           manager_name
	   ,m.salary               manager_salary
	   ,m.hire_date            manager_hiredate
    FROM employees e,employees m 
WHERE e.first_name=m.first_name;

--write a query to get all manager_name

SELECT UNIQUE  e.first_name  manager_name       
    FROM employees e JOIN employees m 
ON e.manager_id=m.employee_id;

--FAQ:Who are all getting salary more than their manager salary

SELECT e.employee_id
       ,e.first_name         
	   ,e.manager_id
	   ,m.salary               manager_salary
	   ,m.hire_date            manager_hiredate
    FROM employees e JOIN employees m 
ON e.manager_id=m.employee_id AND e.salary > m.salary;
    ...
	AND e.salary > m.salary ;
	
	
--ANOTHER METHOD 
     Where =>  ON
       ,   => key words

        [INNER]JOIN
        RIGHT[OUTER]JOIN
        LEFT[OUTER]JOIN
        FULL[OUTER]JOIN
        INNER JOIN
        CROSS JOIN
        NATURAL JOIN		
	
--FULL OUTER JOIN

SELECT e.employee_id
   
   ,e.first_name
	   ,e.hire_date
       ,e.salary
       ,e.department_id
	   ,d.department_id
       ,d.department_name
    FROM employees e FULL JOIN departments d 
ON e.department_id=d.department_id;


--HOW to get Unmatched records from both TABLES

<FULL OUTER JOIN>
MINUS
<EQUI JOIN>

SELECT e.employee_id
       ,e.first_name
       ,e.salary
       ,e.department_id
       ,d.department_name
    FROM employees e FULL JOIN departments d 
ON e.department_id=d.department_id 
MINUS
SELECT e.employee_id
       ,e.first_name
       ,e.salary
       ,e.department_id
       ,d.department_name
    FROM employees e JOIN departments d  
ON e.department_id=d.department_id;


--How to get Unmatched records from RIGHT side TABLE

SELECT e.*, d.*
  FROM employees e,departments d
WHERE e.department_id(+)=d.department_id
MINUS
SELECT  e.*, d.*
  FROM employees e,departments d
WHERE e.department_id=d.department_id;

--How to get Unmatched records from LEFT side TABLE

SELECT e.*, d.*
  FROM employees e,departments d
WHERE e.department_id=d.department_id(+)
MINUS
SELECT  e.*, d.*
  FROM employees e,departments d
WHERE e.department_id=d.department_id;


Cross join | CARTESIAN JOIN | CARTESIAN PRODUCT   (4 pts)

      Wrong JOIN
      
      if you ignore the join condition / if you provide any wrong condition

      we have to give valid conditions 

      Result: CARTESIAN PRODUCT 
               mXn
               all the rows in the first table will join with all the rows in the second table


SELECT e.*,d.*
    FROM employees e  CROSS JOIN departments d;

--2889


SELECT 107*27 from dual;


--How to select Data from 3 tables.

SELECT e.employee_id,e.first_name,d.department_name,d.location_id,l.street_address
    FROM employees e 
         ,department d 
         ,location  l 
 WHERE e.department_id=d.department_id
 AND d.location_id=l.location_id; 
 
 
SELECT e.employee_id,e.first_name,d.department_name,d.location_id,l.street_address
     FROM employees e JOIN departments d 
     ON e.depsrtment_id = d.department_id
     JOIN location l ON d.location_id = l.location_id;


--No. of conditions required	 

	
	2    = 1
	3    = 2
	100  = 99
	n    = n-1
	
	
--Performance 


      Execution flow | Execution Direction  L -> R

      less no of  records on LEFT side | more no. of records on RIGHT side.

     WHERE e.department_id = d.department_id;	  
     WHERE d.department_id = e.department_id;	  
	 
	 NATURAL JOIN
	 USING CLAUSE
	 NON INNER JOIN 
	 FAQs  BASED ON NULL
	 
Equi join =	Natural join (yes)

SELECT e.first_name, e.hire_date, e.department_id,d.department_name 
  FROM employees e, department d 
 WHERE e.department_id = d.department_id;

--SELECT e.first_name, e.hire_date,department_id, d.department_name
--  FROM employees e NATURAL JOIN department d;

SELECT d.department_name, location_id, l.street_address
  FROM departments d NATURAL JOIN location l;

SELECT e.first_name, e.hire_date, department_id, d.department_name  
  FROM employees e NATURAL JOIN departments d 
USING (department_id);


--Non inner JOIN

      Offer_tb  oft

      l_list    u_list    Offer_pct
     -------------------------------	  
	    1       10000        10
      10001     50000        20
	  50001     2000000      30
	  
	  Order_tb  odt
	  
	  Order_id   total_amt
	  ---------------------
	  ODR981     60000
	  ODR982     20000
	  ODR983       800
	  ODR984     19800
	  ODR985     15000
	  ODR986      1600
	
	SELECT odt.order_id,odt.total_amt,
	   FROM offer_tb oft, order_tb odt
	  WHERE odt.total_amt BETWEEN oft.l._list AND oft.u_list;

--Table creation and data creation
CREATE TABLE t1(c1 NUMBER);
CREATE TABLE t1(c2 NUMBER);	


INSERT INTO t1 VALUES(1); 
INSERT INTO t1 VALUES(NULL);	  
INSERT INTO t2 VALUES(1);	
INSERT INTO t2 VALUES(NULL);

TRUNCATE TABLE t1;
TRUNCATE TABLE t2;	
	
	
SELECT *FROM t1;
SELECT *FROM t2;
	
	
	
	 
--Practice with natural join:


SELECT e.employee_id
       ,e.first_name
       ,e.hire_date
       ,e.salary
       ,d.department_id
       ,d.department_name
       ,location_id
       ,l.street_address
    FROM employees e FULL JOIN departments d NATURAL JOIN locations l
ON e.department_id=d.department_id;

with the FULL OUTER JOIN.


SELECT e.employee_id
       ,e.first_name
       ,e.hire_date
       ,e.salary
       ,d.department_id
       ,d.department_name
       ,location_id
       ,l.street_address
    FROM employees e JOIN departments d NATURAL JOIN locations l
ON e.department_id=d.department_id;


with the Equi join.

SELECT e.employee_id
       ,e.first_name
       ,e.hire_date
       ,e.salary
       ,d.department_id
       ,d.department_name
       ,location_id
       ,l.street_address
    FROM employees e RIGHT JOIN departments d NATURAL JOIN locations l
ON e.department_id=d.department_id;


with the RIGHT OUTER JOIN.


SELECT e.employee_id
       ,e.first_name
       ,e.hire_date
       ,e.salary
       ,d.department_id
       ,d.department_name
       ,location_id
       ,l.street_address
    FROM employees e LEFT JOIN departments d NATURAL JOIN locations l
ON e.department_id=d.department_id;

with the LEFT OUTER JOIN.



SELECT e.employee_id
       ,e.first_name
       ,e.hire_date
       ,e.salary
       ,m.department_id
       ,m.last_name
    FROM employees e , employees m 
WHERE e.employee_id=m.department_id;

with the SELF JOIN.


SELECT employee_id
       ,e.first_name
       ,e.hire_date
       ,e.salary
       ,m.first_name   
       ,manager_id    
       ,department_id
    FROM departments d NATURAL JOIN employees m INNER JOIN employees e 
USING (manager_id);

with inner join(self join).