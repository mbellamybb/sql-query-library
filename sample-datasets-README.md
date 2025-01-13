# Loading Sample Datasets

This guide explains loading the provided `.csv` sample datasets into your SQL environment. The datasets include, access the datasets by clicking the link below:

- [customers.csv](https://www.dropbox.com/scl/fi/beq8a8oqux83bpfmx9gzg/customers.csv?rlkey=8ryl2sn0xudkd50a5iq8jk5j4&st=jsto5h3b&dl=0): Contains customer information such as name, email, and registration date.  
- [orders.csv](https://www.dropbox.com/scl/fi/pjck93wgon9iuww9udiqx/orders.csv?rlkey=o5sqgw2eyg738nadig5w54heo&st=d7gux1j6&dl=0): Contains order information such as order ID, total amount, and order status.  
- [products.csv](https://www.dropbox.com/scl/fi/lcc10di4cirszmujalsfc/products.csv?rlkey=67q4alf2ldxps4beeg6szdf4s&st=kr8qei1b&dl=0): Contains product information such as product name, category, and description.  
- [interaction_log.csv](https://www.dropbox.com/scl/fi/t9zvfk2485q8vozwnbph7/interaction_log.csv?rlkey=ilmwkgdbvmndtxao4pz0eud6y&st=banfjfkd&dl=0): Tracks interactions with customers, including meeting dates and follow-ups.

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
