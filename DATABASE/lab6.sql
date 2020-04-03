CREATE TABLE departments(
    id serial PRIMARY KEY ,
    dep_name text CHECK (dep_name IS NOT NULL)
);

CREATE TABLE employees(
    id serial ,
    fake_id serial,
    email varchar(50),
    emp_name varchar(50),
    birth_date date CONSTRAINT greater_date CHECK ( birth_date> '1900-01-01'),
    salary integer,
    bonus integer,
    department_id serial REFERENCES departments(id),
    CONSTRAINT PK PRIMARY KEY(id, fake_id)
);

ALTER TABLE employees
    ADD CONSTRAINT UK UNIQUE(email, emp_name);

INSERT INTO departments
    VALUES  (1, 'department'),
            (2, 'department');



ALTER TABLE departments
    ADD CONSTRAINT UK_Name UNIQUE (dep_name);



ALTER TABLE employees
    DROP CONSTRAINT greater_date;

ALTER TABLE employees
    ADD CONSTRAINT CH
        CHECK ( salary>=0 AND  bonus<salary);

ALTER TABLE employees
    DROP CONSTRAINT PK;

ALTER TABLE  employees ALTER COLUMN  emp_name SET NOT NULL;


