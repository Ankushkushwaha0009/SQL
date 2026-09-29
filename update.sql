CREATE TABLE employee_update (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);
 
INSERT INTO employee_update
(id, name, department, salary, city)
VALUES
(1, 'Rahul', 'IT', 70000, 'Mumbai'),
(2, 'Priya', 'HR', 50000, 'Pune'),
(3, 'Amit', 'IT', 90000, 'Delhi'),
(4, 'Sneha', 'Finance', 60000, 'Mumbai'),
(5, 'Karan', 'IT', 80000, 'Pune');
 
 
select * from employee_update ;
 
/*UPDATE table_name
SET column = new_value
WHERE condition;
*/
 
UPDATE employee_update
SET salary = 75000
WHERE name = 'Rahul';
 
/*
 
Rahul: 75000 → 82500
Amit:  90000 → 99000
Karan: 80000 → 88000
 
*/
 
update employee_update SET salary  = salary + salary * 0.10
where department = 'IT'  ;
 
select * from employee_update ;
 
/*
Using employee_update, give employees a salary adjustment based on
their current salary:
Salary >= 90,000 → increase by 10%
Salary >= 70,000 → increase by 5%
Salary < 70,000 → increase by 2%
*/
 
update employee_update
SET salary =
  case
    when Salary >= 90000 then salary * 0.10 + salary
    when Salary >= 70000 then salary * 0.05 + salary
    else
      salary * 0.02 + salary
  END ;
select * from employee_update ;
 
/*
Using employee_update, update salaries for IT employees only:
IT employees with salary >= 80,000 → increase by 10%
IT employees with salary < 80,000 → increase by 5%
Employees from other departments → don't change
*/
 
 
-- update employee_update
-- SET salary =
--   case
--     when Salary >= 80000 && department = 'IT' then salary * 0.10 + salary
--     when Salary < 80000 && department = 'IT' then salary * 0.05 + salary
--   else
--      salary
--   END ;
-- select * from employee_update ;
 
 
-- clean approach
 
UPDATE employee_update
SET salary =
    CASE
        WHEN salary >= 80000 THEN salary * 1.10
        ELSE salary * 1.05
    END
WHERE department = 'IT';
 
 