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
---

## Q1. Order Status Distribution
Display each order status, its total number of orders, and its percentage of total orders placed in **2023**.

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
---
## Q2. City-wise Order Performance
For each city, show:- Total Orders, Delivered Orders, Cancelled Orders
Sort the results by total orders in descending order.
### SQL Query
```sql
SELECT
    city,
    COUNT(*) AS total_orders,
    SUM(
        CASE
            WHEN order_status = 'delivered' THEN 1
            ELSE 0
        END
    ) AS delivered_orders,
    SUM(
        CASE
            WHEN order_status = 'cancelled' THEN 1
            ELSE 0
        END
    ) AS cancelled_orders
FROM orders
GROUP BY city
ORDER BY total_orders DESC;
```
---
## Q3. Promotional Campaign Analysis
Compare promo and non-promo orders by showing:- Order Count, Average Order Value
### SQL Query
```sql
SELECT
    CASE
        WHEN promo_code IS NULL OR TRIM(promo_code) = ''
            THEN 'No Promo'
        ELSE 'Promo'
    END AS promo_type,
    COUNT(*) AS total_orders,
    AVG(net_order_value) AS average_order_value
FROM orders
GROUP BY promo_type;
```
---
## Q4. Sales Channel Performance
For each sales channel (App, Web, Kiosk), show:- Order Count, Total Net Revenue, Average Net Revenue per Order
### SQL Query
```sql
SELECT
    channel,
    COUNT(*) AS total_orders,
    SUM(net_order_value) AS total_revenue,
    AVG(net_order_value) AS average_net_revenue
FROM orders
GROUP BY channel
ORDER BY total_revenue DESC;
```
---
## Q5. Membership Tier Analysis
For each membership tier (Platinum, Gold, Silver, None), display:- Total Customers, Customers Who Placed Orders in 2023,Total Revenue,Average Order Value
### SQL Query
```sql
SELECT
    membership_tier,
    COUNT(DISTINCT customers.customer_id) AS total_customers,
    COUNT(DISTINCT orders.customer_id) AS customers_with_orders,
    ROUND(SUM(net_order_value), 2) AS total_revenue,
    ROUND(AVG(net_order_value), 2) AS average_order_value
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
AND YEAR(order_date) = 2023
GROUP BY membership_tier;
```
---
## Q6. Monthly Revenue Analysis (2023)

Show monthly performance for 2023 including:- Total Orders,Total Net Revenue
### SQL Query
```sql
SELECT
    order_month,
    COUNT(*) AS total_orders,
    SUM(net_order_value) AS total_revenue
FROM orders
WHERE YEAR(order_date) = 2023
GROUP BY order_month
ORDER BY total_revenue DESC;
```
---
## Q7. Sales Channel KPI Report

Generate a KPI report for each sales channel including:
- Total Orders
- Delivered Orders
- Cancelled Orders
- Returned Orders
- Gross Revenue
- Promo Discounts
- Net Revenue
### SQL Query

```sql
SELECT
    channel,
    COUNT(*) AS total_orders,
    SUM(
        CASE
            WHEN order_status = 'delivered' THEN 1
            ELSE 0
        END
    ) AS delivered_orders,
    SUM(
        CASE
            WHEN order_status = 'cancelled' THEN 1
            ELSE 0
        END
    ) AS cancelled_orders,
    SUM(
        CASE
            WHEN order_status = 'returned' THEN 1
            ELSE 0
        END
    ) AS returned_orders,
    SUM(gross_order_value) AS total_gross_revenue,
    SUM(promo_discount_amt) AS total_promo_discount,
    SUM(net_order_value) AS total_net_revenue
FROM orders
GROUP BY channel;
```
---
## Q8. Product Return Analysis

Compare **Perishable** and **Non-Perishable** products by showing:
- Total Order Lines
- Returned Lines
- Return Percentage
### SQL Query
```sql
SELECT
    CASE
        WHEN p.is_perishable = 1 THEN 'Perishable'
        ELSE 'Non-Perishable'
    END AS product_type,
    COUNT(*) AS total_lines,
    SUM(
        CASE
            WHEN oi.item_return_flag = 1 THEN 1
            ELSE 0
        END
    ) AS returned_lines,
    SUM(
        CASE
            WHEN oi.item_return_flag = 1 THEN 1
            ELSE 0
        END
    ) * 100.0 / COUNT(*) AS return_percentage
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY product_type;
```

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



