-- Monday Coffee -- Data Analysis

USE monday_coffee_db;

--  Data Exploration --

SHOW TABLES;


SELECT * FROM city;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM sales;

-- Reports & Data Analysis

-- Q.1 
-- Total Customers in Each City
-- Find the number of customers in each city.
SELECT city_name,
COUNT(DISTINCT(customer_id)) AS Total_Customers 
FROM city c
JOIN customers ct 
ON c.city_id=ct.city_id
GROUP BY city_name
ORDER BY Total_Customers DESC;

-- Q.2 
-- Most Expensive Product
-- Find the top 3 product with the highest price.
SELECT Product_name,
price AS Highest_price
FROM products
ORDER BY Highest_price DESC
LIMIT 3;

-- Q.3 
-- Coffee Consumers Count
-- How many people in each city are estimated to consume coffee, given that 25% of the population does?
SELECT city_name,
ROUND(population * 0.25) AS coffee_consumers, 
city_rank
FROM city
ORDER BY coffee_consumers DESC;

-- Q.4 
-- Total Revenue from Coffee Sales
-- What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?

SELECT city_name,
SUM(total) AS total
FROM sales s
JOIN customers cst ON s.customer_id=cst.customer_id
JOIN city c ON c.city_id=cst.city_id
WHERE year(sale_date)= 2023
AND quarter(sale_date) = 4
GROUP BY city_name
ORDER BY total DESC;

-- Q.5
-- Sales Count for Each Product
-- How many units of each coffee product have been sold?
SELECT product_name,
COUNT(total) AS sales_count
FROM sales s 
JOIN products p ON s.product_id=p.product_id
GROUP BY product_name
ORDER BY sales_count DESC;

-- Q.6
-- Average Sales Amount per City
-- What is the average sales amount per customer in each city?

SELECT city_name,
SUM(total) AS total,
COUNT(cst.customer_id) AS cust_count,
ROUND(SUM(total)/COUNT(cst.customer_id)) AS avg_sale
FROM city c
JOIN customers cst ON c.city_id=cst.city_id
JOIN sales s On s.customer_id=cst.customer_id
GROUP BY city_name
ORDER BY total DESC;

-- Q.7
-- City Population and Coffee Consumers
/* Provide a list of cities along with their population, the total number of customers from each city, 
and the estimated number of coffee consumers assuming 25% of the population drinks coffee. Return city_name, 
population, total_customer, and estimated coffee_consumers.*/

SELECT city_name, population,
COUNT(customer_id) AS total_customer,
ROUND(population*0.25) AS coffee_consumers
FROM city c
JOIN customers cst ON c.city_id=cst.city_id
GROUP BY city_name, population
ORDER BY population DESC;


-- Q.8
-- Top Selling Products by City
-- What are the top 3 selling products in each city based on sales volume?

WITH sale_volume_summary AS 
(
SELECT 
city_name,
product_name,
COUNT(sale_id) as total_orders,
DENSE_RANK() OVER(PARTITION BY city_name ORDER BY COUNT(sale_id) DESC) as rank_
FROM sales as s
JOIN products as p
ON s.product_id = p.product_id
JOIN customers as c
ON c.customer_id = s.customer_id
JOIN city as ci
ON ci.city_id = c.city_id
GROUP BY city_name, product_name ) 
SELECT * FROM sale_volume_summary
WHERE rank_ <=3;

-- Q.9
-- Customer Segmentation by City
-- How many unique customers are there in each city who have purchased coffee products?

SELECT 
city_name,
COUNT(DISTINCT ct.customer_id) AS unique_customers
FROM city c
JOIN customers ct ON c.city_id = ct.city_id
JOIN sales s ON s.customer_id = ct.customer_id
JOIN products p ON p.product_id = s.product_id
WHERE p.product_name LIKE '%coffee%'
GROUP BY city_name
ORDER BY unique_customers DESC;

-- Q.10
-- Average Sale vs Rent
-- Calculate the average sales amount spent by each customer on purchases and the average estimated rent per customer in that city.

SELECT city_name, estimated_rent,
ROUND(SUM(total)/COUNT(ct.customer_id)) AS Avg_sale_per_customer,
ROUND(estimated_rent/COUNT(ct.customer_id)) AS Avg_rent_per_customer
FROM city c
JOIN customers ct ON c.city_id=ct.customer_id
JOIN sales s ON s.customer_id=ct.customer_id
GROUP BY city_name, estimated_rent;


-- Q.11. 
-- Monthly Sales Growth by City
-- Find the monthly sales for each city and calculate the percentage increase or decrease compared to the previous month.

WITH monthly_sales AS (
SELECT c.city_name,
YEAR(s.sale_date) AS year,
MONTH(s.sale_date) AS month,
SUM(s.total) AS total_sales
FROM city c
JOIN customers ct ON c.city_id = ct.city_id
JOIN sales s ON s.customer_id = ct.customer_id
GROUP BY c.city_name,
YEAR(s.sale_date),
MONTH(s.sale_date))
SELECT city_name,
year,
month,
total_sales,
LAG(total_sales) OVER(
PARTITION BY city_name 
ORDER BY year, month) AS previous_month_sales,
ROUND(((total_sales - LAG(total_sales) OVER(PARTITION BY city_name ORDER BY year, month)) /
LAG(total_sales) OVER(PARTITION BY city_name ORDER BY year, month)) * 100, 2) AS sales_growth_percentage
FROM monthly_sales
ORDER BY city_name, year, month;

-- Q.12
-- Market Potential Analysis
-- Find the top 3 cities with the highest sales and show their total sales, total rent, number of customers, and estimated coffee consumers.

SELECT 
c.city_name,
SUM(s.total) AS total_sales,
SUM(c.estimated_rent) AS total_rent,
COUNT(ct.customer_id) AS total_customers,
ROUND(c.population * 0.25) AS estimated_coffee_consumers
FROM city c
JOIN customers ct 
ON c.city_id = ct.city_id
JOIN sales s 
ON s.customer_id = ct.customer_id
GROUP BY c.city_name, c.population
ORDER BY total_sales DESC
LIMIT 3;



