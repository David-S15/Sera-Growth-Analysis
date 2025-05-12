## Objective

This project, completed as a Growth Analyst at Sera Ltd (a SaaS provider of financial investment data), focused on analyzing subscription payment data from 2022 to 2023. The goal was to understand sales trends, customer retention, and how transaction frequency affects subscription likelihood.


## Tools
- Microsoft Excel – For building dashboards, creating Pivot Tables, and visualizing trends.
- PostgreSQL – To clean, transform, and analyze large datasets using SQL.
- GitHub – For version control and collaboration.

## Technique
- Transformed transaction_date (text to timestamp) and standardized card_type using PostgreSQL.
- Created a cleaned, sales-focused dataset for deeper analysis.
- Built an interactive Excel dashboard with Pivot Tables, slicers, and charts to explore user behavior and key trends.s for deliverables.


## Data Transformation
Transformed transaction_date from text (e.g., "Aug 7th, 2022 06:21:44 PM") to timestamp using TO_TIMESTAMP(), and consolidated card_type (e.g., "Mastercard debit" to "Mastercard") with CASE. A credit_or_debit column was added. Results are stored in a sales view. See the script:

![Data transformation in SQL](https://github.com/David-S15/Sera-Growth-Analysis/blob/main/data_transformations.sql)

## Data Analysis in SQL
Performed SQL-based analysis in PostgreSQL to calculate total transactions, revenue by channel, subscriber activity, and payment trends. Explored data across multiple filters including transaction status, card type, and location. See the script:

![Data Analysis in SQL](https://github.com/David-S15/Sera-Growth-Analysis/blob/main/data_analysis_sera_payments.sql)


## Deliverables

- Monthly revenue trend (NGN/USD).

- Current month revenue/subscriber KPIs with % change.

- Subscriber trend over time.

- Map of payment attempt locations.

- Spread of successful payments by channel, card type, bank.

- User analysis by active months and transaction status.

- Insight: Transaction count vs. subscription likelihood.

 ## Data Modelling and Visualisation

Excel was used to model the data, combining formulas like SUMIFS, COUNTIFS, and UNIQUE to generate key metrics (revenue, user activity, transaction volume).
Visual elements included:

- Line charts for revenue and subscriber growth.
-Comparison charts by payment method and transaction status.

![Data Modelling and Visualisation](https://github.com/David-S15/Sera-Growth-Analysis/blob/main/Sales_data.csv.xlsx)

### Dashboard
A quick look at the dashboard
![Dashboard](https://github.com/David-S15/Sera-Growth-Analysis/blob/main/Dashboard.png)



## Conclusion

Higher transaction counts correlate with increased subscription rates, highlighting the value of encouraging regular user engagement. These insights can help drive targeted strategies for customer retention and growth.
