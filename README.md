# SQL_POWERBI_RETAIL_SALES_ANALYSIS

> Turning rows of receipts into the kind of insights that actually pay rent.

## Overview
A retail sales analytics project that uses **SQL** to do the heavy lifting and **Power BI** to make the numbers presentable in polite company. The dataset captures transaction-level activity product category, quantity, customer age and gender, order time, and sale value and the goal is to produce clean, reproducible answers to the questions every retail team eventually asks: *who's buying, what's selling, and when?*

## Project Structure
- **SQL scripts** - every query behind the analysis, ready to re-run
- **Power BI report** - the final dashboard (`.pbix`)
- **Raw dataset** - the source of truth, untouched
- **README** - this file, doing its best to explain everything above

## SQL Analysis

**Sales**
- Pull all transactions for `2022-11-05` (a perfectly ordinary Saturday, statistically speaking)
- Total sales by category
- High-value transactions where `total_sale > 1000` the customers we want to keep

**Customers**
- Average age of customers buying **Beauty** products
- Transaction count by gender within each category
- Distinct customer count per category

**Performance**
- Highest-revenue month per year the wins worth repeating
- Top **5** customers by total sales value
- Orders bucketed into **Morning / Afternoon / Evening** shifts, with counts per shift

## Power BI Dashboard
- **Top Customers** table — ranked by total sales
- **Purchase Shift** breakdown — morning people vs. evening shoppers
- **KPI Cards** — total sales and average sale value, front and center
- **Category × Gender** bar chart — sales amount and transaction count, side by side

## Dashboard Preview

<img width="1338" height="740" alt="Retail Sales Dashboard" src="https://github.com/user-attachments/assets/7ae40a6f-a509-4c41-a0ea-4529bfcd101d" />

*My first attempt at building a dashboard static for now, but a solid foundation. Future iterations will bring in slicers, drill-throughs, and interactivity.*


