-- =========================================
-- 01_create_tables.sql
-- E-Commerce SQL Data Analysis Project
-- =========================================

-- Drop tables if they already exist (safe reset)
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS category_translation CASCADE;

-- =========================================
-- Customers Table
-- =========================================
CREATE TABLE customers (
    customer_id VARCHAR PRIMARY KEY,
    customer_city VARCHAR,
    customer_state VARCHAR
);

-- =========================================
-- Orders Table
-- =========================================
CREATE TABLE orders (
    order_id VARCHAR PRIMARY KEY,
    customer_id VARCHAR,
    order_status VARCHAR,
    order_purchase_timestamp TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- =========================================
-- Products Table
-- =========================================
CREATE TABLE products (
    product_id VARCHAR PRIMARY KEY,
    product_category_name VARCHAR
);

-- =========================================
-- Category Translation Table
-- =========================================
CREATE TABLE category_translation (
    product_category_name VARCHAR PRIMARY KEY,
    product_category_name_english VARCHAR
);

-- =========================================
-- Order Items Table
-- =========================================
CREATE TABLE order_items (
    order_id VARCHAR,
    product_id VARCHAR,
    price NUMERIC,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
