CREATE DATABASE lab6_1;

CREATE TABLE locations (
  location_id SERIAL PRIMARY KEY,
  street_address VARCHAR(25),
  postal_code VARCHAR(12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);

CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) UNIQUE,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(50),
  salary INTEGER,
  manager_id INTEGER REFERENCES employees,
  department_id INTEGER REFERENCES departments
);

CREATE TABLE job_grades(
  grade CHAR(1),
  lowest_salary INTEGER,
  highest_salary INTEGER
);

SELECT * FROM employees;
INSERT INTO employees(first_name, last_name,
                      email, phone_number, salary, manager_id, department_id)
VALUES ('Balnur', 'Sakhybekova', 'balnur00', '87775477410', '800000000', '23', '4');


SELECT E.first_name AS "Employee Name",
   M.first_name AS "Manager"
     FROM employees E
       JOIN employees M
         ON E.manager_id = M.employee_id;