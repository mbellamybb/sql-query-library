-- -Data Cleaning Queries

-- Query 1: Identify Duplicates
SELECT name, email, COUNT(*)  
FROM customers  
GROUP BY name, email  
HAVING COUNT(*) > 1;  
Use Case: Find duplicate customer records.

-- Query 2: Handle Missing Data (IS NULL)
SELECT *  
FROM products  
WHERE description IS NULL;  
-- Use Case: Find products missing descriptions.

-- Query 3: Replace Missing Data (COALESCE)
SELECT product_name, COALESCE(description, 'No Description') AS description  
FROM products;  
-- Use Case: Replace null descriptions with a default value.

-- Query 4: Remove Duplicates
DELETE FROM customers  
WHERE id NOT IN (  
  SELECT MIN(id)  
  FROM customers  
  GROUP BY name, email  
);  
-- Use Case: Remove duplicate rows while keeping the first instance.

-- Query 5: Trim Whitespace in Text Fields
SELECT TRIM(email) AS cleaned_email  
FROM customers;  
-- Use Case: Remove unnecessary spaces from email fields for data consistency.

--Query 6: Convert loyalty_points to a String for Concatenation using ‘CAST’
SELECT customer_id, name, email,  
       'Loyalty Points: ' || CAST(loyalty_points AS VARCHAR) AS loyalty_info  
FROM customers;  
-- Use Case: Prepare customer information for display by converting numeric loyalty points to text.

-- Query 7: Convert total_amount to an Integer using ‘CAST’
SELECT order_id, customer_id,  
       CAST(total_amount AS INT) AS total_amount_rounded  
FROM orders;  
-- Use Case: Convert floating-point order totals to integers for display purposes or reports that don’t require decimals.

-- Query 8: Convert created_at to Date Format using ‘CAST’
SELECT customer_id, name,  
       CAST(created_at AS DATE) AS registration_date  
FROM customers;  
-- Use Case: Convert the created_at timestamp into a simple date format for comparisons.

--Query 9: Replace Null Descriptions for Products
SELECT product_id, product_name,  
       COALESCE(description, 'No Description Available') AS product_description  
FROM products;  
-- Use Case: Replace missing product descriptions with a default message.

