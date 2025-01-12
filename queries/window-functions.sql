-- Window Functions

-- Query 1: Rank Customers by Total Spend
SELECT customer_id, SUM(total_amount) AS total_spend,  
       RANK() OVER (ORDER BY SUM(total_amount) DESC) AS rank  
FROM orders  
GROUP BY customer_id;  
-- Use Case: Rank customers by their total spending.

--Query 2: Calculate Running Total
SELECT order_date, total_amount,  
       SUM(total_amount) OVER (ORDER BY order_date) AS running_total  
FROM orders;  
--Use Case: Track cumulative sales over time.

--Query 3: Moving Average
SELECT order_date, total_amount,  
       AVG(total_amount) OVER (ORDER BY order_date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS moving_avg  
FROM orders;  
-- Use Case: Calculate a 5-day moving average for order amounts.

-- Query 4: Percentile Rank
SELECT customer_id, total_spend,  
       PERCENT_RANK() OVER (ORDER BY total_spend DESC) AS percentile_rank  
FROM (  
  SELECT customer_id, SUM(total_amount) AS total_spend  
  FROM orders  
  GROUP BY customer_id  
) AS subquery;  
-- Use Case: Assign a percentile rank to customers based on their spending.

-- Query 5: Dense Rank
SELECT product_name, price,  
       DENSE_RANK() OVER (ORDER BY price DESC) AS price_rank  
FROM products;  
-- Use Case: Rank products by price, with no gaps between ranks.

