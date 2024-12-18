--CLAUSE

TABLES
    user table
	    create and maintained by User.
		contain User information.
		
SELECT * FROM employees;
SELECT * FROM department;
SELECT * FROM locations;
  
    DATA Dictionary TABLES
        created and maintained by DATABASE
        contains database information		

SELECT * FROM user_tables;
SELECT * FROM all_objects;   (owner | object_name  | object_type | status)
SELECT * FROM employees;

SELECT employee_id,first_name,hire_date,salary,department_id FROM employees;

SELECT owner, object_name ,object_type ,status FROM all_objects;



-- + - * \

SELECT employee_id ,first_name ,department_id ,salary ,12*salary FROM employees;


SALARY      1000    12*SALARY         12000
                    12*SALARY+100     12100       --13200
					12*(SSALARY+100)  13200
					(12*SALARY)+100   12100
			
					

--ALIAS (AS)

    used to rename column heading
	
    column_name/Expression AS "ALIAS NAME"
	
    mostly used with Expression	
	
SELECT employee_id ,first_name ,hire_date ,salary ,12*salary AS "ANN_INCOME" FROM employees;
	
SELECT employee_id ,first_name ,hire_date ,salary ,12*salary    "ANN_INCOME" FROM employees;
	
SELECT employee_id ,first_name ,hire_date ,salary ,12*salary     ANN_INCOME  FROM employees;
	
SELECT employee_id ,first_name ,hire_date ,salary ,12*salary    "ANN INCOME" FROM employees;
	
SELECT employee_id ,first_name ,hire_date ,salary ,12*salary    "ann_income" FROM employees;



-- || (concordination)

SELECT first_name||''|| salary FROM employees;

SELECT first_name||'salary is'|| salary"salary Details" FROM employees;

steven's salary is 24000

-- 10 g q'[    ]'


SELECT first_name || ''s salary is '|| salary "salary Details" FROM employees;

SELECT first_name || q'['s salary is]'|| salary "salary Details" FROM employees;

SELECT first_name || '''s salary is '|| salary "salary Details" FROM employees;

SELECT 'X'|| first_name|| ''s salary is '|| salary|| 'X' "salary Details" FROM employees;

SELECT ''''|| first_name|| ''s salary is '|| salary|| '''' "salary Details" FROM employees;


--STANDARDS

      YOU CAN TYPE QUERIES IN MULTIPLE LINES
	 
	 
SELECT employees_id ,first_name ,hire_date FROM  employees;
SELECT employees_id ,first_name ,hire_date ,salary ,department_id FROM  employees;

SELECT 
    employee_id
	,first_name
	,hire_date
	,salary
	,department_id
  FROM 
    employees;


       --Nothing is case sensitive in ORACLE except data (Steven|STEVEN|steven)
       --Date is formate sensitive | Default format : DD-MON-YY
       ; is optional in isqlplus | Mandator in Sqlplus Always end with;
       Keyword and clauses--upper case


--NULL 
     
    Unknown value | Unavailable value | Unassigned value | Absence of value

      NULL<>0
      NULL<> space	  
	  NULL<> special character(-)
	  NULL<> NULL
	  NULL+100= NULL                                  --NULL itself equal to NULL
	  
	  12*salary+100-90*1-78+90+NULL=NULL
	  
	  
-- DISTINCT/UNIQUE

SELECT distinct department_id FROM employees;

SELECT unique job_id FROM employees;

SELECT distinct department_id  ,job_id FROM employees order by 1,2,3 ASC;
	  
SELECT distinct c1,c2,c3 FROM table_name;

1 1 1
1 1 2
1 2 2
2 2 2
2 1 1
2 2 1


--DESC[RIBE]

  describe employees;
  DESC departments;


--SINGLE LINE COMMENT  


/*
MULTIPLE
LINE
COMMENT
*/

--To give information
--To disable particular LINE
--important code_backup



--DUAL TABLE 

     Dummy table in ORACLE
	 you can process your own data 
	 one row with multiple columns 
	 owner : SYS
	 datatype : VARCHAR2 
	 Default column name : Dummy
	 Default data :X 
	 
	      --is it possible to drop this table? =NO 
		  
		  
SELECT 'NAVEETHAHMAD' "NAME" ,45000 salary
SELECT 12*(1000+100) FROM dual;


--23 c version | Dual X = NO

SELECT 12*10000;		  
		  
  
  
  --It's a right time to learn
  
SELECT ''''||'It''s a right time to learn'||'''' FROM dual;    

	  
