REM ********************************************************************
REM Create the REGIONS table to hold region information for locations
REM HR.LOCATIONS table has a foreign key to this table.
       
CREATE TABLE regions
   ( region_id NUMBER 
   CONSTRAINT region_id_nn NOT NULL, 
    region_name VARCHAR2(25) 
   );
   
CREATE UNIQUE INDEX reg_id_pk
         ON regions (region_id);

ALTER TABLE regions
         ADD ( CONSTRAINT reg_id_pk
   PRIMARY KEY (region_id)
   ) ;