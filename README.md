Bank Customer Churn Analysis
📌 Project Overview

This project focuses on analyzing customer churn for a retail bank using the BankChurners dataset.
The goal was to identify customer behavior patterns, evaluate churn risks, and design interactive dashboards that provide insights for both Product Analytics and Product Management roles.

We approached the project in three stages:

Data Cleaning & Preparation (Python / Excel)

SQL Analysis (Customer profiling, churn insights)

Power BI Dashboarding (Two-page dashboard: Utilization Overview & Customer Profile with Churn Risk)

🛠 Tools & Technologies

Python (Pandas, NumPy) → data cleaning & preprocessing

SQL (PostgreSQL / MySQL) → querying and extracting insights

Power BI → dashboard creation & visualization

Excel → quick checks and exploratory analysis

📂 Dataset

Source: BankChurners Dataset (Kaggle)

Rows: ~10,000 customers

Columns Used:

Customer_Age, Gender, Education_Level, Marital_Status

Income_Category, Card_Category, Credit_Limit, Avg_Utilization_Ratio

Total_Trans_Amt, Total_Trans_Ct, Months_Inactive_12_mon

Attrition_Flag (key column for churn analysis)

We removed irrelevant columns such as Naive_Bayes_Classifier_* and redundant identifiers.
Kept CLIENTNUM for customer identification.

🔎 Step 1: Data Cleaning

Checked for null values → none found.

Removed duplicates → none present.

Dropped irrelevant columns (Naive Bayes classifier outputs).

Final cleaned dataset exported as BankChurners_Cleaned.csv.

🛢 Step 2: SQL Analysis

We imported the cleaned dataset into SQL and performed analysis using PostgreSQL.

Key Queries & Insights

Total Customers & Churned Customers

Found total customer count and attrited (churned) count.

Insight: ~16% customers churned, requiring retention strategies.

Churn by Gender

Compared attrition rates between Male vs Female.

Insight: Churn is slightly higher among female customers, suggesting potential dissatisfaction or different expectations.

Churn by Age Group

Grouped customers into age buckets.

Insight: Middle-aged customers (40–50) showed higher attrition risk.

Income vs Attrition

Analyzed income category against churn rate.

Insight: Customers in lower income categories churn more frequently, while high-income customers show better retention.

Card Category & Attrition

Compared Blue, Silver, Gold, Platinum card holders.

Insight: Majority of churn came from Blue card customers.

📌 All SQL queries were stored in a .sql file, and outputs were exported for documentation.

📊 Step 3: Power BI Dashboard

We built a two-page dashboard for executives and product teams.

📍 Page 1: Utilization Overview

KPIs:

Total Customers

Active Customers

Attrited Customers

Churn Rate %

Visuals:

Donut Chart → Customer Distribution by Gender

Bar Chart → Education Level vs Number of Customers

Column Chart → Income Category vs Number of Customers

Line Chart → Avg Utilization Ratio Trend across Age

Insights:

Customer base is balanced across genders.

Graduate customers form the majority, but also show notable churn.

Middle-income groups are the most common cardholders.

Utilization ratio trends peak around mid-age, then decline.

📍 Page 2: Customer Profile & Churn Risk

KPIs:

Graduate %

Avg Months Inactive (12M)

Avg Contacts (12M)

Churn Rate %

Visuals:

Stacked Bar → Marital Status vs Customer Count

Clustered Bar → Card Category vs Average Credit Limit

Column Chart → Education Level vs Attrition Rate

Heatmap → Income Category vs Attrition Rate

Line Chart → Months Inactive vs Attrition Rate

Column Chart → Contacts Count vs Attrition Rate

Insights:

Married customers dominate the customer base.

Blue card holders have lower credit limits and higher attrition.

Attrition increases among customers with lower education levels.

Lower income customers are at highest churn risk.

Inactivity is a strong churn driver — customers inactive >4 months churn significantly more.

High contact frequency correlates with attrition, possibly due to service dissatisfaction.

🎯 Final Business Value

Helped identify high-risk customer segments → low income, inactive >4 months, Blue card holders.

Provided actionable insights for product managers to improve customer retention strategies.

Showed how product analysts can use SQL + BI dashboards to support data-driven decisions.

Demonstrated a full analytics pipeline: from data cleaning → SQL analysis → BI dashboards → business insights.

📖 How This Helps Product Roles

For Product Analysts (PA):

SQL skills to extract and analyze churn trends.

KPI design to track churn risk and customer engagement.

Dashboards that monitor usage patterns.

For Product Managers (PM):

High-level view of churn drivers to plan retention campaigns.

Ability to segment customers for tailored product offerings.

Strategic insights into which segments to prioritize (e.g., inactive, low-income, or specific card categories).


##  What I Learned
How to design FinTech‑style dashboards that combine KPIs with customer behavior insights.

Translating raw data into actionable business insights like churn risk and segment profitability.

Hands‑on experience with SQL + Power BI integration flow (even though outputs weren’t linked, queries were designed to mirror dashboard visuals).

Understood how CRED‑like companies leverage customer profile analytics to:

Identify high‑value customers

Reduce churn with early risk signals

Personalize offers based on education, income, and utilization

