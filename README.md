# SQL_POWERBI_RETAIL_SALES_ANALYSIS

## Overview
This project analyzes retail sales transactions using SQL for data querying and Power BI for reporting. The dataset contains transaction level records including product category, quantity, customer attributes (age and gender), order time, and sales value. The objective is to generate reproducible analytical outputs covering sales performance, customer behavior, and time based patterns.

## Project structure
- SQL scripts used to generate all analytical results
- Power BI report file containing the final dashboard
- Raw dataset used for analysis
- README documenting queries and visuals

## SQL analysis
Sales analysis
- Retrieve all transactions for the date 2022-11-05
- Compute total sales per category
- Identify transactions with total_sale > 1000

Customer analysis
- Calculate the average age of customers who purchased Beauty products
- Count transactions by gender for each product category
- Count distinct customers per category

Performance analysis
- Identify the highest revenue month for each year
- Rank the top five customers by total sales value
- Classify orders into time shifts (Morning, Afternoon, Evening) and count orders per shift

## Power BI dashboard
- Table of top customers ranked by total sales
- Customer distribution by purchase shift (Morning, Afternoon, Evening)
- KPI cards for total sales and average sales
- Bar chart showing sales amount and transaction count by category and gender
