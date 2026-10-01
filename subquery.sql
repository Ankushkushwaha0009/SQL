CREATE TABLE employee_salary (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employee_salary
(id, name, department, salary)
VALUES
(1, 'Rahul', 'IT', 70000),
(2, 'Priya', 'HR', 50000),
(3, 'Amit', 'IT', 90000),
(4, 'Sneha', 'Finance', 60000),
(5, 'Karan', 'IT', 80000);

select * from employee_salary  ;

-- Find employees whose salary is greater than the 
-- average salary of all employees.

/*
first inner subquery will run and then whatver result 
will come by excecuting the inner query accrodingly
top query will run and give the result
*/
-- select name , salary from 
-- employee_salary 
-- where salary > ( select AVG(salary) from employee_salary ) ; 

-- Find the employee(s) who have the highest salary.

-- select name  , salary from employee_salary
-- where salary = (
--   select MAX(salary) from employee_salary
-- ) ; 

-- Find employees who earn more than the 
-- average salary of the IT department.

-- select name , salary from employee_salary
-- where salary > (
--   select AVG(salary) from employee_salary 
--   WHERE department = 'IT' 
-- ) ; 

-- Find all employees who work in the same 
-- departments as Rahul.

-- first way to write the query for this 

-- select name from employee_salary
-- where department = (
--   SELECT department
--   FROM employee_salary
--   WHERE name = 'Rahul'
-- ) ; 

-- -- second way to write the query for this 

-- select name from employee_salary
-- where department in (
--   SELECT department
--   FROM employee_salary
--   WHERE name = 'Rahul'
-- ) ; 

-- Find employees who earn more than the highest-paid 
-- employee in the HR department.

select name from employee_salary
where salary > (
  select MAX(salary) from employee_salary 
  where department = 'HR'
) ; 

-- Find the employee(s) who have 
-- the same salary as Rahul.

select name from employee_salary
where salary = (
  select salary from employee_salary 
  where name = 'Rahul'
) ; 

-- *************IMPORTANT************ ------

-- Find employees who earn more than the average 
-- salary of their department.....
-- find the average salary in department wise ...

-- select AVG(salary) from (
-- SELECT department, AVG(salary)
-- FROM employee_salary
-- GROUP BY department;

select AVG(salary) from employee_salary ;

select name , salary, department
from employee_salary e1 
where  salary > (
  select AVG(salary) from employee_salary e2
  where e1.department = e2.department
);

-- Inner query becomes 
/* SELECT AVG(salary)
FROM employee_salary
WHERE department = 'IT';
*/

-- Find employees whose salary is greater 
-- than the salary of Rahul

select name , salary from employee_salary
where salary > (
  select salary from employee_salary 
  where name = 'Rahul'
) ; 

-- Find employees whose salary is greater
-- than the average salary of their department.

select name , salary , department from employee_salary e1
where salary > (
  select AVG(salary) from employee_salary e2
  where e1.department = e2.department
)
