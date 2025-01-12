---Data-retrieval
  
-- Query 1: Retrieve Specific Columns
SELECT name, email, created_at  
FROM customers  
WHERE created_at >= '2023-01-01';
--Use Case: Pull customer records created this year to analyze recent sign-ups.

-- Query 2: Filter Data with Multiple Conditions
SELECT *  
FROM orders  
WHERE order_status = 'Shipped' AND total_amount > 100;
--Use Case: Identify large-value orders that have been shipped.

-- Query 3:Retrieve Data with Wildcards (LIKE)
SELECT product_name, price  
FROM products  
WHERE product_name LIKE '%laptop%';
-- Use Case: Retrieve all products with “laptop” in their name.

-- Query 4: Sort Data by Date
SELECT customer_id, order_date, total_amount  
FROM orders  
ORDER BY order_date DESC;
--Use Case: Sort orders to get the most recent purchases at the top.

--Query 5 Limit Results
SELECT *  
FROM customers  
LIMIT 10;
-- Use Case: Retrieve only the first 10 customer records for a quick preview..

-- Query 6: Retrieve Orders with Specific Statuses
SELECT *  
FROM orders  
WHERE order_status IN ('Shipped', 'Delivered');
-- Use Case: Retrieve orders that have either been shipped or delivered.

-- Query 7: Filter Customers from Specific Countries
SELECT *  
FROM customers  
WHERE country IN ('USA', 'Canada');
-- Use Case: Get customers who are based in either the USA or Canada.

-- Query 8: Products in Specific Categories
SELECT *  
FROM products  
WHERE category IN ('Electronics', 'Appliances');  
-- Use Case: Retrieve products that belong to the Electronics or Appliances categories.

-- Advanced Filtering with NOT IN

-- Query 1: Retrieve Customers Who Haven’t Made Purchases**
SELECT *  
FROM customers  
WHERE customer_id NOT IN (SELECT customer_id FROM orders);  
-- Use Case: Find customers who are registered but have never placed an order.

-- Query 2: Exclude Products from Specific Categories
SELECT *  
FROM products  
WHERE category NOT IN ('Electronics', 'Appliances');  
-- Use Case: List all products that don’t belong to the Electronics or Appliances categories.

