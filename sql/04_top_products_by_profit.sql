SELECT 
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    RANK() OVER (ORDER BY SUM(profit) DESC) AS profit_rank
FROM orders
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;
