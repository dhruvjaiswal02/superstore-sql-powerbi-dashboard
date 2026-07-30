WITH yearly_revenue AS (
    SELECT 
        YEAR(order_date) AS order_year,
        SUM(sales) AS total_revenue
    FROM orders
    GROUP BY YEAR(order_date)
)
SELECT 
    order_year,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY order_year) AS previous_year_revenue,
    ROUND((total_revenue - LAG(total_revenue) OVER (ORDER BY order_year)) 
          / LAG(total_revenue) OVER (ORDER BY order_year) * 100, 2) AS yoy_growth_pct
FROM yearly_revenue
ORDER BY order_year;