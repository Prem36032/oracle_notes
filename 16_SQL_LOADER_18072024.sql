
--SQLLDR

     --We can load data from flat file (.csv) to table.
	 

CREATE TABLE text_department
AS 
SELECT department_id,department_name
  FROM departments
 WHERE 1=2;
 
   CSV->control.ctl->Table 
   
   
"control.ctl"

load data 
INFILE 'D:/Reports/report.csv'
INTO TABLE test department 
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
(department_id,department_name)

c:>sqlldr hr/admin@xE control=D:\Reports\control.ct1 log=D:\Reports/mylog.log

c:>sqlldr hr@xE/admin control=D:\Reports\control.ct1 log=D:\Reports/mylog.logt

--INDEX (_ind):

         one of the performance tuning method
		 
		 it is a schema OBJECT
		 
		 user_indexes|(uniqueness)| user_ind_column
		 
TYPES OF INDEX

         UNIQUE INDEX      --PK/UK
		 NON UNIQUE INDEX
		   B-Tree index (Default)
		   Bitmap Index
		   Function based index
		   
--B-Tree Index (DEFAULT) | Tree Like STRUCTURE

        Default index
        Mostly created on high cardinality COLUMNS

CREATE INDEX my_ind
ON employees(first_name)

--Bitmap
    --Low cardinality column (gender)
                                          M   F     
       Suresh M                   Suresh  1   0      
       Rahul  M                   Rahul   1   0          
       Jeni	  F                   Jeni	  0   1
       Neena  F                   Neena   0   1
	   Madhan M                   Madhan  1   0
	   
	   
CREATE BITMAP INDEX my_ind
ON employees(gender);

--Function Based index

SELECT * FROM employees
WHERE UPPER (first_name)='steven';

--Reverse index

        1-10   11-20   21-30   31-40   	   
         19                      38

CREATE INDEX ind_name ON MARK(English)REVERSE;

CREATE INDEX index_name ON Table_name(column_name);

CREATE BITMAP index_name ON Table_name(column_name);
	 
CREATE index_name ON Table_name(UPPER(col_name));

CREATE index_name ON Table_name(column_name)REVERSE;

SELECT * FROM user_indexes WHERE table_name='TEST_EMP';

          when to use?                when not to use?

      if the cloumn id mostiy        Not much used in 
      used in where clause             where clause

      volume of table is high	           low

      less DML operation              DML operation
	  
	  <4%   <10%  storage              >4%     >10%
	  
DROP INDEX index_name;

--HINTS
        we can provide instruction to the OPTIMIZER
		
SELECT /*+INDEX_ASC*/employee_id,first_name,hire_date,salary
FROM employee
WHERE employee_id=90;

         INDEX_ASC
		 INDEX_DESC
		 Index
		 NO_INDEX
		 FIRST_ROWS(100)
		 PARALLEL
		 APPEND
		 NO_COPY