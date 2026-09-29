CREATE TABLE employee_salary (
    id INT,
    name VARCHAR(50),
    salary INT
);
 
INSERT INTO employee_salary
(id, name, salary)
VALUES
(1, 'Rahul', 90000),
(2, 'Priya', 55000),
(3, 'Amit', 75000),
(4, 'Sneha', 45000),
(5, 'Karan', 100000);
 
select * from employee_salary  ;
 
-- name , salary , category ...
select name , salary ,
CASE
  when Salary >= 80000 THEN 'high'
  when Salary >= 60000 THEN "medium"
  ELSE 'LOW'
END as salary_level
from employee_salary ;
 
 
/*
Create a column called bonus:
Salary >= 90000 → 10% of salary
Salary >= 60000 → 5% of salary
Otherwise → 0
*/
 
 
select name , salary ,
CASE
  when Salary >= 90000 THEN salary * 0.10
  when Salary >= 60000 THEN salary * 0.05
  ELSE 0
END as bonus
from employee_salary ;
 
/*
Using employee_salary, create a column called salary_status:
Salary >= 90000 → 'Senior'
Salary >= 70000 → 'Mid-Level'
Salary < 70000 → 'Junior'
*/
 
select name , salary ,
CASE
  when Salary >= 90000 THEN salary * 0.10
  when Salary >= 60000 THEN salary * 0.05
  ELSE 0
END as bonus ,
CASE
  when Salary >= 90000 THEN 'Senior'
  when Salary >= 70000 THEN 'Mid-Level'
  ELSE 'Junior'
END as salary_status
from employee_salary ;
 