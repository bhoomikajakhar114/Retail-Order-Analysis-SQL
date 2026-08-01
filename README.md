# 🛒 Retail Order Analysis using SQL

## 📌 Project Overview

This project analyzes retail order data using **MySQL** to extract meaningful business insights from customer orders, products, and sales transactions. The analysis focuses on customer behavior, order performance, promotional campaigns, sales channels, membership tiers, monthly revenue trends, and product returns.

The project demonstrates practical SQL skills commonly used in Data Analytics and Business Intelligence roles.

---
## 🎯 Objectives
- Analyze order status distribution
- Compare city-wise order performance
- Evaluate promotional campaign effectiveness
- Measure sales channel performance
- Analyze customer membership tiers
- Track monthly revenue trends
- Generate business KPIs
- Study product return behavior
---
  ## 🗂️ Dataset
The project uses four related datasets.
| Dataset | Description |
|---------|-------------|
| **customers.csv** | Customer information including membership tier |
| **orders.csv** | Order details, revenue, discounts, and order status |
| **order_items.csv** | Products purchased in each order |
| **products.csv** | Product information including perishable status |

---
## 🗃️ Database Schema
The analysis is performed using four relational tables:
- Customers
- Orders
- Order Items
- Products
These tables are connected through **Customer ID**, **Order ID**, and **Product ID**.
---
## 🛠️ Tools Used
- MySQL
- MySQL Workbench
- Git
- GitHub
---
## 📚 SQL Concepts Demonstrated
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- INNER JOIN
- LEFT JOIN
- CASE WHEN
- Aggregate Functions
  - COUNT()
  - SUM()
  - AVG()
  - ROUND()
- DISTINCT
- Date Functions
- Percentage Calculations
- Conditional Aggregation
---
# 📊 Business Questions Solved

## 1️⃣ Order Status Distribution

**Objective**
Display each order status along with: - Total number of orders
- Percentage contribution of total orders in 2023
 ### SQL Query

```sql
SELECT
    order_status,
    COUNT(*) AS total_orders,
    COUNT(*) * 100.0 /
    (
        SELECT COUNT(*)
        FROM orders
        WHERE YEAR(order_date) = 2023
    ) AS percentage
FROM orders
WHERE YEAR(order_date) = 2023
GROUP BY order_status;
```

**SQL Concepts**

- GROUP BY
- COUNT
- Subquery
- Percentage Calculation

---

## 2️⃣ City-wise Order Performance
**Objective**
For each city, calculate:
- Total Orders
- Delivered Orders
- Cancelled Orders
Sort cities by highest number of orders.
**SQL Concepts**
- GROUP BY
- CASE WHEN
- SUM
- COUNT
---
## 3️⃣ Promotional Campaign Analysis
**Objective**
Compare Promo and Non-Promo orders using:
- Order Count
- Average Order Value
**SQL Concepts**
- CASE WHEN
- AVG
- GROUP BY
---
## 4️⃣ Sales Channel Analysis
**Objective**
Compare performance of:
- App
- Web
- Kiosk
Metrics:
- Total Orders
- Total Net Revenue
- Average Revenue per Order
**SQL Concepts**
- GROUP BY
- SUM
- AVG
---
## 5️⃣ Membership Tier Analysis
**Objective**

For each membership tier:
- Total Customers
- Customers who placed at least one order in 2023
- Total Revenue
- Average Order Value
Includes customers with zero orders using **LEFT JOIN**.
**SQL Concepts**
- LEFT JOIN
- COUNT DISTINCT
- SUM
- AVG
---
## 6️⃣ Monthly Revenue Analysis
**Objective**
Generate monthly sales performance for 2023.
Metrics:
- Total Orders
- Total Net Revenue
**SQL Concepts**
- GROUP BY
- SUM
- COUNT
- Date Filtering
---

## 7️⃣ Channel Performance KPI Report
**Objective**
Generate channel-wise business KPIs including:
- Total Orders
- Delivered Orders
- Cancelled Orders
- Returned Orders
- Gross Revenue
- Promo Discounts
- Net Revenue
**SQL Concepts**
- CASE WHEN
- SUM
- COUNT
- GROUP BY
---
## 8️⃣ Product Return Analysis
**Objective**
Compare return performance between:
- Perishable Products
- Non-Perishable Products
Metrics:
- Total Order Lines
- Returned Lines
- Return Percentage
**SQL Concepts**
- INNER JOIN
- CASE WHEN
- Conditional Aggregation
---

# 📈 Key Business Insights

This project helps answer questions such as:

- Which order status is most common?
- Which cities generate the highest number of orders?
- Do promotional campaigns improve sales?
- Which sales channel generates the most revenue?
- Which membership tier contributes the highest revenue?
- How does revenue change month by month?
- Which channel performs best overall?
- Are perishable products returned more often than non-perishable products?
---

# 📂 Project Structure
```
Retail-Order-Analysis-SQL
│
├── Dataset
│   ├── customers.csv
│   ├── orders.csv
│   ├── order_items.csv
│   └── products.csv
│
├── SQL Queries
│   └── Retail_Order_Analysis.sql
│
├── README.md
│
└── Images (Optional)
    └── ER_Diagram.png
```
---

# 🚀 How to Run

1. Open MySQL Workbench.
2. Create a new database.
3. Import all four CSV files into the database.
4. Open the `Retail_Order_Analysis.sql` file.
5. Execute each query to generate business insights.
---
# 📁 Repository Contents
```
Dataset/
    customers.csv
    orders.csv
    order_items.csv
    products.csv

SQL Queries/
    Retail_Order_Analysis.sql

README.md
```
---

# 💡 Skills Demonstrated

- SQL Query Writing
- Relational Database Analysis
- Data Aggregation
- Business KPI Reporting
- Revenue Analysis
- Customer Analytics
- Retail Data Analysis
- Data Cleaning and Filtering
- Business Intelligence Concepts

---

# 🎓 Learning Outcomes

Through this project, I gained hands-on experience in:

- Writing real-world SQL queries
- Solving business problems using SQL
- Working with relational datasets
- Performing customer and revenue analysis
- Using joins and aggregate functions effectively
- Building a professional SQL portfolio project for GitHub

---

## 👩‍💻 Author

**Bhoomika Jakhar**



## ⭐ If you found this project helpful

If you like this project, consider giving it a ⭐ on GitHub!
