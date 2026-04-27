CREATE DATABASE customer_analysis;
USE customer_analysis;
CREATE TABLE customers (customer_id INT PRIMARY KEY,
name VARCHAR(50),
city VARCHAR(50));
CREATE TABLE orders (order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
amount DECIMAL (10,2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
INSERT INTO customers VALUES
(1, 'AMIT', 'MUMBAI'),
(2, 'SARA', 'MUMBAI'),
(3, 'JOHN', 'BANGLORE'),
(4, 'PRIYA', 'DELHI'),
(5, 'ALI', 'HYDERABAD');
INSERT INTO orders VALUES
(101, 1, '2024-01-10', 5000),
(102, 2, '2024-01-15', 7000),
(103, 1, '2024-02-10', 3000),
(104, 3, '2024-02-15', 8000),
(105, 4, '2024-02-20', 2000),
(106, 2, '2024-03-17',6000);

SELECT * FROM customers;
SELECT * FROM orders;

SELECT customers.name, orders.amount
FROM customers
JOIN orders
ON customers.customer_id = orders.order_id;

SELECT c.name, SUM(o.amount) AS total_spent
FROM customerS c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1; 

SELECT MONTH(order_date) AS month, SUM(amount) AS total_sales
FROM orders
GROUP BY MONTH(order_date)
ORDER BY total_sales DESC;

SELECT * FROM orders
WHERE amount > 5000;

SELECT c.name, SUM(o.amount) AS total_spent
FROM customerS c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING total_spent > 8000;















