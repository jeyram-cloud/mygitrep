REM **************************************************************************
REM procedure to add a row to the JOB_HISTORY table and row trigger 
REM to call the procedure when data is updated in the job_id or 
REM department_id columns in the EMPLOYEES table:

CREATE OR REPLACE PROCEDURE add_job_history
   ( p_emp_id job_history.employee_id%type
   , p_start_date job_history.start_date%type
   , p_end_date job_history.end_date%type
   , p_job_id job_history.job_id%type
   , p_department_id job_history.department_id%type 
   )
   IS
   BEGIN
   INSERT INTO job_history (employee_id, start_date, end_date, 
   job_id, department_id)
   VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
   END add_job_history;
   /
   
CREATE OR REPLACE TRIGGER update_job_history
   AFTER UPDATE OF job_id, department_id ON employees
   FOR EACH ROW
   BEGIN
   add_job_history(:old.employee_id, :old.hire_date, sysdate, 
   :old.job_id, :old.department_id);
   END;
   /
   
COMMIT;

COMMENT ON TABLE regions 
         IS 'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.';
COMMENT ON COLUMN regions.region_id
         IS 'Primary key of regions table.';
COMMENT ON COLUMN regions.region_name
         IS 'Names of regions. Locations are in the countries of these regions.';
COMMENT ON TABLE locations
         IS 'Locations table that contains specific address of a specific office,
         warehouse, and/or production site of a company. Does not store addresses /
         locations of customers. Contains 23 rows; references with the
         departments and countries tables. ';
COMMENT ON COLUMN locations.location_id
         IS 'Primary key of locations table';
COMMENT ON COLUMN locations.street_address
         IS 'Street address of an office, warehouse, or production site of a company.
         Contains building number and street name';
COMMENT ON COLUMN locations.postal_code
         IS 'Postal code of the location of an office, warehouse, or production site 
         of a company. ';
COMMENT ON COLUMN locations.city
         IS 'A not null column that shows city where an office, warehouse, or 
         production site of a company is located. ';
COMMENT ON COLUMN locations.state_province
         IS 'State or Province where an office, warehouse, or production site of a 
         company is located.';
COMMENT ON COLUMN locations.country_id
         IS 'Country where an office, warehouse, or production site of a company is
         located. Foreign key to country_id column of the countries table.';


