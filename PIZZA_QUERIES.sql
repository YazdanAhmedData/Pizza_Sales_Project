--Pizza store project
DROP TABLE IF EXISTS pizza;
CREATE TABLE pizza(
    pizza_id INT,
    order_id INT,
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date VARCHAR(20),
    order_time TIME,
    unit_price NUMERIC(10,2),
    total_price NUMERIC(10,2),
    pizza_size VARCHAR(50),
    pizza_category VARCHAR(50),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(100)
);
SELECT * FROM pizza;
--1.Total Revenue
SELECT 
      SUM(total_price) AS Total_Revenue 
FROM pizza;

--2.Average Order Value
SELECT 
     SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza;

--3.Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza;

--4.Total Orders Placed
SELECT
      COUNT(DISTINCT order_id) AS Total_Orders 
	  FROM pizza;

--5.Average Pizzas Per Order
SELECT 
      CAST(SUM(quantity) AS DECIMAL(10,2)) /
	  CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS Avg_Pizza_Per_Order
FROM pizza;

-- Hourly Trend for Total Pizzas Sold
SELECT 
     EXTRACT(HOUR FROM order_time) AS order_hour,
     SUM(quantity) AS total_pizzas_sold
FROM pizza
GROUP BY EXTRACT(HOUR FROM order_time)
ORDER BY order_hour;

--Weekly Trend For Total Hours
SELECT 
    EXTRACT(ISOYEAR FROM TO_DATE(order_date, 'DD-MM-YYYY'))::INT AS order_year,
    EXTRACT(WEEK FROM TO_DATE(order_date, 'DD-MM-YYYY'))::INT AS week_number,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza
GROUP BY 
    EXTRACT(ISOYEAR FROM TO_DATE(order_date, 'DD-MM-YYYY')),
    EXTRACT(WEEK FROM TO_DATE(order_date, 'DD-MM-YYYY'))
ORDER BY 
    order_year,
    week_number;

--Percentage of Sales By Pizza Category
SELECT 
    pizza_category,
    ROUND(
        SUM(total_price) * 100.0 / (
            SELECT SUM(total_price)
            FROM pizza
            WHERE EXTRACT(
                MONTH FROM TO_DATE(order_date, 'DD-MM-YYYY')
            ) = 1
        ),
        2
    ) AS percentage_sales
FROM pizza
WHERE EXTRACT(
    MONTH FROM TO_DATE(order_date, 'DD-MM-YYYY')
) = 1
GROUP BY pizza_category;

--Percentage of sales by Pizza size 
SELECT 
    pizza_size,
    ROUND(
        SUM(total_price) * 100.0 / (
            SELECT SUM(total_price)
            FROM pizza
            WHERE EXTRACT(
                MONTH FROM TO_DATE(order_date, 'DD-MM-YYYY')
            ) = 1
        ),
        2
    ) AS percentage_sales
FROM pizza
WHERE EXTRACT(
    MONTH FROM TO_DATE(order_date, 'DD-MM-YYYY')
) = 1
GROUP BY pizza_size;

--Top 5 Best Sellers By Revenue , Total Quantity and Total Orders
SELECT 
    pizza_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;