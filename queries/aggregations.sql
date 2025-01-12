--Aggregations (SUM, AVG, COUNT, etc.)

-- Query 1: Count Records
SELECT COUNT(*) AS total_customers  
FROM customers;  
--Use Case: Get the total number of customers.

--Query 2: Calculate Average Order Amount
SELECT AVG(total_amount) AS avg_order_amount  
FROM orders;  
-- Use Case: Calculate the average value of all orders.

-- Query 3: Sum of Sales for a Specific Period
SELECT SUM(total_amount) AS total_sales  
FROM orders  
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';  
-- Use Case: Calculate the total sales for the year 2023.

-- Query 4: Group Data by Category (GROUP BY)
SELECT category, COUNT(*) AS num_products  
FROM products  
GROUP BY category;  
-- Use Case: Count how many products belong to each category.

-- Query 5: Find Maximum and Minimum Values
SELECT MAX(total_amount) AS max_order, MIN(total_amount) AS min_order  
FROM orders;  
-- Use Case: Get the largest and smallest order amounts.

