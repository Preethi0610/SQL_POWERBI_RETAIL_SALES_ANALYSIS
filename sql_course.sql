--create table

create table retail_sales(
     transactions_id INT PRIMARY KEY,
     sale_date DATE,
     sale_time TIME,
     customer_id INT,
     gender VARCHAR(25),
     age   INT,
     category VARCHAR(25),
     quantity INT,
     price_per_unit FLOAT,
     cogs FLOAT,
     total_sale FLOAT

);

SELECT * FROM retail_sales;

SELECT COUNT(*) FROM retail_sales;

--DATA CLEANING(STEP:1)

SELECT * FROM retail_sales
WHERE sale_date is NULL;

SELECT * FROM retail_sales
WHERE sale_time is NULL;

--check for all columns.

SELECT * FROM retail_sales
WHERE sale_date is NULL 
or transactions_id is NULL
or customer_id is NULL
or gender is NULL
or category is NULL
or quantity is NULL
or price_per_unit is NULL
or cogs is NULL
or total_sale is null ;

delete from retail_sales
WHERE sale_date is NULL 
or transactions_id is NULL
or customer_id is NULL
or gender is NULL
or category is NULL
or quantity is NULL
or price_per_unit is NULL
or cogs is NULL
or total_sale is null ;

--DATA EXPLORATION(STEP:2)

--how many sales we have?
select count(*) as total_sales
from retail_sales;

--how many customers we have
select count(Distinct customer_id) as customers_total
from retail_sales;

--total category like things
select distinct category as diff_category_today
from retail_sales;

--DATA ANALYSIS(STEP:3)

--Q1 Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT * FROM retail_sales 
WHERE sale_date = '2022-11-05';


--Q2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

SELECT * FROM retail_sales
WHERE category = 'Clothing'
AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
AND quantity >= 4;


--Q3 Write a SQL query to calculate the total sales (total_sale) for each category.:

SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1

--Q4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

SELECT ROUND(AVG(AGE),2) AS CUST_AGE
FROM retail_sales
WHERE CATEGORY = 'Beauty';

--Q5 Write a SQL query to find all transactions where the total_sale is greater than 1000.:

SELECT * FROM retail_sales
WHERE total_sale > 1000;

--Q6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

SELECT category, gender, COUNT(*) as total_transactions
FROM retail_sales
group by 1,2
order by 1;

--Q7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:


SELECT 
     year, month, avg_sales
FROM 
(
SELECT 
 EXTRACT(YEAR FROM sale_date) as year,
 EXTRACT(MONTH FROM sale_date) as month,
 AVG(total_sale) as avg_sales, 
 RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank

 FROM retail_sales
 GROUP BY 1,2
) AS t1 
WHERE rank = 1;

--Q8 Write a SQL query to find the top 5 customers based on the highest total sales

SELECT 
   customer_id, SUM(total_sale) AS total_sales
   FROM retail_sales
   GROUP BY 1
   ORDER BY 2 DESC
   LIMIT 5;

--Write a SQL query to find the number of unique customers who purchased items from each category

SELECT category, COUNT(DISTINCT customer_id) AS unique_customers FROM retail_sales
GROUP BY category;

--Q10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17

WITH hourly_sale
AS
(
SELECT *,
    CASE
    WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'MORNING'
    WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'AFTERNOON'
    ELSE 'EVENING'
    END AS shift
    FROM retail_sales
)
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift
 

 /* Customer Demographics: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
High-Value Transactions: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
Sales Trends: Monthly analysis shows variations in sales, helping identify peak seasons.
Customer Insights: The analysis identifies the top-spending customers and the most popular product categories.
*/