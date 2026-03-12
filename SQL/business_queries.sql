-- Top 10 product families by total sales
SELECT family,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY family
ORDER BY total_sales DESC
LIMIT 10;

-- Top 10 stores by total sales
SELECT store_nbr,
       ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY store_nbr
ORDER BY total_sales DESC
LIMIT 10;

-- Monthly sales trend
SELECT strftime('%Y-%m', date) AS year_month,
       ROUND(SUM(sales), 2) AS monthly_sales
FROM sales
GROUP BY year_month
ORDER BY year_month;

-- Promotion vs no promotion
SELECT CASE
           WHEN onpromotion > 0 THEN 'Promotion'
           ELSE 'No Promotion'
       END AS promo_status,
       ROUND(AVG(sales), 2) AS avg_sales,
       COUNT(*) AS row_count
FROM sales
GROUP BY promo_status;

-- Sales by store type
SELECT st.type,
       ROUND(SUM(s.sales), 2) AS total_sales,
       ROUND(AVG(s.sales), 2) AS avg_sales
FROM sales s
JOIN stores st
  ON s.store_nbr = st.store_nbr
GROUP BY st.type
ORDER BY total_sales DESC;

-- Average sales by weekday
SELECT CASE strftime('%w', date)
           WHEN '0' THEN 'Sunday'
           WHEN '1' THEN 'Monday'
           WHEN '2' THEN 'Tuesday'
           WHEN '3' THEN 'Wednesday'
           WHEN '4' THEN 'Thursday'
           WHEN '5' THEN 'Friday'
           WHEN '6' THEN 'Saturday'
       END AS weekday,
       ROUND(AVG(sales), 2) AS avg_sales
FROM sales
GROUP BY strftime('%w', date)
ORDER BY strftime('%w', date);