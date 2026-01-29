-- Top Products Analysis
-- Identifies top products by revenue and order volume.

-- Top products by revenue
SELECT
    v.product_id,
    ct.product_category_name_english AS category,
    COUNT(DISTINCT v.order_id) AS total_orders,
    SUM(v.price) AS total_revenue,
    ROUND(SUM(v.price) / COUNT(DISTINCT v.order_id), 2) AS avg_order_value
FROM vw_delivered_orders v
JOIN products p
    ON v.product_id = p.product_id
LEFT JOIN category_translation ct
    ON p.product_category_name = ct.product_category_name
GROUP BY v.product_id, category
ORDER BY total_revenue DESC
LIMIT 10;

-- Top products by order volume
SELECT
    v.product_id,
    ct.product_category_name_english AS category,
    COUNT(DISTINCT v.order_id) AS total_orders,
    SUM(v.price) AS total_revenue
FROM vw_delivered_orders v
JOIN products p
    ON v.product_id = p.product_id
LEFT JOIN category_translation ct
    ON p.product_category_name = ct.product_category_name
GROUP BY v.product_id, category
ORDER BY total_orders DESC
LIMIT 10;
