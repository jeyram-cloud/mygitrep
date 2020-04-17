REM ********************************************************************
REM Create the JOBS table to hold the different names of job roles within the company.
REM HR.EMPLOYEES has a foreign key to this table.
       
CREATE TABLE jobs
   ( job_id VARCHAR2(10)
   , job_title VARCHAR2(35)
   CONSTRAINT job_title_nn NOT NULL
   , min_salary NUMBER(6)
   , max_salary NUMBER(6)
   ) ;
   
CREATE UNIQUE INDEX job_id_pk 
         ON jobs (job_id) ;
		 
ALTER TABLE jobs
         ADD ( CONSTRAINT job_id_pk
   PRIMARY KEY(job_id)
   ) ;