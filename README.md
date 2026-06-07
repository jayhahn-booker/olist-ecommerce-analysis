# Olist E-Commerce Business Performance Analysis

## Project Overview
This project presents a comprehensive analysis of the Brazilian 
Olist E-Commerce dataset using SQL and Python. Analysis of over 
99,000 orders revealed that 96.88% of customers never return for 
a second purchase — suggesting a critical retention problem with 
significant implications for long term revenue sustainability.

Strategic recommendations were developed across four business 
domains: Revenue & Growth, Customer Behavior, Operational 
Performance, and Seller & Product Performance.

## Tools Used
- **SQL (SQLite)** — data querying and business metric calculations
- **Python (Pandas, NumPy)** — statistical analysis and enhanced insights
- **Tableau Public** — executive dashboard and data visualization
- **DB Browser for SQLite** — database management
- **Google Colab** — Python development environment

## Dataset
- **Source:** Olist Brazilian E-Commerce Dataset (Kaggle)
- **Size:** 99,441 orders across 8 relational tables
- **Period:** September 2016 — August 2018
- **Schema:** Hybrid snowflake schema with orders as the central fact table

## Key Findings

### 1. Health & Beauty Dominates Revenue
Health & Beauty was the top performing product category generating 
R$1,258,681.34 in total revenue, followed closely by Watches & Gifts 
at R$1,205,005.68. Watches achieved comparable revenue through higher 
average item prices rather than higher order volume.

### 2. Late Deliveries Create Measurable Revenue Risk
Late deliveries resulted in a 39% drop in customer satisfaction — 
from an average review score of 4.21 for on time orders to just 2.57 
for late orders. R$1,357,314.96 — 8.44% of total revenue — is 
directly associated with dissatisfied customers who experienced 
late deliveries.

### 3. Critical Customer Retention Problem
96.88% of customers never return for a second purchase. Of the 3.12% 
who do return, 93% only purchase twice — indicating a significant 
retention cliff between first and second repeat purchases. Combined 
with seasonal revenue dependency this suggests Olist is rebuilding 
its customer base from scratch every year.

### 4. Extreme Seller Revenue Concentration
The top 1% of sellers — just 30 individuals — control 25.67% of 
total platform revenue. The top 10% of sellers generate 105 times 
more revenue than the bottom 50%, representing both a concentration 
risk and a seller development opportunity.

### 5. Office Furniture Has a Critical Customer Satisfaction Problem
Office Furniture recorded the lowest average review score of 3.49 
among product categories with 500 or more orders, and the highest 
percentage of 1-star ratings in the same group. This suggests a 
systemic product quality or delivery handling issue specific to 
this category that is actively damaging customer satisfaction 
and retention.
