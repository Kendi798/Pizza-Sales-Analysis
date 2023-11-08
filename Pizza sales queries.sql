Select * from pizza_sales
Select SUM(total_price) AS Total_Revenue from pizza_sales
select SUM(total_price)/COUNT(DISTINCT order_id)AS Average_Order_Value from pizza_sales
Select SUM(quantity) AS Total_pizza_sales from pizza_sales
Select COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales
Select CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10 , 2)) AS DECIMAL (10 , 2)) AS Avg_pizza_per_order from pizza_sales
Select DATENAME(DW,order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders from pizza_sales 
GROUP BY DATENAME(DW,order_date)
Select DATENAME(Month,order_date) AS month_name, COUNT(DISTINCT order_id) AS Total_monthly_orders from pizza_sales GROUP BY DATENAME(Month,order_date) ORDER BY Total_monthly_orders DESC
Select pizza_category,(SUM(total_price) * 100) / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date)=1) AS Category_Percentage
FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category ORDER BY Category_Percentage DESC
Select pizza_size,CAST((SUM(total_price) * 100) / CAST((SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date)=1) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Category_Percentage
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date)=1
GROUP BY pizza_size ORDER BY Category_Percentage DESC
Select TOP 5 pizza_name,sum(total_price) AS Total_revenue from pizza_sales 
GROUP BY pizza_name
ORDER BY Total_revenue DESC
Select TOP 5 pizza_name,sum(quantity) AS Total_Quantity from pizza_sales 
GROUP BY pizza_name
ORDER BY Total_Quantity DESC
Select TOP 5 pizza_name,count(DISTINCT order_id) AS Total_Orders from pizza_sales 
GROUP BY pizza_name
ORDER BY Total_Orders DESC