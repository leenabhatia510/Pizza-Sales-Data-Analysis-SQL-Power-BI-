-- KPI's

-- 1. Total Revenue: The sum of the total price of all the pizza orders

select sum(total_price) as Total_Revenue from pizza_sales

-- 2. Average order value: The average amount spent per order
-- dividing the total revenue by the total number of orders.

select count(distinct order_id) as total_orders from pizza_sales

select sum(total_price) / count(distinct order_id) from pizza_sales

-- 3. Total Pizza sold: the sum of the quantity of all pizzas sold.

select sum(quantity) as total_pizza_sold from pizza_sales

-- 4. Total Orders: The total number of orders placed.

select count(distinct order_id) as total_orders from pizza_sales

-- 5. Average Pizzas Per Order: The average number of pizzas sold per order
-- dividing total number of pizzas sold by the total number of orders.

select cast(sum(quantity) / count(distinct order_id) as decimal(10,2)) as Average_pizzas_per_order  from pizza_sales



-- DAILY TRENDS FOR TOTAL ORDERS


SELECT 
TRIM(TO_CHAR(order_date, 'Day')) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY TRIM(TO_CHAR(order_date, 'Day'))
ORDER BY total_orders DESC


-- monthly trend for Total Orders

SELECT
EXTRACT(MONTH FROM order_date) AS order_month, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY EXTRACT(MONTH FROM order_date)

SELECT 
TRIM(TO_CHAR(order_date, 'MONTH')) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY TRIM(TO_CHAR(order_date, 'MONTH'))
ORDER BY total_orders DESC


-- Percentage of sales by Pizza Category: will  divide total sales of each category with the total sales of all the category * 100 to get the percentage


select * from pizza_sales

SELECT pizza_category, sum(total_price) * 100 / (SELECT sum(total_price) from pizza_sales WHERE EXTRACT(MONTH FROM order_date) = 1) AS total_sales
FROM pizza_sales 
WHERE EXTRACT(MONTH FROM order_date) = 1
GROUP BY pizza_category



-- Percentage of sales by Pizza size

SELECT pizza_size, sum (total_price) * 100 / (SELECT sum(total_price) from pizza_sales WHERE EXTRACT(MONTH FROM order_date) = 1 ) AS total_sales
FROM pizza_sales
WHERE EXTRACT(MONTH FROM order_date) = 1
GROUP BY pizza_size


-- Top 5 Best sellers by revenue, Total Quantity and Total Orders

SELECT pizza_name, SUM(total_price) as Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue DESC
limit 5

-- Top 5 Best sellers by  Total Quantity and Total Orders

SELECT pizza_name, SUM(quantity) as Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Quantity DESC
limit 5

-- Top 5 Best sellers by  Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) as Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Orders DESC
limit 5


SELECT current_user;

