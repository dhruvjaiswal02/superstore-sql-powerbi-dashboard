SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales) AS total_revenue
FROM orders
GROUP BY order_year, order_month
ORDER BY order_year, order_month;