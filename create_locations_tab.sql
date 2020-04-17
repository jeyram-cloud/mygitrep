REM ********************************************************************
REM Create the LOCATIONS table to hold address information for company departments.
REM HR.DEPARTMENTS has a foreign key to this table.
       
CREATE TABLE locations
   ( location_id NUMBER(4)
   , street_address VARCHAR2(40)
   , postal_code VARCHAR2(12)
   , city VARCHAR2(30)
   CONSTRAINT loc_city_nn NOT NULL
   , state_province VARCHAR2(25)
   , country_id CHAR(2)
   ) ;
   
CREATE UNIQUE INDEX loc_id_pk
         ON locations (location_id) ;
		 
ALTER TABLE locations
         ADD ( CONSTRAINT loc_id_pk
   PRIMARY KEY (location_id)
   , CONSTRAINT loc_c_id_fk
   FOREIGN KEY (country_id)
   REFERENCES countries(country_id) 
   ) ;
   
Rem Useful for any subsequent addition of rows to locations table
Rem Starts with 3300

CREATE SEQUENCE locations_seq
   START WITH 3300
   INCREMENT BY 100
   MAXVALUE 9900
   NOCACHE
   NOCYCLE;
   