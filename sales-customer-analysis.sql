CREATE DATABASE sales_analysis;
USE sales_analysis;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Neha', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Pooja', 'Delhi'),
(5, 'Ankit', 'Bangalore'),
(6, 'Riya', 'chennai'),
(7, 'Karan', 'Hyderabad'),
(8, 'Meera', 'Pune'),
(9, 'Suresh', 'Delhi'),
(10, 'Nikita', 'Mumbai'),
(11, 'Arjun', 'Bangalore'),
(12, 'Simran', 'Chandigarh');
SELECT * FROM  customers ;
INSERT INTO orders VALUES
(101, 1, '2024-01-05', 25000),
(102, 2, '2024-01-10', 18000),
(103, 1, '2024-01-15', 30000),
(104, 3, '2024-01-20', 15000),
(105, 4, '2024-01-25', 22000),
(106, 2, '2024-02-01', 27000),
(107, 3, '2024-02-05', 32000),
(108, 4, '2024-02-08', 15000),
(109, 6, '2024-02-10', 22000),
(110, 7, '2024-02-12', 18000),
(111, 1, '2024-02-15', 35000),
(112, 8, '2024-02-18', 16000),
(113, 9, '2024-02-20', 29000),
(114, 10, '2024-02-22', 24000),
(115, 11, '2024-02-25', 40000),
(116, 4, '2024-03-01', 26000),
(117, 6, '2024-03-05', 31000),
(118, 7, '2024-03-08', 17000),
(119, 8, '2024-03-10', 21000),
(120, 12, '2024-03-12', 19000);
SHOW TABLES;
SELECT* FROM orders;
SELECT 
    o.order_id,
    c.customer_name,
    o.order_date,
    o.amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;
SELECT 
    c.customer_name,
	sum(o.amount) AS total_sales
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
SELECT 
    c.city,
    SUM(o.amount) AS total_revenue
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city;
SELECT 
    c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
SELECT 
    c.customer_name,
    o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.amount DESC
LIMIT 1;




