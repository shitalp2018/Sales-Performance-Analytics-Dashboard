CREATE DATABASE sales_dashboard;
USE sales_dashboard;

CREATE TABLE sales(
  Ship_Mode VARCHAR(50),
  Segment VARCHAR(50),
  Country VARCHAR(50),
  City VARCHAR(100),
  State VARCHAR(100),
  Postal_Code INT,
  Region VARCHAR(50),
  Category VARCHAR(50),
  Sub_Category VARCHAR(50),
  Sales DECIMAL(10, 2),
  Quantity INT,
  Discount DECIMAL(5, 2),
  Profit DECIMAL(10, 2),
  Profit_Margin DECIMAL(10,2)
);

SELECT * FROM sales;

-- Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM sales;

-- Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM sales;

-- Total Quantity Sold
SELECT SUM(Quantity) AS Total_Quantity
FROM sales;

-- Average Sales per Order
SELECT AVG(Sales) AS Avg_Sales
FROM sales;

-- Profit Margin(%)
SELECT ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_margin_Percentage
FROM sales;

-- Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Region;

-- Profit by Region
SELECT Region, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Region;

-- Most Profitable Region
SELECT Region, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Region
ORDER BY Total_Profit DESC
LIMIT 1;

-- Least Profitable Region
SELECT Region, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Region
ORDER BY Total_Profit ASC
LIMIT 1;

-- Sales by Category
SELECT Category, SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Category;

-- Profit by Category 
SELECT Category, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Category;

-- Sales by Sub-Category
SELECT Sub_Category, SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Sub_Category;

-- Profit by Sub-Category
SELECT Sub_Category, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Sub_Category;

-- Sub-categories with negative profit
SELECT Sub_Category, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Sub_Category
HAVING SUM(Profit) < 0;

-- Regions with negative profit
SELECT Region, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Region
HAVING SUM(Profit) < 0;

-- Discount and Profit Analysis by Category
SELECT Category, AVG(Discount) AS Avg_Discount, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Category;

-- Sales by Segment
SELECT Segment, sum(sales) AS Total_Sales
FROM sales
GROUP BY Segment;

-- Profit by Segment
SELECT Segment, sum(Profit) AS Total_Profit
FROM sales
GROUP BY Segment;

-- Most Valuable Segment
SELECT Segment, SUM(Profit) AS Total_Profit, SUM(sales) AS Total_Sales
FROM sales
GROUP BY Segment
ORDER BY Total_Profit DESC
LIMIT 1;

-- Average Discount by Category
SELECT Category, AVG(Discount) AS Avg_Discount
FROM sales
GROUP BY Category;

-- Profit by Discount Level
SELECT Discount, AVG(Profit) AS Avg_Profit
FROM sales
GROUP BY Discount
ORDER BY Discount DESC;

-- Top discounted categories 
SELECT Category, AVG(Discount) AS Avg_Discount
FROM sales
GROUP BY Category
ORDER BY Avg_Discount DESC
LIMIT 1;

-- Top Sub-Categories by Sales 
SELECT Sub_Category, SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Sub_Category
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top Sub-Categories by Profit
SELECT Sub_Category, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Sub_Category
ORDER BY Total_Profit DESC
LIMIT 10;

-- Top 10 States by Sales
SELECT State, SUM(Sales) AS Total_Sales
FROM sales
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top 10 States by Profit
SELECT State, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 10;

-- States with losses
SELECT State, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY State
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;

-- Profit Margin by Category
SELECT Category, ROUND((SUM(Profit)/SUM(SALES))*100, 2) AS Profit_Margin
FROM sales
GROUP BY Category;

-- Profit Margin by Region
SELECT Region, ROUND((SUM(Profit)/SUM(Sales))*100, 2) AS Profit_Margin
FROM sales
GROUP BY Region;

-- Highest Sales Category
SELECT Category, SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC
LIMIT 1;

-- Highest Profit Category
SELECT Category, SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Category
ORDER BY Total_Profit DESC
LIMIT 1;

-- Quantity Sold by Category
SELECT Category, SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY Category;
