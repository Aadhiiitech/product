# Employee-Department Database (Week 2 SQL)

A simple MySQL script demonstrating table creation, relationships, and common SQL operations (joins, aggregation, subqueries, CRUD) using an Employee–Department schema.

## Contents

- `Week_2.sql` — full script: schema creation, sample data, and query exercises.

## Database Schema

**`department`**

| Column | Type | Constraints |
|---|---|---|
| department_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| department_name | VARCHAR(50) | NOT NULL |

**`employee`**

| Column | Type | Constraints |
|---|---|---|
| employee_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| employee_name | VARCHAR(100) | NOT NULL |
| salary | DECIMAL(10,2) | |
| department_id | INT | FOREIGN KEY → department(department_id) |

## Sample Data

- 4 departments: IT, HR, Finance, Marketing
- 17 employees distributed across the departments (7 in IT, 3 in HR, 3 in Finance, 4 in Marketing)

## What the Script Does

1. **Setup** — creates the database `employee_department_db`, the `department` and `employee` tables, and seeds them with sample rows.
2. **Basic retrieval** — selects all rows from both tables.
3. **Inner join** — lists each employee with their department name.
4. **Left join + aggregation** — counts employees per department (including departments with zero employees).
5. **Correlated subquery** — finds the highest-paid employee in each department.
6. **GROUP BY + HAVING** — finds departments with more than 5 employees.
7. **Average salary** — computes average salary per department.
8. **CRUD demo** — inserts a new employee (Sanjay), selects, updates his salary, selects again, then deletes the row and shows the final table state.

## How to Run

1. Open a MySQL client (e.g. MySQL Workbench, `mysql` CLI, or phpMyAdmin).
2. Run the script top to bottom:
   ```bash
   mysql -u <username> -p < Week_2.sql
   ```
3. Review each query's output as it executes — the script is written to be run sequentially, since later statements (UPDATE/DELETE) act on data inserted earlier in the script.

## Notes

- Running the script twice without dropping the database first will fail on `CREATE DATABASE` / duplicate data — drop `employee_department_db` first if you need a clean re-run:
  ```sql
  DROP DATABASE IF EXISTS employee_department_db;
  ```
- The final employee ID referenced (`employee_id = 18`) assumes auto-increment continued sequentially from the initial 17 inserts.
