--Joins (Combining Tables)

-- Query 1: Inner Join (Combining Orders and Customers)
SELECT o.order_id, c.name, o.total_amount  
FROM orders o  
INNER JOIN customers c  
ON o.customer_id = c.customer_id;  
-- Use Case: Combine customer and order data to view the customer names with their purchases.Query 2: Left Join (All from One Table)

-- Query 2: Left Join (All from One Table)SELECT c.customer_id, c.name, o.order_id, o.total_amount  
FROM customers c  
LEFT JOIN orders o  
ON c.customer_id = o.customer_id;  
-- Use Case: Get all customers and their orders, even if they haven’t purchased yet.

-- Query 3: Right Join
SELECT e.employee_id, d.department_name  
FROM employees e  
RIGHT JOIN departments d  
ON e.department_id = d.department_id;  
-- Use Case: List all departments, even those without employees.

-- Query 4: Full Outer Join
SELECT a.account_id, b.transaction_id  
FROM accounts a  
FULL OUTER JOIN transactions b  
ON a.account_id = b.account_id;  
-- Use Case: Show all accounts and transactions, even if there’s no match between them.

--Query 5: Self Join (Same Table)
SELECT e1.employee_id, e1.name AS employee, e2.name AS manager  
FROM employees e1  
LEFT JOIN employees e2  
ON e1.manager_id = e2.employee_id;  
--Use Case: Retrieve employees and their managers from the same table.
