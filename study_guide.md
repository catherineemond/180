## SQL

# What is SQL?

SQL is a special-purpose, declarative language used to manipulate the structure and values of datasets stored in a relational database.

# Explain the difference between INNER, LEFT OUTER, and RIGHT OUTER joins.

- an `INNER JOIN` will join the rows of two tables according to the join condition specified in the `ON` clause. Only the rows matching the join condition will be included.
- a `LEFT OUTER JOIN` will include all rows from the first table, no matter if they satisfy the join condition.
- a `RIGHT OUTER JOIN` will include all rows from the second table, no matter if they satisfy the join condition.

# Name and define the three sublanguages of SQL.

- DDL: Data Definition Language
  - relates to the *structure* and *rules* of the database (schema)
  - is used to create, modify, and delete databases and tables
  - is responsible for describing how the data is structured
  - `ALTER`, `DROP`, `CREATE`
- DML: Data Manipulation Language
  - relates to the *content* of the database (data)
  - is used to create, read, update, and delete the actual data in a database
  - `INSERT`, `SELECT`, `UPDATE`, `DELETE`
- DCL: Data Control Language
  - relates to permissions (who can do what?)
  - responsible for defining the rights and roles granted to individual users
  - `GRANT`, `REVOKE`

# Write SQL statements using INSERT, UPDATE, DELETE, CREATE/ALTER/DROP TABLE, ADD/ALTER/DROP COLUMN.

See cheatsheet

# Understand how to use GROUP BY, ORDER BY, WHERE, and HAVING.

- `WHERE`
  - is used to select specific rows according to a condition that will evaluate to a result of type `boolean`
  - any row that does not satisfy this condition will be eliminated from the output
  - we also say that `WHERE` acts as a *filter* on the data we want to query
- `GROUP BY`
  - is used to group together those rows in a table that have the same values in all the columns listed
  - this is done to eliminate redundancy in the output and/or compute aggregates that apply to these groups  
- `ORDER BY`
  - is used to sort rows after the query has produced an output table
  - we can specify `ASC` or `DESC`
  - we can specify more than one expression
- `HAVING`
  - if a table has been grouped using `GROUP BY`, the `HAVING` clause can be used, much like a `WHERE` clause, to eliminate groups from the result

## PostgreSQL

# What is PostgreSQL?

PostgreSQL is an open-source RDBMS (Relational Database Management System).

# Describe what a sequence is and what they are used for.

- aka *sequence object* or *sequence generator*
- a special single row table created with `CREATE SEQUENCE`
- it is commonly used to generate unique identifiers for rows of a table
- it will remember the last number it generated and generate the next
- once a number is returned by `nextval` for a standard sequence it will not be returned again
- when we define a `serial` datatype, PostgreSQL will create a sequence object and use the `nextval` function to generate the appropriate value

# Create an auto-incrementing column.

```
CREATE TABLE customers(
  id serial,
  name varchar(50)
);
```

# Define a default value for a column.

See cheatsheet

# Be able to describe what primary, foreign, natural, and surrogate keys are.

- primary key
  - a unique identifier for a row of data
  - often an integer, but other types of data possible (e.g. UUID)
  - making a column a primary key is essentially equivalent to adding `NOT NULL` and `UNIQUE` constraints to that column
  - it is common practice for the primary key to be a column named `id`
  - all tables should have a primary key
- foreign key
  - a mechanism for defining relationships between columns of different tables
  - we associate a row in one table to a row in another table, setting one column as a `foreign key` and having that column reference the other table's `primary key` column
  - creating this relationship is done using the `REFERENCES` keyword
- natural key
  - an existing value in a dataset that can be used to uniquely identify each row of data
- surrogate key
  - a value created solely for the purpose of identifying a row of data
  - the most common is an auto-incrementing integer

# Create and remove CHECK constraints from a column.

See cheatsheet

# Create and remove foreign key constraints from a column.

See cheatsheet

## Database diagrams

# Define cardinality and modality.

- cardinality
  - the number of objects on each side of the relationship
  - 1:1, 1:M, M:M
- modality
  - if the relationship is required (1) or optional (0)

# Be able to draw database diagrams using crow's foot notation.

- cardinality and modality are indicated in ERD (Entity Relationship Diagrams) using crow's foot notation.
- it is one of the more common notation types for representing these concepts diagrammatically
