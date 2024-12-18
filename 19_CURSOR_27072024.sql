--CURSOR

CURSOR--> Static And Dynamic CURSOR

   It is a sql private work area where the query get passed and executed.
   
   We can process more than one record.


Cursor Types:
------------
   Implicit Cursor 
   Explicit Cursor
 
Cursor Attributes :
------------------
   FOUND
   NOTFOUND
   ISOPEN
   ROWCOUNT
   
----------------------------------------------------------------
        Implicit                           Explicit
----------------------------------------------------------------

->If your query returns         ->If your query return more than
Exactly one row/DML                     one row

->No need to Declare It         ->We need to name and Declare it.
(PL/SQL engine)

->Name of implicit Cursor 
    (SQL)
----------------------------------------------------------------


LOOP
FOR LOOP  ->cursor FOR LOOP 
FOR UPDATE OF 
WHERE CURRENT OF 
NO WAIT 


Explicit Cursor 

DECLARE  
v_employee_id    NUMBER;
v_first_name     VARCHAR2(30);
v_hire_date      DATE;
v_salary         NUMBER;
v_department_id  NUMBER;

CURSOR emp_c
IS 
SELECT employee_id,first_name,hire_date,salary,department_id 
    FROM employees
  WHERE department_id=90;
  
  v_count NUMBER:=0;
  v_alldata emp_c%ROWTYPE;

BEGIN 

  dbms_output.put_line('*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*');
  
  OPEN emp_c;
  
  LOOP 
  FETCH emp_c INTO v_employee_id,v_first_name,v_hire_date,v_salary,v_department_id;
  EXIT WHEN emp_c%NOTFOUND;
   
   dbms_output.put_line('**'||emp_c%ROWCOUNT);
   dbms_output.put_line('Employee_id :'||v_employee_id);
   dbms_output.put_line('First_Name  :'||v_first_name);
   dbms_output.put_line('Hire_Date   :'||v_hire_date);
   dbms_output.put_line('salary      :'||v_salary);
   dbms_output.put_line('Dept_id     :'||v_department_id);
   v_count:=v_count+1;
   --EXIT WHEN emp_c%FOUND;
   END LOOP;
   
   CLOSE emp_c;
   
   dbms_output.put_line('Total no. of rows'||emp_c%ROWCOUNT);
   
   IF emp_c%ISOPEN THEN
     CLOSE emp_c;
	 dbms_output.put_line('Cursor Closed');
   ELSE 
	 dbms_output.put_line('Cursor Already Closed');
   
   END IF;

END;
/


--CURSOR FOR LOOP

DECLARE 

  CURSOR emp_c
  IS 
  SELECT employee_id,first_name,salary,department_id
    FROM employees 
WHERE department_id=90;

BEGIN
  FOR i IN emp_c 
  LOOP
   dbms_output.put_line('Employee_id :'||v_employee_id);
   dbms_output.put_line('First_Name  :'||v_first_name);
   dbms_output.put_line('Hire_Date   :'||v_hire_date);
   dbms_output.put_line('salary      :'||v_salary);
   dbms_output.put_line('Dept_id     :'||v_department_id);
   END LOOP;
   FOR j IN(SELECT department_id,department_name FROM deaprtments WHERE department_id IN(10,20,30,40,50))
   LOOP
   dbms_output.put_line(j,department_id||'-'||j.deaprtment_name);
   END LOOP;
END;
/



--IMPLICIT CURSOR 


   