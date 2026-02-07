# Sales & Customer Analytics (SQL Project) - Kanak Somani

## Goal
Use SQL to answer business questions about revenue, customers, and product performance.

## Dataset
Name: Northwinds dataset
Source:
Size (rows):
Time range:
Main tables/fields: The following tables were all available to be utilized:
categories, customers, employees, employeeterritories, orderdetails, orders, products, region, shippers, suppliers, territories

## SQL Environment
Database: Using MySQL on MySQL Workbench
Notes: (any setup steps)

## Business Questions
1. Revenue over time (monthly trend), 
	shown by both Query 1 and Query 2
	You can see a noticeable increase in revenue over the last 4 months of the year, 
	peaking in December/January of the new year before steadily decreasing and flattening out 
2. Top customers by revenue
	shown in Query 3
	The top 3 customers by revenue are QUICK-Stop, Save-a-lot Markets, Ernst Handel
3. New vs returning customers
	shown in Query 8 and 9
	Most loyal customers include Save-a-lot Markets and Ernst Handel
	New customers include Centro commercial Moctezuma, Lazy K Kountry Store, GROSELLA-Restaurante
4. Top products by revenue
	shown in Query 6
	top 5 products are: Chai, Chang, Aniseed Syrup, Chef Anton's Cajun Seasoning, Chef Anton's Gumbo Mix
5. Revenue by region/country
	shown in Query 7
	3 most profitable places are Rockville, Greensboro, Cary

## Key Insights (3–6 bullets)
Insight 1: Although Nancy has the 2nd most customers, she averages the 4th highest revenue. This means her overall sales numbers are not very high. Whether that is because her customers don't buy much, or because she has extreme outliers dragging down her average is a question for another analysis. 
Insight 2: High order volume does not necessarily mean high revenue. QUICK-Stop generates the most revenue whereas Save-a-lot Markets have placed the most orders. That makes revenue analysis crucial when looking order frequency. This also shows the importance of individual goods analysis as the price of each item in an order determines the total price of the order. 
Insight 3: Revenue vs order analysis also helps place customers in two groups: high frequency, low-value AND low frequency, high value. Further analysis in this sector can help companies figure out customer retention strategies and also customer behaviors/preferences.  

## Files
`queries.sql`: all final SQL queries
`screenshots/`: output screenshots of key queries

## How to Run
1. Load data into database
2. Open `queries.sql`
3. Run queries in order 