-- Monthly Revenue and Order Analysis
-- This query calculates monthly total revenue, order count,
-- and average order value (AOV) for delivered orders.

SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(price) AS total_revenue,
    ROUND(SUM(price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM vw_delivered_orders
GROUP BY order_month
ORDER BY order_month;
