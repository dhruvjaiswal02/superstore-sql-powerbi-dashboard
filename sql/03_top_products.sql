SELECT 
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;
