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
