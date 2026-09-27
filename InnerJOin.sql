CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers
(customer_id, name, city)
VALUES
(1, 'Rahul', 'Mumbai'),
(2, 'Priya', 'Pune'),
(3, 'Amit', 'Delhi'),
(4, 'Sneha', 'Mumbai');

CREATE TABLE orders2 (
    order_id INT,
    customer_id INT,
    product VARCHAR(50),
    amount INT
);

INSERT INTO orders2
(order_id, customer_id, product, amount)
VALUES
(101, 1, 'Laptop', 80000),
(102, 2, 'Phone', 50000),
(103, 1, 'Mouse', 2000),
(104, 3, 'Shoes', 5000),
(105, 2, 'Laptop', 75000),
(106, 1, 'Keyboard', 3000);

select * from customers ; 
select * from orders2  ; 

-- /*
-- From customers:
-- name
-- From orders2:
-- product
-- amount
-- And we connect them using:
-- customer_id
-- */

-- inner join only returns rows where the only
-- condition matches in the both TABLE

select customers.name , orders2.product , 
orders2.amount from customers
inner join orders2 on
customers.customer_id = orders2.customer_id ; 

-- Show the customer name and city along
-- with the product and amount for every order.

select customers.name , customers.city , 
orders2.product  , orders2.amount from customers
inner join orders2 on
customers.customer_id = orders2.customer_id ; 

-- ?Show the customer name and product for all orders placed by Rahul.

select customers.name , orders2.product
from customers inner join orders2 on 
customers.customer_id = orders2.customer_id 
where customers.name = "Rahul" ; 

-- Find the total amount spent by each customer.


select customers.name , SUM(orders2.amount) as totalAmount
from customers inner join orders2 on
customers.customer_id  = orders2.customer_id 
group by customers.name ;




















