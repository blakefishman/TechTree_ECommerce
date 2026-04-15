<div align="center">
  <img width="320px" src="https://github.com/user-attachments/assets/a3cd975d-d088-4e6d-afe6-278468189d8e" />
</div>

## Client Background
Founded in 2018, **TechTree** is a US-based e-commerce retailer specializing in popular consumer electronics and accessories for a global audience via its website and mobile app. The company saw rapid growth during the turbulent era of the COVID-19 pandemic, but had also experienced immense challenges and market shifts.

An in-depth analysis was therefore conducted to evaluate its performance between 2019-2022. This comprehensive review cleans, analyzes, and synthesizes TechTree's data to uncover valuable insights and ultimately provide recommendations to its internal teams for enhancing future performance. Insights and recommendations focus on the following areas:

#### **Northstar Metrics**

* **Sales Trends** - Focusing on Revenue, Order Volume, and Average Order Value (AOV) to evaluate historical sales trends.
* **Product Performance** - Analyzing the company's various products, both individually and by category, to understand their market impact.
* **Loyalty Program Success** - Evaluating the effectiveness and extent of the company's loyalty program on sales.
* **Regional Performance** - Evaluating sales and orders by region.

## Project Resources

* The raw data was loaded into **Google BigQuery** using **Fivetran**.

* The **SQL** queries used to examine the raw data and perform quality checks can be found [here.](https://github.com/blakefishman/TechTree_ECommerce/blob/main/SQL%20Queries/Initial%20Data%20Checks%20and%20Examining.sql)

* The **SQL** queries used to clean, organize, and prepare the raw data for analysis and visualization be found [here](https://github.com/blakefishman/TechTree_ECommerce/blob/main/SQL%20Queries/Cleaning%20Data%20for%20Analysis.sql).

* The **Excel** tables and functions used to analyze the cleaned data can be found here.

* The **PowerBI** visualizations used in the report can be found here.



## Executive Summary
Launching in 2019 and following an all-time peak in late 2020, TechTree experienced a significant downturn in 2022, with **all key performance indicators decrasing year-over-years**: revenue decreased by 46%, order volume by 40%, and average order value (AOV) by 10%. While these results can broadly reflect a post-Covid pandemic market correction, it is important to note that 2022 was also below the pre-Covid pandemic 2019 baseline year. 

This report identifies additional drivers for this decline and highlights strategic areas of opportunity to reverse these trends.

![Overview](https://github.com/user-attachments/assets/c379dfeb-0c38-495a-83e2-ac6e9d05e38f)

## Data Structure & Examination
TechTree's database structure, as seen in the below ERD, consists of four tables: orders, customers, region_lookup, and order_status, with an order row count of 108,127 total records across a customer row count of 87,628 total records.
<div align="center">
  <img width="720" src="https://github.com/user-attachments/assets/ab00381f-dbc1-4c4a-96d1-d1774c6a5e10">
</div>

## Insights Deep-Dive

### Sales Trends
* **TechTree sales reached an all-time high in December 2020** of $1,251,721 from 4,019 orders. This surge reflects broader Covid-19 pandemic macroeconomic trends and shifts in consumer spending.
* 2021 saw the onset of long-term downward trends for all key metrics, departing from the temporary volatility of 2020:
    * **Revenue declined year-over-year for 21 consecutive months** beginning in April 2021.
    * **Order volume declined year-over-year for 13 consecutive months** beginning in December 2021
    * **Average order value (AOV) declined year-over-year from February 2021 onwards**, but saw a brief, one-month reversal in September 2022. This lone uptick was driven by an increased share of laptop sales, the company's highest-AOV product category.

* **Performance reached an all-time low in October 2022** across all key metrics: revenue totaled $178,275, order volume fell to 825, and AOV dropped to $216.35.

* **Q422 sales revenue sharply declined** despite the usual holiday boost. Sales revenue decreased by 48% compared to the previous quarter, and by 72% and 79% for Q421 and Q420 respectively. Order volume followed very closely.
    * While sales revenue declined year-over-year for all 2022 quarters, indicating critical demand issues overall, Q4's decline was notably sharper.
    * Compared to the pre-Covid 2019 baseline, Q422 was still down 45% from Q419


* Overall, for the 2022 year, key performance indicators all declined from the 2021 year: revenue decreased by 46%, order volume decreased by 40%, and AOV decreased by 10%.

![YOY Trends](https://github.com/user-attachments/assets/2b3e5124-f058-430f-8a38-6af14eacf5e0)


### Product Performance
* This README is a work in progress.

![Product Revenue-](https://github.com/user-attachments/assets/beb153f3-acba-4d8a-92d3-0e4a8b3f4443)

### Loyalty Program
* This README is a work in progress.
* t
* t

![Loyalty Program](https://github.com/user-attachments/assets/48ce5af1-da62-44c9-a498-3952c7d806da)


### Regional Performance
* This README is a work in progress.
* t
* t

![Regional](https://github.com/user-attachments/assets/9718f99b-2531-4a84-878c-1d79d517fc50)


## Recommendations

Given the discovered trends, the following recommendations are provided for TechTree:

* This README is a work in progress.
