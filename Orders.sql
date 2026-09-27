CREATE TABLE orders (
    order_id INT,
    customer VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(50),
    amount INT,
    city VARCHAR(50)
);

INSERT INTO orders
(order_id, customer, product, category, amount, city)
VALUES
(101, 'Rahul', 'Laptop', 'Electronics', 80000, 'Mumbai'),
(102, 'Priya', 'Phone', 'Electronics', 50000, 'Pune'),
(103, 'Rahul', 'Mouse', 'Electronics', 2000, 'Mumbai'),
(104, 'Amit', 'Shoes', 'Fashion', 5000, 'Delhi'),
(105, 'Priya', 'Laptop', 'Electronics', 75000, 'Pune'),
(106, 'Rahul', 'Keyboard', 'Electronics', 3000, 'Mumbai'),
(107, 'Amit', 'T-Shirt', 'Fashion', 2000, 'Delhi'),
(108, 'Sneha', 'Shoes', 'Fashion', 7000, 'Mumbai'),
(109, 'Priya', 'Headphones', 'Electronics', 5000, 'Pune'),
(110, 'Sneha', 'Watch', 'Accessories', 10000, 'Mumbai');

SELECT * FROM orders;

-- SELECT count(*) AS product_Orders FROM orders ; 
-- select count(customer) as cutomer_value from orders ; 
-- select count(city) as city_value from orders ;

select SUM(amount) as total_Sum 
from orders ; 

-- total amount spent by Rahul ....

select SUM(amount) as total_Spent from orders 
where customer = 'Rahul' ; 

-- average order amount from Orders TABLE

select AVG(amount) from orders where customer = 'Rahul'; 

-- highest order amount from order table 

select MAX(amount) from orders where customer = 'Rahul' ;

-- MINIUM ORDER placed by priya....

select MIN(amount) from orders where customer = 'Priya' ; 

-- group by .....
-- find the total amount spent by each customer

select customer , SUM(amount) as spendAmount 
from Orders group by customer  ; 

-- find the number of orders placed by each customer 

select customer , COUNT(product) as NumberOfOrders 
from Orders group by customer  ; 

-- total sales for each category

select category , SUM(amount) as total_sales 
from orders group by category  ;

-- find the average order amount for each customer

select customer , AVG(amount) from orders 
group by customer ; 


-- highest order amount for each customer

SELECT customer  , MAX(amount) as maxOrderPrice
FROM orders group by customer  ; 

-- find the minimum order amount for each customer 

SELECT customer  , MIN(amount) as minOrderPrice
FROM orders group by customer  ; 

-- find the customer who places more than 2 orders ...

select customer , COUNT(*) as NumberOfOrders 
from Orders group by customer having NumberOfOrders > 2 ;

-- find customers whose total spending is greater than 70000

select customer , SUM(amount) as spendAmount 
from Orders group by customer having spendAmount > 70000 ;

-- find the customer whose total spending is greater than 10000
-- and displau them from highest sepending to lowest ....

select customer , SUM(amount) as spendAmount 
from Orders group by customer  having spendAmount > 10000 
order by spendAmount desc;

-- Find customers whose total spending is greater than 70,000.

select customer from Orders 
group by customer having SUM(amount) > 70000 ; 























