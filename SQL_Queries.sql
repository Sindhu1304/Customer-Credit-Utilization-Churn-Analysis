

-- 1. Overall Customer & Churn Metrics
SELECT 
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percentage
FROM BankChurners;

-- 2. Attrition by Gender
SELECT 
    Gender,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM BankChurners
GROUP BY Gender
ORDER BY Attrition_Rate DESC;

-- 3. Attrition by Education Level
SELECT 
    Education_Level,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM BankChurners
GROUP BY Education_Level
ORDER BY Attrition_Rate DESC;

-- 4. Spending by Education Level
SELECT 
    Education_Level,
    ROUND(AVG(Total_Trans_Amt), 2) AS Avg_Spending,
    SUM(Total_Trans_Amt) AS Total_Spending
FROM BankChurners
GROUP BY Education_Level
ORDER BY Total_Spending DESC;

-- 5. Spending by Income Category
SELECT 
    Income_Category,
    ROUND(AVG(Total_Trans_Amt), 2) AS Avg_Spending,
    SUM(Total_Trans_Amt) AS Total_Spending
FROM BankChurners
GROUP BY Income_Category
ORDER BY Avg_Spending DESC;

-- 6. High Risk Customers (Inactive + Frequent Support Contacts)
SELECT 
    Customer_ID,
    Months_Inactive_12_mon,
    Contacts_Count_12_mon,
    Total_Trans_Amt,
    Credit_Limit,
    Attrition_Flag
FROM BankChurners
WHERE Months_Inactive_12_mon >= 6
  AND Contacts_Count_12_mon >= 4
ORDER BY Total_Trans_Amt DESC;

-- 7. Avg Credit Utilization by Card Category
SELECT 
    Card_Category,
    ROUND(AVG(Avg_Utilization_Ratio), 3) AS Avg_Utilization
FROM BankChurners
GROUP BY Card_Category
ORDER BY Avg_Utilization DESC;

-- 8. Age Group vs Attrition
SELECT 
    CASE 
        WHEN Customer_Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN Customer_Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Customer_Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Customer_Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+' 
    END AS Age_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM BankChurners
GROUP BY Age_Group
ORDER BY Attrition_Rate DESC;

