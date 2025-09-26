create database bank_churners;

use bank_churners;

CREATE TABLE customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY, -- extra ID for uniqueness

    Attrition_Flag VARCHAR(20),
    Customer_Age INT,
    Gender VARCHAR(10),
    Dependent_count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    Income_Category VARCHAR(30),
    Card_Category VARCHAR(20),
    Months_on_book INT,
    Total_Relationship_Count INT,
    Months_Inactive_12_mon INT,
    Contacts_Count_12_mon INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Avg_Open_To_Buy DECIMAL(10,2),
    Total_Amt_Chng_Q4_Q1 DECIMAL(5,2),
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Total_Ct_Chng_Q4_Q1 DECIMAL(5,2),
    Avg_Utilization_Ratio DECIMAL(5,2)
);

select * from customers limit 10;

select count(*) from customers;


SELECT Attrition_Flag, COUNT(*) AS total_customers
FROM customers
GROUP BY Attrition_Flag;

SELECT Gender, COUNT(*) 
FROM customers
GROUP BY Gender;

SELECT AVG(Customer_Age) AS avg_age, AVG(Credit_Limit) AS avg_credit
FROM customers;

------------------------------------------------------
-- 1. CUSTOMER OVERVIEW
------------------------------------------------------

-- Q1: Active vs Churned Customers
SELECT Attrition_Flag, COUNT(*) AS total_customers
FROM customers
GROUP BY Attrition_Flag;
-- Insight: Out of 10127 total customers, 8500 customers are active and 1627 customers have churned. 
-- This shows that churn affects a smaller portion, but still represents a meaningful challenge.

-- Q2: Gender Distribution
SELECT Gender, COUNT(*) AS total_customers
FROM customers
GROUP BY Gender;
-- Insight: The customer base consists of 4769 males (47.6%) and 5358 females (53.5%). 
-- The near balance suggests gender-neutral marketing strategies are effective.

-- Q3: Education Level Distribution
SELECT Education_Level, COUNT(*) AS total_customers
FROM customers
GROUP BY Education_Level
ORDER BY total_customers DESC;
-- Insight: 3128 customers (32%) are Graduates, making them the largest group, followed by 2013 (20%). 
-- This shows that educated customers form the core base, suitable for premium offerings.

-- Q4: Marital Status Distribution
SELECT Marital_Status, COUNT(*) AS total_customers
FROM customers
GROUP BY Marital_Status;
-- Insight: 4687 customers (___%) are Married, compared to 3943 (___%) who are Single, and 1497 (___%) in other categories. 
-- Family-oriented benefits could enhance retention among the dominant Married segment.


------------------------------------------------------
-- 2. FINANCIAL BEHAVIOR
------------------------------------------------------

-- Q5: Average Credit Limit by Churn Status
SELECT Attrition_Flag, AVG(Credit_Limit) AS avg_credit_limit
FROM customers
GROUP BY Attrition_Flag;
-- Insight: Active customers hold an average credit limit of 8726 compared to 8136  for churned customers. 
-- This indicates that higher-limit customers are more valuable and loyal.

-- Q6: Average Revolving Balance by Churn Status
SELECT Attrition_Flag, AVG(Total_Revolving_Bal) AS avg_revolving_balance
FROM customers
GROUP BY Attrition_Flag;
-- Insight: Active customers maintain an average revolving balance of 12256.60 versus 672.8230 for churned customers. 
-- Lower balances among churned users suggest weaker financial engagement.

-- Q7: Average Utilization Ratio by Churn Status
SELECT Attrition_Flag, AVG(Avg_Utilization_Ratio) AS avg_utilization_ratio
FROM customers
GROUP BY Attrition_Flag;
-- Insight: The average utilization ratio for active customers is 0.296836 compared to 0.162667 for churned customers. 
-- Higher utilization levels often correlate with greater churn risk.

-- Q8: Transaction Amount & Count by Churn Status
SELECT Attrition_Flag,
       AVG(Total_Trans_Amt) AS avg_transaction_amt,
       AVG(Total_Trans_Ct) AS avg_transaction_count
FROM customers
GROUP BY Attrition_Flag;
-- Insight: Active customers make 68 transactions on average, spending about 4654.
-- Churned customers make only 44 transactions, spending about  3095.
-- This confirms that strong transaction activity signals loyalty.


------------------------------------------------------
-- 3. ENGAGEMENT & ACTIVITY
------------------------------------------------------

-- Q9: Average Inactive Months by Churn Status
SELECT Attrition_Flag, AVG(Months_Inactive_12_mon) AS avg_inactive_months
FROM customers
GROUP BY Attrition_Flag;
-- Insight: Churned customers are inactive for an average of 2.6 months versus 2.2 months for active customers. 
-- Extended inactivity is a strong churn predictor.

-- Q10: Average Contact Count by Churn Status
SELECT Attrition_Flag, AVG(Contacts_Count_12_mon) AS avg_contacts
FROM customers
GROUP BY Attrition_Flag;
-- Insight: Active customers made an average of 2.4 contacts in 12 months, 
-- while churned customers made 2.9. 
-- Very low or very high contact frequency signals higher churn risk.



-- Q11: Relationship count distribution by churn status
SELECT Attrition_Flag, Total_Relationship_Count, COUNT(*) AS customer_count
FROM customers
GROUP BY Attrition_Flag, Total_Relationship_Count
ORDER BY Total_Relationship_Count;
-- Insight: Customers with multiple product relationships (e.g., loans, cards, accounts) 
-- are less likely to churn, showing that cross-product engagement strengthens loyalty.
------------------------------------------------------
-- 4. ADVANCED INSIGHTS
------------------------------------------------------


-- Q12: Income category distribution by churn status
SELECT Attrition_Flag, Income_Category, COUNT(*) AS customer_count
FROM customers
GROUP BY Attrition_Flag, Income_Category
ORDER BY Income_Category;
-- Insight: Customers in lower income brackets, or those who did not disclose income, 
-- show higher churn rates. Premium customers demonstrate stronger retention.

-- Q13: Card category distribution by churn status
SELECT Attrition_Flag, Card_Category, COUNT(*) AS customer_count
FROM customers
GROUP BY Attrition_Flag, Card_Category
ORDER BY Card_Category;
-- Insight: Entry-level (Blue) cardholders account for the majority of churn. 
-- In contrast, premium cardholders such as Platinum users are far more loyal.

-- Q14: Age Distribution by Churn Status
SELECT 
  CASE 
    WHEN Customer_Age < 30 THEN '<30'
    WHEN Customer_Age BETWEEN 30 AND 40 THEN '30-40'
    WHEN Customer_Age BETWEEN 41 AND 50 THEN '41-50'
    WHEN Customer_Age BETWEEN 51 AND 60 THEN '51-60'
    ELSE '60+' END AS age_group,
  Attrition_Flag,
  COUNT(*) AS customer_count
FROM customers
GROUP BY age_group, Attrition_Flag
ORDER BY age_group;
-- Insight: Middle-aged customers (40–50) show the highest churn tendency. 
-- This group may require more personalized engagement to maintain loyalty.

------------------------------------------------------
-- 5. SEGMENTATION (for Dashboard later)
------------------------------------------------------

-- Q15: Churn Rate by Income + Card Category
SELECT Income_Category, Card_Category,
       SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END) AS churned,
       COUNT(*) AS total,
       ROUND(SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Income_Category, Card_Category
ORDER BY churn_rate DESC;
-- Insight: The highest churn rate is seen in the ($40K-$60K)  income group with platinum card, at 100 %. 
-- In contrast, the lowest churn rate is in the ($60K-$80K) income group with platinum card, at 0%.


