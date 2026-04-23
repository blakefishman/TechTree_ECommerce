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

## Project Components

* The raw data was loaded into **Google BigQuery** using **Fivetran**.

* The **SQL** queries used to examine the raw data and perform quality checks can be found [here.](https://github.com/blakefishman/TechTree_ECommerce/blob/main/SQL%20Queries/Initial%20Data%20Checks%20and%20Examining.sql)

* The **SQL** queries used to clean, organize, and prepare the raw data for analysis and visualization be found [here](https://github.com/blakefishman/TechTree_ECommerce/blob/main/SQL%20Queries/Cleaning%20Data%20for%20Analysis.sql).

* The **Excel** tables and functions used to analyze the cleaned data can be found [here](https://github.com/blakefishman/TechTree_ECommerce/blob/main/TechTree_Excel_Data_Cleaned.7z).

* The **PowerBI** visualizations used in the report can be found [here](https://github.com/blakefishman/TechTree_ECommerce/blob/main/TechTree_PowerBI.pbix).



## Executive Summary
Launching in 2019 and following an all-time peak in late 2020, TechTree experienced a significant downturn in 2022, with all key performance indicators decrasing year-over-years: revenue decreased by 46%, order volume by 40%, and average order value (AOV) by 10%. While these results can broadly reflect a post-Covid pandemic market correction, it is important to note that 2022 was also below the pre-Covid pandemic 2019 baseline year. 

This report identifies additional drivers for this decline and highlights strategic areas of opportunity to reverse these trends.

![Overview](https://github.com/user-attachments/assets/c379dfeb-0c38-495a-83e2-ac6e9d05e38f)

## Data Structure & Examination
TechTree's database structure, seen in the below ERD, consists of four tables: orders, customers, region_lookup, and order_status. The company's book of business totals 108,127 orders across 87,628 customers.

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
* **At least 84% of TechTree's orders have been from just three products**: Apple AirPods Headphones, 27 Inch 4K Gaming Monitor, and the Samsung Charging Cable Pack. These three products accounted for $3.5M in revenue in 2022 at 70% of the year's total. During the pre-Covid 2019 baseline year, these products were 95% of orders, and accounted for $2.8M in revenue at 73% of the year's total.

* The 27 Inch 4K Gaming Monitor has consistently been TechTree's **highest revenue generating product annually**, totaling $9.85M in lifetime revenue and accounting for an average of 35% of annual revenue. Its share of annual revenue and order volume continues to increase year-over-year.

* Conversely, the Bose Soundsport Headphones has consistently been the lowest performing product year-over-year, totaling $3,339 in lifetime revenue and accounting for an average of 0.01% of annual revenue. Despite being introduced in 2020, **the product has sold only 27 times, with no sales recorded in multiple months**.

* Despite the general popularity of Apple products, the Apple iPhone is the second-lowest performing product year-over-year with $213K in lifetime revenue for an average of 0.76% of annual revenue.

* **The Apple MacBook Air Laptop is the largest contributor to AOV** at $1,588, followed by the ThinkPad Laptop at $1,100 and Apple iPhone at $741.

* The Accessories category continues to grow as a share of orders at 31.7% in 2022, up from 21.5% in 2020, which is above the pre-Covid 2019 baseline year of 25.6%. Conversely, the Headphones category has consistently retracted, down from 47.3% in 2020 to 41.7% in 2022, which is below the pre-Covid 2019 baseline year of 48.5%. While accessories remained just 4% of total revenue in 2022, the headphones category constituted 28.6%.

![Product Revenue-](https://github.com/user-attachments/assets/beb153f3-acba-4d8a-92d3-0e4a8b3f4443)

### Loyalty Program
* **The loyalty program has grown consistently since its implementation in 2019**. Loyalty members have increased to 56.2% of annual revenue in 2022, up from 10.5% in 2019. The most significant increases occurred in 2020 and 2021 (18.7% and 24.78% respectively) before slowing to a 2% increase in 2022.

* **Members as a share of revenue peaked at 63.46% in April 2022**, before declining consistently to 35.01% by December 2022, returning to levels not seen since November 2020 (32.98%). This decline, which entered freefall in June 2022, was not observed in prior years, where members as a share of total revenue grew consistently between the months of April and December.

* **Members spent almost $37 more on average than non-members in 2022** ($247.74 to $210.47). Annual order value (AOV) for members has increased favorably since the pre-Covid 2019 baseline, increasing 20.4% while non-member AOV declined -9.9%.

* Average order value (AOV) for members demonstrated greater resilience than non-members for 2022's widespread downward trend in sales, with a pullback of only 1% compared to -19% for non-members between 2021 and 2022.

* **Members have sustained AOV growth beyond the pandemic boom**. Since 2020, member AOV increased 7.8% while non-member AOV decreased 38.7%

![Loyalty Program](https://github.com/user-attachments/assets/48ce5af1-da62-44c9-a498-3952c7d806da)


### Regional Performance
* **North America contributes the most to revenue**, both overall and for each product individually, and generated $2.7M in 2022. Since TechTree's launch in 2019, the region has consistently remained between 51% - 53% of annual order share.

* Conversely, **Latin America is the lowest-performing region** ($256K in 2022), consistently holding only 5-6% of annual order share since 2019.

* Europe, the Middle East, and Africa (EMEA) showed **greater resilience during the sharp 4Q22 downturn**, with a 36% decline in order volume compared to drops of 50%-57% in other regions. This performance boosted EMEA’s order share to 32% (from 26% in 4Q21) as a result, while all other regions decreased between 0.7% and 18.4%.

![Regional](https://github.com/user-attachments/assets/9718f99b-2531-4a84-878c-1d79d517fc50)


## Recommendations

Given the discovered trends, the following recommendations are provided to TechTree for various departments:

* Q4 2022 failed to see the usual holiday boost. **Investigate the performance of Q4 2022's marketing campaigns & promotions** compared to other years to understand what changed or didn't work.

* **Diversifying the product portfolio is essential** due to 84% of orders and 70% of revenue currently coming from just three products.
  * Expanding the growing Accessories category with new product lines, particularly Apple charging cable packs due to prior success with Samsung charging cable packs, 	is a logical next-step to expand the portfolio and complement the company's existing Apple product lineup.
  * Expanding the Monitors category to offer more than just the 27 Inch 4K Gaming Monitor could also prove worthwhile, as this product has consistently been TechTree's 	highest revenue generating product and its share of annual revenue and order volume continues to increase year-over-year.

* **Re-evaluate Bose Soundsport Headphones' viability**. With negligible revenue impact (<0.03% annually) and only 27 lifetime sales, this product should be cleared via bundles or flash sales before discontinuing.

* Since Apple iPhone sales were TechTree’s second-lowest performer in 2022 (just 0.6% of revenue at 0.2% of orders), **offering bundle deals with the Apple AirPods Headphones could significantly boost exposure to the standalone iPhone product offering**, as the AirPods are the company's top-selling product by order count. Strategic marketing aimed at existing Apple customers could further help drive growth for this underperforming but high-AOV product.

* Similarly, **bundling the Apple MacBook Air Laptop with Apple AirPods Headphones could significantly boost annual revenue**, as the former is the company's highest AOV product at $1,588. Even a modest increase in sales for this product, which currently accounts for 17% of 2022 orders, would have an outsized effect.

* **Continue to promote and improve the loyalty program** due to the various advantages that make the program a driver of stable revenue such as higher AOV, consistent growth, and resilience to recent downward trends. Implementing new marketing strategies such as one-time sign-up discounts, free trials of premium benefits, and re-targeting of existing customers can increase conversions for non-members.

* **Investigate EMEA region's greater resilience to Q422's sharp decline**. Identify the specific products, buyer behaviors, or other factors that shielded EMEA from the sharper declines experienced by other regions to see if they can be replicated globally.
