--  SECTION 1:EASY BUSINESS PROBLEMS (Core Metrics)

-- 1. Product Category Revenue Analysis
-- Business Problem: Inventory managers need to know which product category generates the highest total sales value to optimize warehouse space allocation.
SELECT 
    Product_Category, 
    SUM(Order_Value_INR) AS Total_Sales_INR,
    COUNT(Order_ID) AS Total_Orders_Count
FROM ecommerce_data
GROUP BY Product_Category
ORDER BY Total_Sales_INR DESC;


-- 2. Delivery Delay Identification by Platform
-- Business Problem: Operations leads want to know the total number of orders that experienced delays on each platform to evaluate courier efficiency.
SELECT 
    Platform, 
    COUNT(Order_ID) AS Total_Delayed_Orders
FROM ecommerce_data
WHERE Delivery_Delay = 'Yes'
GROUP BY Platform;


-- 3. High-Risk Category for Refunds
-- Business Problem: The quality assurance team wants to know which product category triggers the highest volume of refund requests.
SELECT 
    Product_Category, 
    COUNT(Order_ID) AS Refund_Requests_Count
FROM ecommerce_data
WHERE Refund_Requested = 'Yes'
GROUP BY Product_Category
ORDER BY Refund_Requests_Count DESC;


-- 4. Customer Service Scorecard
-- Business Problem: Customer experience managers need to track the average service rating given by users across the different delivery apps.
SELECT 
    Platform, 
    ROUND(AVG(Service_Rating), 2) AS Average_Customer_Rating
FROM ecommerce_data
GROUP BY Platform;


-- 5. Flagging Critical Complaints
-- Business Problem: Support teams need a quick extraction of the 10 most recent orders where a refund was requested and the customer gave a 1-star rating, to reach out immediately.
SELECT 
    Order_ID, 
    Platform, 
    Product_Category, 
    Customer_Feedback
FROM ecommerce_data
WHERE Service_Rating = 1 AND Refund_Requested = 'Yes'
ORDER BY Order_Date_Time DESC
LIMIT 10;


-- SECTION 2:MODERATE BUSINESS PROBLEMS (Data Manipulation)

-- 6. Delay Impact on Refund Customer Behavior
-- Business Problem: Business strategy wants to see how much a delivery delay increases the likelihood of a customer asking for a refund.
SELECT 
    Delivery_Delay,
    COUNT(Order_ID) AS Total_Orders,
    COUNT(CASE WHEN Refund_Requested = 'Yes' THEN 1 END) AS Total_Refund_Requests
FROM ecommerce_data
GROUP BY Delivery_Delay;


-- 7. High-Value Order Friction Analysis
-- Business Problem: Large orders are high priority. Finance wants to track how often orders worth more than 1,000 INR experience a delivery delay, grouped by platform.
SELECT 
    Platform,
    COUNT(Order_ID) AS Total_High_Value_Orders,
    COUNT(CASE WHEN Delivery_Delay = 'Yes' THEN 1 END) AS Delayed_High_Value_Orders
FROM ecommerce_data
WHERE Order_Value_INR > 1000
GROUP BY Platform;


-- 8. Customer Satisfaction vs. Speed Thresholds
-- Business Problem: Product teams want to compare average customer satisfaction scores when deliveries take 20 minutes or less versus when they stretch past 40 minutes.
SELECT 
    CASE 
        WHEN Delivery_Time_Minutes <= 20 THEN 'Fast (<= 20 Mins)'
        WHEN Delivery_Time_Minutes > 40 THEN 'Slow (> 40 Mins)'
        ELSE 'Standard (21-40 Mins)'
    END AS Speed_Category,
    COUNT(Order_ID) AS Total_Orders,
    ROUND(AVG(Service_Rating), 2) AS Avg_User_Rating
FROM ecommerce_data
GROUP BY Speed_Category; -- Grouping by alias is clean and efficient in modern MySQL


-- 9. Evaluating Lost Capital on Refunds
-- Business Problem: Finance needs to audit the total amount of capital stuck in orders where a refund was requested, broken down by platform and product group.
SELECT 
    Platform,
    Product_Category,
    SUM(Order_Value_INR) AS Total_Refund_Value_At_Risk
FROM ecommerce_data
WHERE Refund_Requested = 'Yes'
GROUP BY Platform, Product_Category
ORDER BY Platform, Total_Refund_Value_At_Risk DESC;