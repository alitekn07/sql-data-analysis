<p align="center">
  <a href="https://github.com/alitekn07/sql-data-analysis">
    <img src="https://i.imgur.com/Tn97RBF.png" alt="Portfolio Cover Image"/>
  </a>
</p>


# 📊 SQL Data Analysis – E-Commerce Sales & Revenue Insights

## 📌 Project Overview

This project is an end-to-end **SQL data analysis portfolio project** built using a real-world Brazilian e-commerce dataset from Kaggle. 

The objective is to analyze **sales performance, revenue trends, product categories, and top-performing products** using PostgreSQL.

**Dataset period:**  
September 2016 – October 2018


## 🎯 Business Objectives

- Analyze monthly revenue trends  
- Identify top revenue-generating product categories  
- Evaluate product-level performance  
- Understand revenue concentration and growth patterns  


## 🗂 Dataset Description

**Source:** Brazilian E-Commerce Public Dataset by Olist (Kaggle)

Key tables used in this project:

- `customers`  
- `orders`  
- `order_items`  
- `products`  
- `category_translation`  

Only **delivered orders** are included to reflect completed sales.


## 🧱 Data Model & Design

The data model follows a **simple star-schema-like structure** with `orders` as the central fact table.

To simplify analysis, a dedicated SQL view was created:

```sql
vw_delivered_orders
```

This view filters delivered orders and joins the necessary tables for analysis.

An ER diagram is included in the repository:

```
/diagrams/er_diagram.png
```
## 🧹 Data Cleaning Approach

- Filtered out non-delivered orders (cancelled, created, unavailable)
- Validated timestamps and date ranges
- Ensured correct joins between fact and dimension tables


## 📈 Analysis Overview

1️⃣ Monthly Revenue Analysis

- Monthly total revenue
- Average order value
- Month-over-month revenue growth using window functions

2️⃣ Category Revenue Analysis

- Revenue by product category
- Revenue share (%) per category
- Identification of top-performing categories

3️⃣ Top Products Analysis

- Top products by total revenue
- Order volume vs revenue comparison
- Identification of high-value and high-volume products

4️⃣ Advanced SQL Analysis

- Common Table Expressions (CTEs)
- Window functions (LAG)
- Revenue growth and percentage contribution analysis



## 📂 Project Structure

```
 sql-data-analysis/
    ├── datasets/
    │   ├── olist_customers_dataset.csv
    │   ├── olist_order_items_dataset.csv
    │   ├── olist_orders_dataset.csv
    │   ├── olist_products_dataset.csv
    │   ├── product_category_name_translation.csv
    │   └── README.md
    ├── sql/
    │   ├── 01_create_tables.sql
    │   ├── 02_create_views.sql
    │   ├── 03_monthly_revenue.sql
    │   ├── 04_category_revenue.sql
    │   ├── 05_top_products.sql
    │   └── 06_advanced_analysis.sql
    ├── outputs/
    │   ├── monthly_revenue.csv
    │   ├── category_revenue.csv
    │   └── top_products.csv
    ├── diagrams/
    │   └── er_diagram.png
    └── README.md
```

## 📊 Outputs

Key analysis results are exported as CSV files:

- Monthly revenue trends
- Category-level revenue breakdown
- Top-performing products

These outputs can be directly used in BI tools such as Power BI or Tableau.

## 🛠 Tools & Technologies

- PostgreSQL
- SQL (CTEs, Window Functions, Aggregations)
- pgAdmin
- GitHub

## 🧠 Key Insights

- Revenue shows strong growth during 2017 with noticeable seasonal patterns.
- A small number of categories contribute a significant share of total revenue.
- Some products generate high revenue despite relatively low order volumes.
- Month-over-month analysis highlights both growth and contraction periods.

## 🎤 Summary

I analyzed a real e-commerce dataset using SQL, focusing on revenue trends, category performance, and product-level insights.
I created a dedicated view for delivered orders and used window functions to analyze month-over-month growth.
The goal was to produce clean, business-oriented insights using SQL.


## 📄 Disclaimer

This project was created for **educational and portfolio purposes.**
All analyses, SQL queries, and interpretations were developed independently by the author.

The dataset used in this project is publicly available and provided by Kaggle.
No proprietary or confidential data was used.

All rights to the analytical work, structure, and presentation of this project belong to the author.
Unauthorized copying or redistribution of this project’s analytical content without proper attribution is discouraged.

                                                                                    
                                                               © 2026 Ali Tekin. All rights reserved.
