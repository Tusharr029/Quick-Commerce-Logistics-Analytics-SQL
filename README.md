# Quick-Commerce-Logistics-Analytics-SQL🚀

## 📌 Overview
This project focuses on analyzing over **100,000 rows** of operational and transactional data from major quick-commerce grocery delivery platforms: **Blinkit**, **Swiggy Instamart**, and **JioMart**. 

Using **MySQL**, this project solves critical real-world business problems faced by quick-commerce companies daily—ranging from supply chain delays and inventory management to customer retention boundaries and financial refund audits.

---

## 📊 Dataset Schema (`ecommerce_data`)
The analysis is performed on the `ecommerce_data` table, which captures multi-dimensional aspects of quick-commerce transactions:

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `Order_ID` | `VARCHAR(50)` | Unique identifier for each transaction (Primary Key) |
| `Customer_ID` | `VARCHAR(50)` | Unique identifier for the customer |
| `Platform` | `VARCHAR(50)` | The e-commerce app used (Blinkit, Swiggy Instamart, JioMart) |
| `Order_Date_Time` | `DATETIME` | Timestamp of when the order was placed |
| `Delivery_Time_Minutes` | `INT` | Total time taken for delivery |
| `Product_Category` | `VARCHAR(50)` | Category of food/goods ordered (Dairy, Beverages, Grocery, etc.) |
| `Order_Value_INR` | `DECIMAL(10,2)`| Total bill amount in Indian Rupees |
| `Customer_Feedback` | `TEXT` | Text feedback left by the customer |
| `Service_Rating` | `INT` | Customer satisfaction rating (1 to 5) |
| `Delivery_Delay` | `VARCHAR(3)` | Indicates if the order breached standard timing (Yes/No) |
| `Refund_Requested` | `VARCHAR(3)` | Indicates if the customer filed for a refund (Yes/No) |

---

## 📈 Business Insights Derived

### 🟢 Tier 1: Core Operations Metrics (Easy Level)
1. **Product Category Revenue Analysis:** Pinpoints which inventory divisions generate the highest sales volume to guide warehouse shelf-allocation.
2. **Delivery Delay Tracking:** Identifies which quick-commerce platform experiences the highest frequency of transit delays.
3. **Refund Risk Analysis:** Discovers which product lines are prone to quality defects resulting in refund requests.
4. **App Service Scorecard:** Compares the overall customer satisfaction baseline across competitors.
5. **Critical Incident Escalation:** Extracts immediate, actionable lists of low-rated, high-friction customer complaints for retention teams.

### 🟡 Tier 2: Strategic Insights & Financial Impact (Moderate Level)
6. **Delay vs. Refund Correlation:** Measures the mathematical impact of delivery delays on driving customer returns.
7. **High-Value Order Friction:** Monitors fulfillment success rates specifically for high-ticket orders (>1,000 INR).
8. **Fulfillment Speed Thresholds:** Evaluates customer sentiment gaps when delivery times cross from ultra-fast (≤20 mins) to delayed (>40 mins).
9. **Capital-at-Risk Audit:** Quantifies the exact revenue leaks caused by product categories experiencing heavy refund payouts.

---

## 🛠️ Tech Stack & Key Concepts Used
* **Database Management System:** MySQL
* **SQL Concepts:** Data Aggregations (`SUM`, `AVG`, `COUNT`), Grouping & Sorting (`GROUP BY`, `ORDER BY`), Conditional Logic Filters (`CASE WHEN`), String Filtering, and Table Transformations.

---
