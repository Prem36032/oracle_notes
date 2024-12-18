

CREATE TABLE student_tb
(stud_id      NUMBER
,name         VARCHAR2(30)
,gender       CHAR
,email_id     VARCHAR2(30)
,dept_id      NUMBER
,CONSTRAINT  stu_id_pk2  PRIMARY KEY (stud_id)
,CONSTRAINT  stu_email_uk2 UNIQUE (email_id)
,CONSTRAINT  stu_did_fk  FOREIGN KEY (dept_id) REFERENCES departments (department_id)
,CONSTRAINT  stu_gen_ck  CHECK (gender IN ('M','F','m','f'))
);

ALTER TABLE student_tb
   MODIFY first_name VARCHAR2(30) NOT NULL
   
ALTER TABLE student_tb
   ADD CONSTRAINT stu_did_fk FOREIGN KEY (dept_id) REFERENCES departments (department_id) ON DELETE CASCADE

ALTER TABLE student_tb
   ADD CONSTRAINT stu_did_fk FOREIGN KEY (dept_id) REFERENCES departments (department_id) ON DELETE SET NULL
   
DELETE FROM departments WHERE department_id = 90

        the error msg will occur like = integrity contraint ( ) voilated-child record found

ALTER TABLE table_name
  DROP CONSTRAINT constraint_name
  
ALTER TABLE student_tb  
  DISABLE CONSTRAINT constraint_name
  
ALTER TABLE student_tb
   ENABLE CONSTRAINT constraint_name

SELECT * FROM dict WHERE table_name LIKE '%CONS_COLUMNS%';

SELECT  * FROM user_constraints WHERE table_name=UPPER('students_tb');

SELECT  * FROM user_cons_columns WHERE table_name=UPPER('students_tb');   


--join the table and get table_name,column_name and constraint_name.    