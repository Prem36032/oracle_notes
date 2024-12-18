                                        PLSQL

  It is a procedural language which is extension to sql with design feature of programming language.
  
  Here, we are going to group set of sql and plsql statement into single unit of quote/block and sent to the server for execution in single call.
 
  It will reduce network traffic.
  
  
 --BLOCK STRUCTURE
 --ANONYMOUS BLOCK    -->Procedure|Function|Package|Trigger.
 
 DECLARE     --Optional
 
   --Varial
   --CURSOR
   --Execption
   --Subprogram
BEGIN        --Mandatory

  --SQL and PLSQL Statement 
  --Application/Bussiness Logics
EXCEPTION    --Optional

  --Error Handling
END;         --Mandatory
/

--Anonymous block

  Unnamed block
  Not stored in the DATABASE
  One time only Procedure 
  
BEGIN  
   NULL;
END;
/

BEGIN 
  dbms_output.put_line('Welcome to plsql session..');
END;
/

--sqlplus
SET SERVEROUT ON

Variable 

  it is used to hold some value | Allocated memory to hold the data .
  
  1-30 character length 
  
  per line we can declare only one variable 
  
  Assignment operator (:=) v_a:=10.
  
Types

  Scalar
  Composite 
  Reference 
  Large- object 
  
DECLARE 
  v_a NUMBER:=10;
  v_b NUMBER:=20;
  v_c NUMBER;
BEGIN
  v_c:=v_a+v_b;
  dbms_output.put_line(v_a||'+'||v_b||'='||v_c);
END;
/


DECLARE 
  v_a NUMBER:=10;
  v_name VARCHAR2(30):=INITCAP('rahul');
  v_joining DATE:=SYSDATE;
  V_DOB DATE:=TO_DATE('25-03-1999','DD-MM-YYYY');
BEGIN 
  dbms_output.put_line('v_a               :'||v_a);
  dbms_output.put_line('Name              :'||v_name);
  dbms_output.put_line('v_joining Date    :'||v_joining);
  dbms_output.put_line('DOB               :'||v_dob);
END;
/



<<ot>>
DECLARE 
  v_a NUMBER:=10;
  v_d NUMBER:=3000;
BEGIN 
  <<ib>>
  DECLARE 
    v_a NUMBER:=20;
	v_c NUMBER:=30;
  BEGIN 
    dbms_output.put_line(v_a);
    dbms_output.put_line(ot.v_a);
    dbms_output.put_line(v_d);
    dbms_output.put_line(v_c);
  END;
  dbms_output.put_line(v_a);
  --dbms_output.put_line(ib.v_c);
END;
/


DECLARE 
  v_a NUMBER:=10;
  v_b VARCHAR2(30):=' ';
  v_c NUMBER;
BEGIN 
  v_a:=20;
  dbms_output.put_line(v_a);
  dbms_output.put_line('1: '||NVL(v_b,0));
  dbms_output.put_line('2: '||NVL(v_c,0));
END;
/

--PLS-00428:AN INTO CLAUSE IS EXPECTED IN THIS SELECTED STATEMENT.

DECLARE 
  v_max_sal NUMBER;
BEGIN 
  SELECT MAX(salary)
   INTO v_max_sal
  FROM employees;
  dbms_output.put_line('Maximum salary :'||v_max_sal);
END;
/

DECLARE 
  v_employee_id   NUMBER;
  v_first_name    VARCHAR2(30);
  v_hire_date     DATE;
  v_salary        NUMBER;
  v_department_id NUMBER;
BEGIN 
  SELECT employee_id,first_name,hire_date,salary,department_id
   INTO v_employee_id,v_first_name,v_hire_date,v_salary,v_department_id
   FROM employees
  WHERE employee_id=100;
  --WHERE department_id=90;
  dbms_output.put_line('Employee Id :'||v_employee_id);
  dbms_output.put_line('Name        :'||v_first_name);
  dbms_output.put_line('Joining     :'||v_hire_date); 
  dbms_output.put_line('Salary      :'||v_salary);
  dbms_output.put_line('Department  :'||v_department_id);
END;
/

ERROR at line 1;
ORA-01422:exact fetch returns more than requested number of rows 
ORA-06501-pl/sql numeric or value error:character string buffer too small


DECLARE 
  v_department_id NUMBER:=10;
  v_department_name           departments.department_name%TYPE;
BEGIN 
  SELECT department_name 
    INTO v_department_name 
  FROM departments 
  WHERE department_id=v_department_id
  dbms_output.put_line('Department Name :'||v_department_name);
END;
/


DECLARE 
  v_employee_id     employees.employee_id%TYPE;
  v_first_name      employees.first_name%TYPE;
  v_hire_date       employees.hire_date%TYPE;
  v_salary          employees.Salary%TYPE;
  v_department_id   employees.department_id%TYPE;
BEGIN
  SELECT employee_id,first_name,hire_date,salary,department_id
   INTO v_employee_id,v_first_name,v_hire_date,v_salary,v_department_id
  FROM employees;
  dbms_output.put_line('Employee Id :'||v_employee_id);
  dbms_output.put_line('Name        :'||v_first_name);
  dbms_output.put_line('Joining     :'||v_hire_date); 
  dbms_output.put_line('Salary      :'||v_salary);
  dbms_output.put_line('Department  :'||v_department_id);
END;
/

DECLARE 
  v_all_details employees%ROWTYPE;
BEGIN 
  SELECT *
   INTO v_all_details 
  FROM employees
  WHERE employee_id=100;
  dbms_output.put_line('Employee Id :'||v_all_details.employee_id);
  dbms_output.put_line('Name        :'||v_all_details.first_name);
  dbms_output.put_line('Joining     :'||v_all_details.hire_date);
  dbms_output.put_line('Salary      :'||v_all_details.salary);
END;
/

--Difference Between%TYPE and %ROWTYPE

CREATE TABLE test_insert(id NUMBER PRIMARY KEY)
BEGIN
  INSERT INTO test_insert VALUES(1);
  INSERT INTO test_insert VALUES(2);
  INSERT INTO test_insert VALUES(3);
  INSERT INTO test_insert VALUES(4);
  INSERT INTO test_insert VALUES(5);
  COMMIT;
END;
/

BEGIN
  --implicit savepoint 
  INSERT INTO test_insert VALUES(1);
  INSERT INTO test_insert VALUES(2);
  INSERT INTO test_insert VALUES(3);
  INSERT INTO test_insert VALUES(3);
  INSERT INTO test_insert VALUES(5);
  COMMIT;
END;
/
  
  
  
  
  
  
  
  
  
  
  
  
        
  
    
  
  
   
  