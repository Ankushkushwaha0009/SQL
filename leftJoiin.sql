CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(50),
    city VARCHAR(50)
);
 
INSERT INTO customers (customer_id, name, city)
VALUES
(1, 'Rahul', 'Mumbai'),
(2, 'Priya', 'Pune'),
(3, 'Amit', 'Delhi'),
(4, 'Sneha', 'Mumbai');
 
CREATE TABLE orders_left (
    order_id INT,
    customer_id INT,
    product VARCHAR(50),
    amount INT
);
 
INSERT INTO orders_left (order_id, customer_id, product, amount)
VALUES
(101, 1, 'Laptop', 80000),
(102, 2, 'Phone', 50000),
(103, 1, 'Mouse', 2000),
(104, 3, 'Shoes', 5000),
(105, 2, 'Laptop', 75000),
(106, 1, 'Keyboard', 3000);
 
select * from customers ;
select * from orders_left ;
 
-- show every customers and their orders
-- it will try to keep the left row data from left table
--
/*
LEFT JOIN
    ↓
Keep everything from LEFT table
    +
matching data from RIGHT table
*/
 
SELECT
    customers.name,
    orders_left.product,
    orders_left.amount
FROM customers
LEFT JOIN orders_left
ON customers.customer_id = orders_left.customer_id;
 
-- Show every customer along with their city and product.
select customers.name  , customers.city , orders_left.product from customers
left join orders_left on customers.customer_id = orders_left.customer_id ;
 
-- Show every customer along with their name and total amount spent.
 
select customers.name , SUM(amount) as totalAmount from customers
left join orders_left on customers.customer_id = orders_left.customer_id
group by customers.name ;
 
-- Show every customer and the number of orders they have placed.
 
select customers.name , count(orders_left.order_id) as NoofOrders from customers
left join orders_left on customers.customer_id = orders_left.customer_id
group by customers.name ;
 
-- Find customers who have placed at least one order using
 
select customers.name , count(orders_left.order_id) as NoofOrders from customers
left join orders_left on customers.customer_id = orders_left.customer_id
group by customers.name having NoofOrders >= 1 ;
 
-- ind all customers who have NOT placed any order.
 
select customers.name from customers
left join orders_left on customers.customer_id = orders_left.customer_id
group by customers.name having count(orders_left.order_id)  = 0 ;
 