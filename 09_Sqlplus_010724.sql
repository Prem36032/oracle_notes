SQLPLUS hr/admin@XE

SQL> CONNECT hr/admin@XE

clear screen | cl scr.

SET linesize 180
SET line     180

--MAX linesize : 2000

/ -> To execute the previous query.

SET PAGESIZE 40
SET PAGESIZE 0   | No Heading.

&  - Substitution variable | Allows you to get input from the user.
&& - Fixed variable

--Fixed variable | used to mention the part of the script.

SELECT employee_id, first_name, hire_date, salary, department_id
FROM employees
WHERE department_id = $did;

SET VERIFY OFF | ON

SELECT &column_name
FROM employees
WHERE department_id = &did

SQL> SELECT &a + &b  FROM dual;
SQL> SELECT &&a + &b FROM dual;

--How to copy the text from sqlplus and paste the text.

Copy  -> Select & Hit Enter.
Paste -> Right Click.

SQL > TTITLE dep_records
SQL > BTITLE eop

SQL > TTITLE OFF | ON
SQL > BTITLE OFF | ON

--Difference between TTITLE and BTITLE.

SET FEEDBACK  ON | OFF
SET TIMING ON | OFF
SET HEADING  ON | OFF

-- EDIT/ ED | Notepad -> Make changes -> Ctrl + S -> close -> /(Don't use ; in query).

-- 2 Important(SPOOL | To run the script).

--SPOOL

SQL> SPOOL D:\scripts\employee_data.txt

....

SPOOL ON | OFF

--How to run the script.

@"Path/Filename.sql"

--Explain plan.

SET AUTOTRACE ON | OFF
SET AUTOT     ON | OFF

SQL> SET AUTOTRACE TRACEONLY

--List | l

SQL> col first_name for a10
SQL> col salary for 99,999.99

DEFINE i= 100
DEFINE i= 10
DEFINE i

--EXPLORE : Explore BREAK command with SKIP option.

--EXTRA

Max length of table                           :120 bytes.
Max length of column name in the oracle table :120 bytes.
Max no. of cloumn in the oracle table         :1000

-- To view the Database Name / Service Name.

SELECT name FROM v$database;

-- To view version of the database.

SELECT banner FROM v$version;

XE => CITIDB
HR/ADMIN => ENHDB/ENHDB

Client Side Tool

   -> isql plus(firefox) 
   -> sqlplus
   -> SQl developer
   -> PLSQL developer
   -> Toad.































