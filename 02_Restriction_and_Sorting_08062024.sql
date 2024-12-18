--Where clause

Where department_id=90;
Where first_name   ='steven';  --Data is case sensitive
Where hire_date    ='17-jun-87'; --date is formate sensitive

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees WHERE department_id=60;

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees WHERE first_name='Steven';

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees WHERE hire_date='17-jun-8';


--ORACLE OPERATOR


      [NOT] IN 
	  [NOT] BETWEEN..AND..
	  [NOT] LIKE
	  IS  [NOT] NULL


--[NOT] IN


SELECT employee_id,first_name,hire_date,salary,department_id FROM employees WHERE department_id IN(10,60,90);

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees WHERE first_name IN('Steven','David','Leena','Lax');

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees WHERE hire_date IN('13-jan-93','17-jun-87');

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees WHERE department_id NOT IN(10,60,90);


--!--Where department_id IN(10,60,90,NULL);

--!--Where first_name IN('Steven','Neena','Naveeth');


--BETWEEN..AND..


SELECT employee_id,first_name,hire_date,salary,department_id FROM employees WHERE salary BETWEEN 6000 AND 7000;

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees WHERE BETWEEN '01-JAN-94' AND '31-DEC-94';

--Where  grd between 'F' and 'J'

--Where standard between 'VI' and 'X';


SELECT employees_id,first_name,hire_date,salary,department_id FROM employees WHERE salary NOT BETWEEN 6000 AND 7000;

   
--LIKE

    Pettern matching/Wildcard search
	
	% - SOMETHING/NOTHING
	
    (-) - One character 
	
	Where first_name LIKE ' ';
	
	
SELECT first_name from employees WHERE first_name LIKE 's%';

SELECT first_name from employees WHERE first_name LIKE '%N';

SELECT first_name from employees WHERE first_name LIKE '%man%';

SELECT first_name from employees WHERE first_name LIKE 'S%n';

SELECT first_name from employees WHERE first_name LIKE 'Steven%';

SELECT first_name from employees WHERE first_name LIKE '_t%';

SELECT first_name from employees WHERE first_name LIKE '_____n';

SELECT first_name from employees WHERE first_name LIKE '_t_v%';

SELECT first_name from employees WHERE first_name LIKE '______';


--REAL TIME USAGE

SELECT * FROM user_tables WHERE table_name LIKE 'RBI%LOOKUP%';

CREATE TABLE student_details_tb(email_id VARCHAR2(30));

INSERT INTO students details_tb  values ('naveethahmad@gmail.com');

SELECT email_id FROM Student_details_tb WHERE email_id LIKE 'ram%';

SELECT email_id FROM Student_details_tb WHERE email_id LIKE '%cse%';

SELECT email_id FROM Student_details_tb WHERE email_id LIKE '%gmail%';

SELECT email_id FROM Student_details_tb WHERE email_id LIKE '___k%';

SELECT email_id FROM Student_details_tb WHERE email_id NOT LIKE '%gmail%';

SELECT email_id FROM Student_details_tb WHERE email_id LIKE '__k__a%';

SELECT email_id FROM Student_details_tb WHERE email_id LIKE '___/__%' Escape '/';

SELECT email_id FROM Student_details_tb WHERE email_id LIKE '___$__%' Escape '$';

CREATE table pct_tb VALUES('saravanan','89');

CREATE table pct_tb VALUES ('Kumar','90');

SELECT * FROM pct_tb;

SELECT * FROM pct_tb WHERE pct_tb LIKE '%/%' Escape'/';



-- IS [NOT] NULL

      Where commision_pct=NULL;
	  Where commision_pct=' ';
	  Where commision_pct='';
	  Where commision_pct='NULL';
	  
	  
SELECT employee_id,first_name,hire_date,salary,commission_pct FROM employees WHERE commission_pct is NULL;

SELECT employee_id,first_name,hire_date,salary,commission_pct FROM employees WHERE commission_pct is  NOT NULL;



---Try the same with manager_id/department_id

--Wrong--Where department_id=90 or 60

SELECT employee_id,first_name,hire_date,salary,commission_pct FROM employees WHERE department_id=90 or department_id=60;

SELECT employee_id,first_name,hire_date,salary,commission_pct FROM employees WHERE first_name='Steven' or department_id=50;

SELECT employee_id,first_name,hire_date,salary,commission_pct FROM employees WHERE first_name='Steven' AND department_id=50;

SELECT employee_id,first_name,hire_date,salary,commission_pct FROM employees WHERE first_name='steven' AND (department_id=90 or department_id=50);


--Where (stand='V' or stand='VI')AND(sec='C' OR sec='D');


ORDER BY(always comes at last)

    ASC(Default)
	DESC
	
	
SELECT employee_id,first_name,hire_date,salary,commission_pct FROM employees ORDER BY first_name ASC;

SELECT employee_id,first_name,hire_date,salary,commission_pct FROM employees ORDER BY first_name DESC;

SELECT employee_id,first_name,hire_date,salary,commission_pct FROM employees  ORDER BY first_name;

SELECT employee_id,first_name,hire_date,salary,commission_pct FROM employees ORDER BY sal ASC;

SELECT employee_id,first_name,hire_date,salary,commission_pct FROM employees ORDER BY 4 DESC;


--COMPOSITE SORTING

	
SELECT employee_id,first_name,hire_date,department_id,salary FROM employees ORDER BY department_id ASC,salary ASC;

SELECT employee_id,first_name,hire_date,department_id,salary FROM employees ORDER BY 4 ASC,5 ASC;
	  


