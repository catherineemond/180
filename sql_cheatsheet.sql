-- CREATE TABLE

CREATE TABLE departments(
  id serial PRIMARY KEY,
  name varchar(50)
);

-- ALTER TABLE

ALTER TABLE employees
ADD COLUMN department_id int;

-- DROP TABLE

DROP TABLE employees;

-- ADD COLUMN

ALTER TABLE employees
ADD COLUMN start_date timestamp DEFAULT now();

-- ALTER COLUMN

ALTER TABLE departments
ALTER COLUMN name TYPE text;

-- DROP COLUMN

ALTER TABLE employees
DROP COLUMN start_date;

-- INSERT

INSERT INTO employees (first_name, last_name, salary, department_id)
VALUES
('Bob', 'Smith', 5000, 1),
('John', 'Doe', 6000, 2);

-- UPDATE

UPDATE employees
SET first_name = 'Bill' WHERE id = 1;

-- DELETE

DELETE FROM employees
WHERE id = 2;

-- Create an auto-incrementing column

CREATE TABLE departments(
  id serial PRIMARY KEY,
  name varchar(50)
);

-- Define a default value for a column when creating the table

CREATE TABLE products (
    product_no integer,
    name text,
    price numeric DEFAULT 9.99
);

-- Set a new default for a column

ALTER TABLE products ALTER COLUMN price SET DEFAULT 7.77;

-- Remove default from a column

ALTER TABLE products ALTER COLUMN price DROP DEFAULT;

-- Create CHECK constraints

ALTER TABLE products ADD CHECK (name <> '');
ALTER TABLE products ADD CONSTRAINT some_name UNIQUE (product_no);

-- To add a not-null constraint, which cannot be written as a table constraint, use this syntax

ALTER TABLE products ALTER COLUMN product_no SET NOT NULL;

-- To remove a constraint

ALTER TABLE products DROP CONSTRAINT some_name;

-- To remove a NOT NULL constraint

ALTER TABLE products ALTER COLUMN product_no DROP NOT NULL;

-- Create foreign key constraints

ALTER TABLE products ADD FOREIGN KEY (product_group_id) REFERENCES product_groups;

-- Remove foreign key constraints: like any other constraint
