CREATE TABLE locations(
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

SELECT E.first_name, E.last_name, D.department_id, L.city, L.state_province
    FROM employees E
        INNER JOIN departments D USING (department_id)
            INNER JOIN locations L USING (location_id)
                WHERE E.last_name LIKE '%b%';

SELECT D.department_name, L.city, L.state_province
    FROM departments D
        INNER JOIN locations L USING (location_id);

SELECT E.first_name AS "Employee Name",M.first_name AS "Manager"
    FROM employees E
      FULL JOIN employees M
       ON E.manager_id = M.employee_id;

SELECT G.grade, AVG(salary)
    FROM employees E, job_grades G
        GROUP BY G.grade;

SELECT E.first_name, E.last_name
    FROM employees E
        INNER JOIN departments D on E.department_id = D.department_id
            INNER JOIN locations L on D.location_id = L.location_id WHERE L.city = 'London';

