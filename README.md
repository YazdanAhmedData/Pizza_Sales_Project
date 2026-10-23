# 🍕 Pizza Sales Analysis | SQL & Tableau

![Pizza sales dashboard](https://github.com/user-attachments/assets/17be94e0-4366-4da9-a852-d16762f803af)

![Pizza sales analysis visuals](https://github.com/user-attachments/assets/43bce331-9fc5-436a-afc7-bfa9b322213f)

**Portfolio case study · Sales analytics · SQL · Tableau**

## Executive Summary
This project analyses transactional pizza-order data to understand sales performance, order behaviour, product mix, and demand patterns. SQL is used to calculate business KPIs and answer focused questions; Tableau provides a visual layer for comparing performance over time and across products.

The aim is not simply to produce charts. It is to help a sales or operations manager answer: **what sells, when demand occurs, how much each order contributes, and where menu or inventory decisions deserve a closer look.**

## Business Problem
A restaurant can have thousands of order lines but still struggle to quickly understand its performance. Without consistent KPIs, managers may not know whether sales changes come from order volume, average spend, product mix, pizza size, or time-of-day demand.

This analysis creates a repeatable reporting foundation for:
- Monitoring revenue and order activity.
- Understanding demand by hour, week, category, size, and pizza.
- Identifying products that lead or lag on sales, quantity, and order count.
- Informing menu planning, staffing, stock preparation, and promotional tests.

## KPI Scorecard
| KPI | Definition | Why it matters |
|---|---|---|
| Total Revenue | Sum of `total_price` | Overall sales value |
| Total Orders | Distinct count of `order_id` | Demand / transaction volume |
| Total Pizzas Sold | Sum of `quantity` | Product volume and preparation demand |
| Average Order Value (AOV) | Revenue ÷ distinct orders | Average sales value per order |
| Average Pizzas per Order | Pizzas sold ÷ distinct orders | Basket size and order mix |
| Sales mix by category | Category revenue ÷ total revenue for the same period | Category contribution |
| Sales mix by size | Size revenue ÷ total revenue for the same period | Size preference |
| Product ranking | Revenue, quantity, and distinct orders by pizza | Compare best- and lowest-performing items |
| Hourly / weekly demand | Orders or quantity grouped by time | Demand planning and staffing |

**Calculation note:** the SQL script contains the KPI calculations. Category/size mix percentages should use the same date filter in both numerator and denominator. The current query file's January-filtered denominator makes these percentages a January-specific analysis, not a full-year share.

## Business Questions
1. What are the total revenue, orders, pizzas sold, AOV, and average pizzas per order?
2. At which hours is pizza volume highest or lowest?
3. How does order volume change by week?
4. Which pizza categories and sizes contribute most to sales?
5. Which pizzas rank highest and lowest by revenue, quantity, and orders?
6. Are sales patterns consistent across time, or should operating plans vary by period?

## Insights & Decision Use
Use the results in the SQL outputs and dashboard to complete this decision chain:

- **Demand pattern → operations:** use hourly and weekly trends to plan staffing and prep levels around observed demand rather than averages alone.
- **Product leaders → availability:** protect availability of high-contribution items and review whether their ingredients need more reliable replenishment.
- **Low-performing items → menu review:** investigate whether low sales reflect low demand, price, placement, or limited exposure before removing a product.
- **Category/size mix → promotion design:** compare revenue share and quantity share together; a high unit count does not necessarily mean the highest revenue contribution.
- **AOV and basket size → upsell tests:** test bundles or add-ons and compare AOV and pizzas/order before and after the change.

These are **decision hypotheses**, not claims that a particular product or time slot won without reading the query results. Numeric winners should be copied from reproducible SQL output.

## Technical Workflow
1. Inspect the source data and define the transaction grain.
2. Create the analysis table and load the CSV.
3. Calculate overall KPIs using aggregate SQL.
4. Group and rank data by time, category, size, and product.
5. Visualise the results in Tableau.
6. Translate the results into practical questions for sales and operations teams.

## Tools & Skills
- **PostgreSQL / SQL:** table creation, aggregation, date/time extraction, grouping, ranking, subqueries.
- **Tableau:** dashboarding and visual storytelling.
- **CSV:** transactional data handling.
- **Business analytics:** KPI definitions, product mix, demand analysis, decision framing.

## Repository Guide
| File | Purpose |
|---|---|
| `PIZZA_QUERIES.sql` | SQL schema and analysis queries |
| `PIZZA_PORTFOLIO.twb` | Tableau workbook |
| `PIZZA PROJECT SQL REPORTING.pdf` | SQL reporting output |
| `Dashboard_Glimpse.pdf` | Dashboard preview |
| `pizza_sales.csv` | Source dataset |

## How to Reproduce
1. Create a PostgreSQL database and load `pizza_sales.csv` into a table matching the schema in `PIZZA_QUERIES.sql`.
2. Confirm the date format before running the `TO_DATE` expressions.
3. Run the SQL sections and compare the returned values with the dashboard.
4. Open `PIZZA_PORTFOLIO.twb` in Tableau Desktop and reconnect the data source if your local path differs.
5. Verify date filters and denominators before quoting percentage metrics.

## Limitations & Next Improvements
- The dashboard and SQL should be checked together to ensure KPI definitions match.
- Add validated KPI values and a short findings table from a fresh query run.
- Correct percentage-of-sales denominator logic so it always matches the selected reporting period.
- Add a reproducible data-loading script and a short data dictionary.
- For stronger business conclusions, compare weekday/weekend and seasonal patterns and test whether promotions change AOV or order volume.

## Author
**Yazdan Ahmed** · [GitHub Portfolio](https://github.com/YazdanAhmedData)
