.

📊 Customer Credit Utilization & Churn Analysis
Power BI | SQL | Excel
A FinTech‑focused product analytics project inspired by CRED‑style customer insights.

🎯 Project Objective
The goal of this project was to analyze credit utilization, customer profiles, and churn risk using the BankChurners dataset. Inspired by product analytics practices at companies like CRED and Navi, the project delivers insights on:

How customers use credit cards (utilization, spending, and inactivity).

Which demographics (education, income, age, gender) drive the most spending.

Early indicators of churn risk such as inactivity and frequent support contacts.

This project simulates real product analytics work in FinTech, where data‑driven insights directly inform retention strategies and customer engagement models.

## 🛠️ Tech Stack
Power BI → Dashboard creation (2 interactive pages)

SQL (PostgreSQL/MySQL syntax) → Supporting queries for customer segmentation & risk analysis

Excel → Data cleaning & preprocessing before BI integration

# Dashboard Pages
## 📍 Page 1: Credit Utilization
Focus: Customer spending, utilization, and churn overview

KPIs:

Total Customers & Attrition Rate (%)

Avg Credit Utilization Ratio

Total Transaction Amount

Customers with High Utilization

Visuals:

Donut Chart: Gender distribution

Gauge: Avg Credit Utilization vs Benchmark

Bar Chart: Card Category vs Avg Spend

Trendline: Monthly Transaction Amounts

KPI Cards for Attrition & Utilization
<img width="1103" height="759" alt="image" src="https://github.com/user-attachments/assets/ce870ea4-5db1-4d92-8275-4b6f0bf247b2" />


Insights:

Clear gender split in customer base, with males slightly higher.

Avg utilization shows most customers stay in the safe 30–40% zone, but a small high‑risk segment uses >70%.

Platinum and Gold cardholders contribute the highest transaction volumes.

## 📍 Page 2: Customer Profile
Focus: Demographics, education, and churn risk

KPIs:

Graduate Customers (Top Spending Group)

Attrition Rate by Education Level

Top Education Segment by Avg Spending

% of Highly Educated Customers

Visuals:

Scatter Plot: Inactivity vs Support Contacts (churn risk cluster)

Bar Chart: Education Level vs Avg Spending

KPI Cards: Graduate Spending & Risk Education Group

Donut Chart: Income Distribution

Slicers: Gender, Income Category, Education Level, Card Category, Age Group
<img width="981" height="651" alt="image" src="https://github.com/user-attachments/assets/cf66de5f-85bf-4758-a6a1-add6fd87f041" />


Insights:

Graduates drive the highest total spend, making them the most valuable segment.

Customers inactive for >6 months yet contacting support frequently show elevated churn risk.

Higher income brackets correlate with higher utilization, aligning with FinTech premium targeting models.

## SQL Analysis
Key queries included:

Overall Churn Rate

Attrition by Gender, Education, and Age Group

High‑Risk Customers: Inactive ≥6 months + Support Contacts ≥4

Spending Trends: By Income Category and Education Level

Utilization Benchmarks: Avg Utilization per Card Category



##  What I Learned
How to design FinTech‑style dashboards that combine KPIs with customer behavior insights.

Translating raw data into actionable business insights like churn risk and segment profitability.

Hands‑on experience with SQL + Power BI integration flow (even though outputs weren’t linked, queries were designed to mirror dashboard visuals).

Understood how CRED‑like companies leverage customer profile analytics to:

Identify high‑value customers

Reduce churn with early risk signals

Personalize offers based on education, income, and utilization

## Industry Relevance
This project simulates the work of a Product Analytics Intern at CRED/Navi, combining technical execution with business impact. The insights can help a FinTech company:

Detect high churn risk segments early

Reward top spenders (e.g., Graduates, Platinum users)

Optimize customer engagement through personalized product strategies

