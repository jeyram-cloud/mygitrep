REM ********************************************************************
REM Create the DEPARTMENTS table to hold company department information.
REM HR.EMPLOYEES and HR.JOB_HISTORY have a foreign key to this table.
       
CREATE TABLE departments
   ( department_id NUMBER(4)
   , department_name VARCHAR2(30)
   CONSTRAINT dept_name_nn NOT NULL
   , manager_id NUMBER(6)
   , location_id NUMBER(4)
   ) ;
   
CREATE UNIQUE INDEX dept_id_pk
         ON departments (department_id) ;
		 
ALTER TABLE departments
         ADD ( CONSTRAINT dept_id_pk
   PRIMARY KEY (department_id)
   , CONSTRAINT dept_loc_fk
   FOREIGN KEY (location_id)
   REFERENCES locations (location_id)
   ) ;
   
Rem Useful for any subsequent addition of rows to departments table
Rem Starts with 280 

CREATE SEQUENCE departments_seq
   START WITH 280
   INCREMENT BY 10
   MAXVALUE 9990
   NOCACHE
   NOCYCLE;
   