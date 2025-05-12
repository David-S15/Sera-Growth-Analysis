## Objective

As a Growth Analyst at Sera Ltd, a SaaS company providing financial investment data, analyze subscription payment data (2022-2023) to understand sales trends, customer retention, and whether more transactions boost subscription likelihood.


## Tools

- Microsoft Excel (for dashboards and charts)
- SQL (for data views)
- GitHub (for version control)

## Technique

- Transformed transaction_date (text to timestamp) and card_type (consolidated payment processors) using SQL.

- Created a sales view for analysis.

- Built an Excel dashboard with Pivot Tables, filters, and charts for deliverables.


## Data Transformation
Transformed transaction_date from text (e.g., "Aug 7th, 2022 06:21:44 PM") to timestamp using TO_TIMESTAMP(), and consolidated card_type (e.g., "Mastercard debit" to "Mastercard") with CASE. A credit_or_debit column was added. Results are stored in a sales view. See the script:

![Data transformation in SQL](https://github.com/David-S15/Sera-Growth-Analysis/blob/main/data_transformations.sql)

## Data Analysis in SQL
Performed exploratory analysis to calculate total transactions, revenue by channel, subscriber counts, and user activity. Assessed transaction status trends and identified users with multiple active months. Results guided dashboard insights. See the script:

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

The data was modeled in Excel using helper sheets to aggregate metrics like revenue, subscriber counts, and transaction statuses. Pivot Tables summarized payment spreads, while formulas (e.g., COUNTIFS, UNIQUE) calculated user activity. Visualizations include line charts for revenue and subscriber trends, a map for payment locations, and column charts for transaction-subscription analysis, all presented in an interactive dashboard with filters for user exploration. The dashboard is available here:

![Data Modelling and Visualisation](https://github.com/David-S15/Sera-Growth-Analysis/blob/main/Sales_data.csv.xlsx)

## Growth Analysis and recomendation

## Conclusion

Higher transaction counts correlate with increased subscription rates, suggesting targeted engagement for active users.
