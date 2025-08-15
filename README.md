# 📌 Task 8 – Stored Procedures and Functions (Sales1DB)

## 🎯 Objective  
Learn how to create **reusable SQL blocks** using stored procedures and functions for:  
- Modularizing SQL logic  
- Avoiding repetition in queries  
- Improving maintainability  

---

## 🛠 Tools  
- **MySQL Workbench**

---

## 📂 Database Overview  
Using the **Sales1DB** database:  
- **Customers Table** – Stores customer details  
- **Orders Table** – Stores product purchases with amount and date  

---

## 🖋 Examples Created  

### 1. Stored Procedure – `GetOrdersByCity`  
- Accepts a city name as a parameter  
- Returns all orders from customers in that city

### 2. Stored Procedure – get_total_sales
 - Calculates total sales amount from the orders table  

### 3. Function – get_customer_count_by_city
 - Returns the number of customers from a specific city

## About DELIMITER in MySQL

- When creating stored procedures or functions in MySQL, we often need to write multiple SQL statements inside a single block (BEGIN ... END).
- By default, MySQL ends a command when it sees a semicolon (;).
- If we keep the default delimiter, MySQL will think the procedure ends too early (after the first ;).
- DELIMITER lets us temporarily change the command-ending symbol (e.g., to // or $$) so the entire block is treated as one single command.
- After the procedure/function is created, we switch back to the default ;.
