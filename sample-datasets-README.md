# Loading Sample Datasets

This guide explains how to load the provided `.csv` sample datasets into your SQL environment. The datasets include:

- **customers.csv:** Contains customer information such as name, email, and registration date.  
- **orders.csv:** Contains order information such as order ID, total amount, and order status.  
- **products.csv:** Contains product information such as product name, category, and description.  
- **interaction_log.csv:** Tracks interactions with customers, including meeting dates and follow-ups.

---

## **Steps to Load CSV Files**

### **1. MySQL**

1. **Create a database**:
   ```sql
   CREATE DATABASE sql_query_library;
   USE sql_query_library;


2. **Create tables**:
   ```sql
   CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(255),
    email VARCHAR(255),
    created_at DATE,
    country VARCHAR(100),
    loyalty_points INT);

3. **Import CSV using** LOAD DATA:
```sql
LOAD DATA INFILE '/path/to/your/file/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

### **2. PostgreSQL**
1. **Create a tables**:
```sql
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    order_status VARCHAR(50),
    payment_method VARCHAR(50));
  ``` 
3. **Use COPY command to import:**:
```sql
COPY orders FROM '/path/to/your/file/orders.csv' DELIMITER ',' CSV HEADER;
```

### **3. SQLite**

For SQLite, use **DB Browser for SQLite** or Python to import CSVs:
```python
import pandas as pd
import sqlite3

conn = sqlite3.connect('sql_query_library.db')
customers_df = pd.read_csv('/path/to/your/file/customers.csv')
customers_df.to_sql('customers', conn, if_exists='replace', index=False)
```

### **4. Common Errors and Solutions**

	•	File Path Issues: Ensure the correct file path for CSV files.
	•	Permissions Issues: Some databases require admin permissions to access local files.
	•	Data Type Mismatches: Ensure SQL column types match the data in the .csv file.

 ### **Next Steps**

 Once the datasets are loaded, you can use the provided SQL queries from the library to practice. Example:

```sql
 SELECT * FROM customers WHERE created_at >= '2023-01-01';
```

Happy querying! If you run into issues, feel free to reach out or submit an issue on GitHub.
