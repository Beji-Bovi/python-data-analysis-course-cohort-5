-- Week 01 Thursday SQL: Practice Exercises
-- Building on Your Wednesday Python Success
-- Same Business Logic, SQL Syntax Practice

-- =============================================================================
-- INSTRUCTIONS FOR STUDENTS
-- =============================================================================

/*
Welcome to your first SQL practice session! 

Today's Goal: Apply the same analytical thinking from yesterday's Python 
success to write SQL queries.

How to Use This File:
1. Read each business question carefully
2. Write your SQL query below the question  
3. Run the query and check the results
4. Compare your approach to yesterday's Python methods
5. Build confidence: "I can do this in both Python AND SQL!"

Remember: You already know HOW to think about these problems.
You're just learning new syntax to express the same ideas.
*/

-- =============================================================================
-- WARM-UP EXERCISES: Connection and Basic Queries
-- =============================================================================

-- Exercise 1: Connection Test
-- Task: Write a query that shows "I am connected to the database!"
-- Hint: Use SELECT with a text message

-- Your solution here:
SELECT 'I am connected to the database!' AS connection_status;



-- Exercise 2: First Data View  
-- Task: View the first 5 rows from the orders table
-- Python Equivalent: orders_df.head()
-- Hint: SELECT * FROM olist_sales_data_set.olist_orders_dataset LIMIT 5;

-- Your solution here:
SELECT * FROM olist_sales_data_set.olist_orders_dataset LIMIT 5;



-- Exercise 3: Column Exploration
-- Task: Show only order_id and order_status from the first 10 orders
-- Python Equivalent: orders_df[['order_id', 'order_status']].head(10)
-- Hint: SELECT order_id, order_status FROM olist_sales_data_set.olist_orders_dataset LIMIT 10;

-- Your solution here:
SELECT
order_id,
order_status
FROM olist_sales_data_set.olist_orders_dataset
LIMIT 10;



-- =============================================================================
-- COUNTING AND BASIC STATISTICS
-- =============================================================================

-- Exercise 4: Total Record Count
-- Task: How many total orders are in our database?
-- Python Equivalent: len(orders_df)
-- Hint: SELECT COUNT(*) FROM olist_sales_data_set.olist_orders_dataset;

-- Your solution here:
SELECT
COUNT (*)
FROM olist_sales_data_set.olist_orders_dataset;



-- Exercise 5: Customer Count
-- Task: How many customers are in our database?
-- Python Equivalent: len(customers_df)
-- Hint: SELECT COUNT(*) FROM olist_sales_data_set.olist_customers_dataset;

-- Your solution here:
SELECT
COUNT(*)
FROM olist_sales_data_set.olist_customers_dataset



-- Exercise 6: Product Catalog Size
-- Task: How many products are in our catalog?
-- Python Equivalent: len(products_df)
-- Hint: SELECT COUNT(*) FROM olist_sales_data_set.olist_products_dataset;

-- Your solution here:
SELECT COUNT(*)
FROM olist_sales_data_set.olist_products_dataset



-- =============================================================================
-- SORTING AND ORDERING
-- =============================================================================

-- Exercise 7: Newest Orders First
-- Task: Show the 10 most recent orders (order_id, status, purchase timestamp)
-- Python Equivalent: orders_df.sort_values('order_purchase_timestamp', ascending=False).head(10)
-- Hint: SELECT order_id, order_status, order_purchase_timestamp FROM olist_sales_data_set.olist_orders_dataset ORDER BY order_purchase_timestamp DESC LIMIT 10;

-- Your solution here:
SELECT
order_id,
order_status,
order_purchase_timestamp
FROM olist_sales_data_set.olist_orders_dataset
ORDER BY order_purchase_timestamp DESC
LIMIT 10;




-- Exercise 8: Oldest Orders  
-- Task: Show the 5 oldest orders in our database
-- Python Equivalent: orders_df.sort_values('order_purchase_timestamp', ascending=True).head(5)
-- Hint: SELECT * FROM olist_sales_data_set.olist_orders_dataset ORDER BY order_purchase_timestamp ASC LIMIT 5;

-- Your solution here:
SELECT
order_purchase_timestamp
FROM olist_sales_data_set.olist_orders_dataset
ORDER BY order_purchase_timestamp ASC
LIMIT 5;


-- =============================================================================
-- CATEGORICAL DATA ANALYSIS
-- =============================================================================

-- Exercise 9: Order Status Breakdown
-- Task: Count how many orders exist for each order status
-- Python Equivalent: orders_df['order_status'].value_counts()
-- Hint: SELECT order_status, COUNT(*) FROM olist_sales_data_set.olist_orders_dataset GROUP BY order_status;

-- Your solution here:
SELECT COUNT (*)
FROM olist_sales_data_set.olist_orders_dataset
GROUP BY order_status;



-- Exercise 10: Customer Geographic Distribution
-- Task: Count customers by state, show top 10 states
-- Python Equivalent: customers_df['customer_state'].value_counts().head(10)
-- Hint: SELECT customer_state, COUNT(*) FROM olist_sales_data_set.olist_customers_dataset GROUP BY customer_state ORDER BY COUNT(*) DESC LIMIT 10;

-- Your solution here:
SELECT
customer_state, COUNT(*)
FROM olist_sales_data_set.olist_customers_dataset
GROUP BY customer_state
ORDER BY COUNT(*) DESC
LIMIT 10;




-- Exercise 11: Payment Method Preferences  
-- Task: What payment methods do customers use most?
-- Python Equivalent: payments_df['payment_type'].value_counts()
-- Hint: SELECT payment_type, COUNT(*) FROM olist_sales_data_set.olist_order_payments_dataset GROUP BY payment_type ORDER BY COUNT(*) DESC;

-- Your solution here:
SELECT payment_type,
COUNT(*)
FROM olist_sales_data_set.olist_order_payments_dataset
GROUP BY payment_type
ORDER BY COUNT(*) DESC;


-- =============================================================================
-- DATA EXPLORATION AND QUALITY CHECKS
-- =============================================================================

-- Exercise 12: Date Range Analysis
-- Task: Find the earliest and latest order dates in our database
-- Python Equivalent: orders_df['order_purchase_timestamp'].min(), max()
-- Hint: SELECT MIN(order_purchase_timestamp), MAX(order_purchase_timestamp) FROM olist_sales_data_set.olist_orders_dataset;

-- Your solution here:
SELECT 
MIN(order_purchase_timestamp) AS earliest_order,
MAX(order_purchase_timestamp) AS latest_order
FROM olist_sales_data_set.olist_orders_dataset;



-- Exercise 13: Payment Value Statistics
-- Task: Find minimum, maximum, and average payment values
-- Python Equivalent: payments_df['payment_value'].describe()
-- Hint: SELECT MIN(payment_value), MAX(payment_value), AVG(payment_value) FROM olist_sales_data_set.olist_order_payments_dataset;

-- Your solution here:
SELECT 
MIN(payment_value),
MAX(payment_value),
AVG(payment_value)
FROM olist_sales_data_set.olist_order_payments_dataset;


-- Exercise 14: Missing Data Check
-- Task: Count how many orders have missing delivery dates
-- Python Equivalent: orders_df['order_delivered_customer_date'].isnull().sum()
-- Hint: SELECT COUNT(*) - COUNT(order_delivered_customer_date) FROM olist_sales_data_set.olist_orders_dataset;

-- Your solution here:
SELECT 
COUNT(*) AS total_orders,
COUNT(order_delivered_customer_date) AS delivered_orders_date,
COUNT(*) - COUNT(order_delivered_customer_date) AS missing_delivery_dates
FROM olist_sales_data_set.olist_orders_dataset;



-- =============================================================================
-- BUSINESS QUESTIONS (Medium Difficulty)
-- =============================================================================

-- Exercise 15: Customer Concentration
-- Task: Which city in São Paulo (SP) state has the most customers?
-- Python Equivalent: customers_df[customers_df['customer_state'] == 'SP']['customer_city'].value_counts()
-- Hint: SELECT customer_city, COUNT(*) FROM olist_sales_data_set.olist_customers_dataset WHERE customer_state = 'SP' GROUP BY customer_city ORDER BY COUNT(*) DESC;

-- Your solution here:
SELECT customer_city,
COUNT(*) AS total_customers
FROM olist_sales_data_set.olist_customers_dataset
WHERE customer_state = 'SP'
GROUP BY customer_city
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Exercise 16: High-Value Payments
-- Task: Find all payments over R$ 1000, ordered by value (highest first)
-- Python Equivalent: payments_df[payments_df['payment_value'] > 1000].sort_values('payment_value', ascending=False)
-- Hint: SELECT * FROM olist_sales_data_set.olist_order_payments_dataset WHERE payment_value > 1000 ORDER BY payment_value DESC;

-- Your solution here:
SELECT 
payment_type,
payment_value
FROM olist_sales_data_set.olist_order_payments_dataset
WHERE payment_value > 1000
ORDER BY payment_value DESC;

-- Exercise 17: Product Category Exploration
-- Task: How many different product categories do we have? (exclude NULL values)
-- Python Equivalent: products_df['product_category_name'].nunique()
-- Hint: SELECT COUNT(DISTINCT product_category_name) FROM olist_sales_data_set.olist_products_dataset WHERE product_category_name IS NOT NULL;

-- Your solution here:
SELECT COUNT(DISTINCT product_category_name) AS unique_categories
FROM olist_sales_data_set.olist_products_dataset
WHERE product_category_name IS NOT NULL;



-- =============================================================================
-- TIME-BASED ANALYSIS
-- =============================================================================

-- Exercise 18: Monthly Order Pattern
-- Task: Count orders by month for the year 2018
-- Python Equivalent: orders_df[orders_df['order_purchase_timestamp'].dt.year == 2018].groupby(orders_df['order_purchase_timestamp'].dt.month).size()
-- Hint: SELECT EXTRACT(MONTH FROM order_purchase_timestamp) as month, COUNT(*) FROM olist_sales_data_set.olist_orders_dataset WHERE EXTRACT(YEAR FROM order_purchase_timestamp) = 2018 GROUP BY EXTRACT(MONTH FROM order_purchase_timestamp) ORDER BY month;

-- Your solution here:
SELECT 
EXTRACT(MONTH FROM order_purchase_timestamp) as month,
CASE EXTRACT(MONTH FROM order_purchase_timestamp) 
     WHEN 1 THEN 'January'
     WHEN 2 THEN 'February'
     WHEN 3 THEN 'March'
     WHEN 4 THEN 'April'
     WHEN 5 THEN 'May'
     WHEN 6 THEN 'June'
     WHEN 7 THEN 'July'
     WHEN 8 THEN 'August'
     WHEN 9 THEN 'September'
     WHEN 10 THEN 'October'
     WHEN 11 THEN 'November'
     WHEN 12 THEN 'December'
END AS month_name,
COUNT(*) AS total_orders
FROM olist_sales_data_set.olist_orders_dataset
WHERE EXTRACT(YEAR FROM order_purchase_timestamp) = 2018
GROUP BY EXTRACT(MONTH FROM order_purchase_timestamp)
ORDER BY month;

-- Exercise 19: Day of Week Analysis  
-- Task: Which day of the week has the most orders?
-- Hint: SELECT EXTRACT(DOW FROM order_purchase_timestamp) as day_of_week, COUNT(*) FROM olist_sales_data_set.olist_orders_dataset GROUP BY EXTRACT(DOW FROM order_purchase_timestamp) ORDER BY COUNT(*) DESC;

-- Your solution here:
SELECT EXTRACT(DOW FROM order_purchase_timestamp) as day_of_week,
CASE EXTRACT(DOW FROM order_purchase_timestamp)
     WHEN 0 THEN 'Sunday'
     WHEN 1 THEN 'Monday'
     WHEN 2 THEN 'Tuesday'
     WHEN 3 THEN 'Wednesday'
     WHEN 4 THEN 'Thursday'
     WHEN 5 THEN 'Friday'
     WHEN 6 THEN 'Saturday'
END AS day_name,
COUNT(*) AS total_orders
FROM olist_sales_data_set.olist_orders_dataset
GROUP BY EXTRACT(DOW FROM order_purchase_timestamp)
ORDER BY total_orders DESC;

-- =============================================================================
-- ADVANCED CHALLENGES (For Early Finishers)
-- =============================================================================

-- Challenge 20: Customer Satisfaction Overview
-- Task: Show the distribution of review scores (1-5 stars)
-- Python Equivalent: reviews_df['review_score'].value_counts().sort_index()
-- Hint: SELECT review_score, COUNT(*) FROM olist_sales_data_set.olist_order_reviews_dataset GROUP BY review_score ORDER BY review_score;

-- Your solution here:
SELECT review_score,
COUNT(*) AS total_reviews
FROM olist_sales_data_set.olist_order_reviews_dataset
GROUP BY review_score
ORDER BY review_score;

-- Challenge 21: Revenue by Payment Type
-- Task: Calculate total revenue for each payment method
-- Python Equivalent: payments_df.groupby('payment_type')['payment_value'].sum().sort_values(ascending=False)
-- Hint: SELECT payment_type, SUM(payment_value) FROM olist_sales_data_set.olist_order_payments_dataset GROUP BY payment_type ORDER BY SUM(payment_value) DESC;

-- Your solution here:
SELECT payment_type AS payment_method,
COUNT(*) AS total_transactions,
ROUND(CAST(SUM(payment_value) AS numeric), 2) AS total_revenue
FROM olist_sales_data_set.olist_order_payments_dataset
GROUP BY payment_type
ORDER BY SUM(payment_value) DESC;

-- Challenge 22: Geographic Revenue Analysis
-- Task: Which state generates the most revenue? (Join orders, customers, payments)
-- This is advanced - combines multiple tables!
-- Hint: You'll need to JOIN olist_sales_data_set.olist_orders_dataset, olist_sales_data_set.olist_customers_dataset, and olist_sales_data_set.olist_order_payments_dataset

-- Your solution here:
SELECT 
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(CAST(SUM(p.payment_value) AS numeric), 2) AS total_revenue,
    ROUND(CAST(AVG(p.payment_value) AS numeric), 2) AS avg_order_value
FROM olist_sales_data_set.olist_orders_dataset o
JOIN olist_sales_data_set.olist_customers_dataset c ON o.customer_id = c.customer_id
LEFT JOIN olist_sales_data_set.olist_order_payments_dataset p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY SUM(p.payment_value) DESC
LIMIT 10;

-- =============================================================================
-- REFLECTION SECTION
-- =============================================================================

-- Exercise 23: Personal Reflection
-- Task: Write a comment comparing your experience today vs. yesterday
-- Today felt more productive compared to yesterday because i was able to understanstand the concept between python and SQL
-- and also getting farmiliar with the SQL syntax.

/*
Reflection Questions:
1. Which felt more natural - Python or SQL? Why?
2. What was similar between Python DataFrames and SQL tables?
3. What was different?
4. Which business questions were easier to answer in SQL vs Python?
5. What concepts from yesterday helped you today?

Write your thoughts here:
1. Python because it feels flexible and intuitive. With Python and pandas, I can manipulate data step by step, test code easily, and instantly see results.
2. They both store data in tablar form with rows and column. 
3. In SQL you write queries to tell the database what result you want, while in Python you work directly with the data and combine it with other logic and visualization tools.
4. Simple aggregations and filtering were easier in SQL because of its concise syntax. More complex data manipulations and visualizations were easier in Python.
5. Understanding basic data operations like filtering, grouping, and aggregation from yesterday helped a lot today.

*/

-- =============================================================================
-- SUCCESS CHECK: Can You Do These Without Hints?
-- =============================================================================

-- Quick Check 1: Count total customers
SELECT
COUNT(*) AS total_customers
FROM olist_sales_data_set.olist_customers_dataset;

-- Quick Check 2: Show 5 newest orders
SELECT *
FROM olist_sales_data_set.olist_orders_dataset
ORDER BY order_purchase_timestamp DESC
LIMIT 5;

-- Quick Check 3: List all unique order statuses
SELECT DISTINCT order_status
FROM olist_sales_data_set.olist_orders_dataset;

-- Quick Check 4: Find the most expensive single payment
SELECT
payment_type,
payment_value
FROM olist_sales_data_set.olist_order_payments_dataset
ORDER BY payment_value DESC
LIMIT 1;
-- =============================================================================
-- BONUS: Creative Analysis
-- =============================================================================

-- Bonus Exercise: Choose Your Own Adventure
-- Task: Write a query that answers a business question YOU find interesting
-- Examples: 
-- - Which product weighs the most?
-- - What's the longest product name?
-- - Which month had the lowest sales?
-- - How many customers are from your favorite Brazilian city?

-- Your creative query here:
-- Heaviest product
SELECT *
FROM olist_sales_data_set.olist_products_dataset
WHERE product_weight_g IS NOT NULL
ORDER BY product_weight_g DESC
LIMIT 1;

-- Longest product name
SELECT *
FROM olist_sales_data_set.olist_products_dataset
WHERE product_name_lenght IS NOT NULL
ORDER BY product_name_lenght DESC
LIMIT 1;

-- Month with the Lowest sales
SELECT
EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
CASE EXTRACT(MONTH FROM order_purchase_timestamp)
     WHEN 1 THEN 'January'
     WHEN 2 THEN 'February'
     WHEN 3 THEN 'March'
     WHEN 4 THEN 'April'
     WHEN 5 THEN 'May'
     WHEN 6 THEN 'June'
     WHEN 7 THEN 'July'
     WHEN 8 THEN 'August'
     WHEN 9 THEN 'September'
     WHEN 10 THEN 'October'
     WHEN 11 THEN 'November'
     WHEN 12 THEN 'December'
END AS month_name,
SUM(oi.price) AS total_sales
FROM olist_sales_data_set.olist_orders_dataset o
JOIN olist_sales_data_set.olist_order_items_dataset oi ON o.order_id = oi.order_id
GROUP BY month, month_name
ORDER BY total_sales ASC
LIMIT 10;

*/
CONGRATULATIONS! 🎉

If you completed these exercises, you've successfully:

✅ Connected SQL concepts to yesterday's Python success
✅ Written basic SELECT queries with business context  
✅ Used COUNT, MIN, MAX, AVG for data analysis
✅ Applied sorting and filtering for insights
✅ Analyzed categorical data using GROUP BY
✅ Performed time-based analysis with date functions
✅ Gained confidence in database querying

Key Insight: You used the same analytical thinking as yesterday,
just with different syntax. The business questions and logical
approach remained consistent!

Next Steps: 
- Review solutions in the solutions folder
- Prepare for Week 2: Data Filtering (WHERE clauses)
- Feel proud - you can now work with both Python AND SQL! 💪
*/