-- Category Based Revenue Analysis
-- Calculates total revenue, order count, and average order value by product category.

SELECT
    ct.product_category_name_english AS category,
    COUNT(DISTINCT v.order_id) AS total_orders,
    SUM(v.price) AS total_revenue,
    ROUND(SUM(v.price) / COUNT(DISTINCT v.order_id), 2) AS avg_order_value
FROM vw_delivered_orders v
JOIN products p
    ON v.product_id = p.product_id
JOIN category_translation ct
    ON p.product_category_name = ct.product_category_name
GROUP BY category
ORDER BY total_revenue DESC;
