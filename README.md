# SaaS-Revenue-Churn-Unit-Economics-Analysis-SQL-Power-BI

## EXECUTIVE SUMMARY

This project analyzes customer churn, revenue trends, and unit economics for a B2B SaaS company. The goal was to identify the drivers of high churn, evaluate customer profitability, and highlight opportunities for sustainable revenue growth.

The analysis reveals a high overall churn rate (52%), particularly concentrated in lower-tier plans and monthly subscriptions. While enterprise customers generate significantly higher lifetime value, entry-level plans show weak retention and low profitability.

Key recommendations include improving pricing strategy, incentivizing annual billing, and targeting high-value customer segments to improve retention and long-term revenue.

##  BUSINESS PROBLEM

CloudTask Pro is experiencing strong customer growth but faces a critical issue: high churn. Leadership needs to understand whether the company is growing sustainably or simply replacing lost customers.

The key questions addressed in this analysis are:

Which customers are most likely to churn?
What are the main drivers of churn?
Are all customer segments equally profitable?
How do churn and acquisition impact long-term revenue?

## METHODOLOGY

Exploratory data analysis using SQL to validate data quality and structure
Churn rate analysis across multiple dimensions (plan, billing cycle, company size, acquisition channel)
Revenue trend analysis using monthly MRR and net customer growth
Unit economics modeling (CLV, CAC, CLV:CAC ratio)
Behavioral analysis using feature usage and NPS to identify at-risk customers
Interactive dashboard built in Power BI for visualization and stakeholder insights

##  SKILLS (this is VERY important)
  ### Tools & Technologies

SQL Server (data querying and aggregation)
Power BI (dashboard development, DAX measures, data modeling)
Excel (initial data validation and exploration)

SQL

GROUP BY aggregations
CASE WHEN logic for churn calculations
Window-style analysis for segmentation
Data cleaning and validation queries

Power BI / DAX

KPI measures (MRR, churn rate, CLV, CAC)
Calculated columns (At-risk segmentation)
Measures using AVERAGE, DIVIDE, CALCULATE
Data modeling across multiple tables
Interactive dashboard design with slicers and filters

Business Concepts

Customer Churn Analysis
Monthly Recurring Revenue (MRR)
Customer Lifetime Value (CLV)
Customer Acquisition Cost (CAC)
Net Revenue Retention
Customer Segmentation

## RESULTS & BUSINESS RECOMMENDATIONS (MOST IMPORTANT)

### Key Findings:
- High overall churn (52%) indicates significant retention issues
- Starter plan has the highest churn (70%), suggesting weak product-market fit or pricing mismatch
- Monthly subscriptions churn significantly more (60%) than annual plans (40%), highlighting billing structure as a key driver
- Top churn drivers are Budget Cuts, Price Sensitivity, and Company Closures
- Enterprise customers generate the highest CLV (~$13.5K), while Starter customers contribute minimal long-term value (~$300)
- CLV:CAC ratio varies significantly, with Enterprise being highly profitable and Starter barely covering acquisition cost
- Over 65% of customers are flagged as at-risk, based on low feature usage and low NPS
### Business Recommendations
Shift focus toward high-value segments (Enterprise & Business) to maximize profitability
Encourage annual billing through discounts or incentives to improve retention
Re-evaluate Starter plan pricing and value proposition to reduce churn
Improve onboarding and feature adoption, as low usage strongly correlates with churn
Target retention strategies for at-risk customers using usage and NPS signals
Optimize acquisition channels to focus on higher-retention customer segments

## NEXT STEPS
Incorporate cohort analysis to better understand retention over time
Track product usage at a more granular feature level
Build predictive churn models using machine learning
Improve data granularity for revenue (e.g., expansion MRR, contraction MRR)
Validate assumptions with real business data and customer feedback
