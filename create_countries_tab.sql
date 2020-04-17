REM ********************************************************************
REM Create the COUNTRIES table to hold country information for customers
REM and company locations. 
REM OE.CUSTOMERS table and HR.LOCATIONS have a foreign key to this table.
       
CREATE TABLE countries 
   ( country_id CHAR(2) 
   CONSTRAINT country_id_nn NOT NULL 
   , country_name VARCHAR2(40) 
   , region_id NUMBER 
   , CONSTRAINT country_c_id_pk 
   PRIMARY KEY (country_id) 
   ) 
   ORGANIZATION INDEX;
   
ALTER TABLE countries
         ADD ( CONSTRAINT countr_reg_fk
   FOREIGN KEY (region_id)
   REFERENCES regions(region_id) 
   ) ;