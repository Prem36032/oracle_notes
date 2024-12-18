--PREDEFINED EXCEPTION 

DECLARE
  v_data   VARCHAR2(30);
  V_number NUMBER(3):= 9000;
BEGIN
  --v_number := 9100;
  --SELECT 5/0 INTO v_data FROM dual;
  --SELECT first_name INTO v_data FROM employees WHERE employee_id =1;
  --SELECT first_name INTO v_data FROM employees WHERE department_id = 90;
  --INSERT INTO departments VALUES (10,'Admin',200,1900);
  
  dbms_output.put_line(v_data);
  dbms_output.put_line(v_number);
EXCEPTION 
  --INVALID CURSOR | CURSOR_ALREADY_OPENED | CASE_NOT_FOUND | ROWTYPE_MISMATCH
  WHEN zero_divide THEN
    dbms_output.put_line('divide Must not be zero');
  WHEN no_data_found THEN 
    dbms_output.put_line('Enter Valid Employee ID');
  WHEN too_many_rows THEN 
    dbms_output.put_line('Please Declare Cursor to Process More Than one row..');
  WHEN  dup_val_on_index THEN 
    dbms_output.put_line('Enter Some Other Id..');
  --WHEN value_error THEN 
    --dbms_output.put_line('Please check the data type or size of the Variable..');
  WHEN OTHER THEN 
    dbms_output.put_line('Some Other Error ~'|| SQLERRM||'~'||SQLCODE);
END;
/


--DATA VALIDATION 


DECLARE 
  --v_employee_id  NUMBER:=11;
  v_data           VARCHAR2(30);
BEGIN
   SELECT 1
     INTO v_data
	 FROM employees 
	WHERE employee_id=100
	  AND first_name='Steven King'
	  AND department_id = 90;
	  
    dbms_output.put_line('Valid Employee...');
	
EXCEPTION 
   WHEN no_data_found THEN
    dbms_output.put_line('Invalid Employee...');
END;
/

--USERDEFINED EXCEPTION 


DECLARE 
  v_gender  VARCHAR2(30) :='M';
  gender_ex EXCEPTION;
BEGIN 

  IF UPPER(v_gender) NOT IN ('M','F') THEN 
      RAISE gender_ex;
  END IF;

  dbms_output.put_line('Gender :'||v_gender);
EXCEPTION
  WHEN gender_ex THEN 
    dbms_output.put_line('Please Enter Valid Gender Information (M/F)');
END;
/



--APPLICATION ERROR  


DECLARE 
   v_gender  VARCHAR2(30) :='L';
BEGIN 
   IF UPPER(v_gender) NOT IN ('M','F') THEN 
       RAISE_APPLICATION_ERROR(-20005,'Not a Valid gender Info...');
   END IF;
   
    dbms_output.put_line('Gender :'|| v_gender);
END;
/


--PRAGMA EXCEPTION ERROR 

CREATE TABLE test_table(id NUMBER NOT NULL);

ERROR at line 1:
ORA-01400: cannot insert NULL into ("HR"."TEST_TABLE"."ID")

DECALRE 
   nn_ex  EXCEPTION;
   PRAGMA EXCEPTION_INIT(nn_ex,-1400);
BEGIN 
   INSERT INTO test_table VALUES(NULL);
EXCEPTION
   WHEN nn_ex THEN 
    dbms_output.put_line('Null Value Not Allowed...');
END;
/


--ERROR LOG TABLE  


CRAETE TABLE err_log_tb
(err_id    NUMBER
,module_nm VARCHAR2(30)
,pgm_nm    VARCHAR2(30)
,err_by    VARCHAR2(30)
,err_msg   VARCHAR2(30)
,err_cd    VARCHAR2(30)
,happ_dttm TIMESTAMP
);

...
EXCEPTION 
   WHEN OTHER THEN 
      v_err_msg := SQLERRM;
      v_err_cd  := SQLCODE;
      INSERT INTO err_log_tb(err_cd, module_nm, pgm_nm, err_msg, err_id, happ_dttm)
              VALUES(err_seq.NEXTVAL, 'CRM', 'SAL_UPDATE_SF', USER, v_err_msg, v_err_cd, SYSTIMESTAMP);
      COMMIT;
END;
/



--DBMS UTILITY 


dbms_output.put_line
	  
--it will give you the line number 
dbms_utility.format_error_stack
dbms_utility.format_error_backtrace

EXCEPTION 
   WHEN OTHERS THEN
      v_err_msg := 'Error ~' || dbms_utility.format_error_stack
                      ||'~'	 || dbms_utility.format_error_backtrace;
					  
			


--HANDLING EXCEPTION INSIDE THE LOOP
			


   SELECT department_name FROM departments;

BEGIN
  FOR i IN dep_c
  LOOP
     
	 IF SUBSTR (i.department_name,1,1)='P' THEN 
          RAISE abort_ex;
     END IF;
 
    dbms_output.put_line('Department Name :'|| i.department_name);
	
  END LOOP;
  
EXCEPTION
   WHEN abort_ex THEN
    dbms_output.put_line('Department Name Must Not Start With Character P');
END;
/



DECLARE 
   
   abort_ex EXCEPTION;
 
   CURSOR dep_c
   IS
   SELECT department_name FROM departments;
	
BEGIN 

  FOR i IN dep_c
  LOOP 
  
  BEGIN 
    IF SUBSTR(i.department_name,1,1) ='P' THEN 
	    RAISE abort_ex;
    END IF;

       dbms_output.put_line('Department Name :'|| i.department_name);
	EXCEPTION
	   WHEN abort_ex THEN 
           dbms_output.put_line('Department Name Must Not Start With Character P');
		   
	END;
	
	END LOOP;
	
END;
/
	       
   	
      
    
    
    