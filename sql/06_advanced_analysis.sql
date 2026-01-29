-- =====================================================
-- Advanced SQL Analysis
-- This file contains advanced SQL examples using
-- CTEs and Window Functions for trend and share analysis.
-- =====================================================


-- -----------------------------------------------------
-- 1. Monthly Revenue Growth Analysis
-- Calculates month-over-month revenue changes
-- using window functions (LAG).
-- -----------------------------------------------------

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', order_purchase_timestamp) AS order_month,
        SUM(price) AS total_revenue
    FROM vw_delivered_orders
    GROUP BY order_month
)

SELECT
    order_month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY order_month) AS previous_month_revenue,
    ROUND(
        (total_revenue - LAG(total_revenue) OVER (ORDER BY order_month))
        / LAG(total_revenue) OVER (ORDER BY order_month) * 100,
        2
    ) AS revenue_growth_pct
FROM monthly_revenue
ORDER BY order_month;



-- -----------------------------------------------------
-- 2. Category Revenue Share Analysis
-- Calculates each product category's share
-- of total revenue using window functions.
-- -----------------------------------------------------

WITH category_revenue AS (
    SELECT
        ct.product_category_name_english AS category,
        SUM(v.price) AS total_revenue
    FROM vw_delivered_orders v
    JOIN products p
        ON v.product_id = p.product_id
    JOIN category_translation ct
        ON p.product_category_name = ct.product_category_name
    GROUP BY category
)

SELECT
    category,
    total_revenue,
    ROUND(
        total_revenue / SUM(total_revenue) OVER () * 100,
        2
    ) AS revenue_share_pct
FROM category_revenue
ORDER BY total_revenue DESC;
