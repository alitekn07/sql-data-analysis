-- =========================================
-- 02_create_views.sql
-- E-Commerce SQL Data Analysis Project
-- =========================================

-- View: Delivered Orders
-- Purpose:
-- Simplify analysis by filtering only completed (delivered) orders
-- and joining required tables into a single analytical layer.

CREATE OR REPLACE VIEW vw_delivered_orders AS
SELECT
    o.order_id,
    o.order_purchase_timestamp,
    oi.product_id,
    oi.price
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';
