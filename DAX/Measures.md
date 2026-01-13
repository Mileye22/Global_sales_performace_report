# DAX Measures Documentation

## Overview

This document describes all DAX measures used in the Power BI model for the **Global Superstore Analysis** project.  
Measures are grouped by analytical purpose and support insights across **Executive Summary, Sales Performance, Profitability, Operations, Discounts, and Customer Behavior**.

All measures are dynamic, filter-aware, and built on top of a dedicated Date table to support time intelligence.

| Index | Name | Expression |
|------:|------|------------|
| 0 | Total Sales | `SUM(Query1[Sales])` |
| 1 | Avg Sales per Order | `DIVIDE([Total Sales], DISTINCTCOUNT(Query1[Order ID]))` |
| 2 | Sales Growth MOM | `VAR PrevMonth = CALCULATE([Total Sales], DATEADD(Query1[Order Date], -1, MONTH)) RETURN DIVIDE([Total Sales] - PrevMonth, PrevMonth, 0)` |
| 3 | Sales Growth YOY | `VAR PrevYear = CALCULATE([Total Sales], SAMEPERIODLASTYEAR(Query1[Order Date])) RETURN DIVIDE([Total Sales] - PrevYear, PrevYear, 0)` |
| 4 | Total Profit | `SUM(Query1[Profit])` |
| 5 | Profit per Quantity | `VAR TotalQuantity = SUM(Query1[Quantity]) RETURN DIVIDE([Total Profit], TotalQuantity)` |
| 6 | Profit Margin % | `DIVIDE([Total Profit], [Total Sales], 0)` |
| 7 | Total Shipping cost | `SUM(Query1[Shipping Cost])` |
| 8 | Shipping Cost per Order | `DIVIDE([Total Shipping cost], DISTINCTCOUNT(Query1[Order ID]))` |
| 9 | Shipping cost % of sales | `DIVIDE([Total Shipping cost], [Total Sales])` |
|10 | Shipping cost % of Profit | `DIVIDE([Total Shipping cost], [Total Profit])` |
|11 | Total Order Discount | `CALCULATE(COUNTROWS(Query1), Query1[Discount] <> 0)` |
|12 | Avg Discount % | `AVERAGE(Query1[Discount])` |
|13 | Total Quantity | `SUM(Query1[Quantity])` |
|14 | Avg Order Value | `DIVIDE([Total Sales], [Total Order count])` |
|15 | Total Order count | `DISTINCTCOUNT(Query1[Order ID])` |
|16 | Profit per Order | `DIVIDE([Total Profit], [Total Order count])` |
|17 | Profit YOY Growth | `VAR PrevYearProfit = CALCULATE([Total Profit], SAMEPERIODLASTYEAR(Query1[Order Date])) RETURN DIVIDE([Total Profit] - PrevYearProfit, PrevYearProfit, 0)` |
|18 | Profit MOM Growth | `VAR PrevMonth = CALCULATE([Total Profit], DATEADD(Query1[Order Date], -1, MONTH)) RETURN DIVIDE([Total Profit] - PrevMonth, PrevMonth, 0)` |
|19 | Month Abbrev | `N/A` |
|20 | Customer count | `DISTINCTCOUNT(Query1[Customer ID])` |
|21 | Avg Annual Orders | `DIVIDE([Total Order count], DISTINCTCOUNT(DateTable[Year]))` |
|22 | Avg Annual Profit | `DIVIDE([Total Profit], DISTINCTCOUNT(DateTable[Year]))` |
|23 | Avg Customer Value | `DIVIDE([Total Sales], DISTINCTCOUNT(Query1[Customer Name]))` |
|24 | Avg Orders per Customer | `DIVIDE(DISTINCTCOUNT(Query1[Order ID]), DISTINCTCOUNT(Query1[Customer ID]))` |
|25 | Avg Profit Margin | `AVERAGEX(ALLSELECTED(DateTable[Date]), [Profit Margin %])` |
|26 | Avg Yearly Sales | `DIVIDE([Total Sales], DISTINCTCOUNT(DateTable[Year]))` |
|27 | Discount ordered percent | `DIVIDE([Total Order Discount], [Total Order count], 0)` |
|28 | On-time delivery rate | `DIVIDE(CALCULATE(COUNTROWS(Query1), Query1[Waiting time] <= 3), COUNTROWS(Query1))` |
|29 | Order per customer | `CALCULATE(DISTINCTCOUNT(Query1[Order ID]), ALLEXCEPT(Query1, Query1[Customer ID]))` |
|30 | YoY Growth % | `DIVIDE([Rolling 12M Sales] - [Previous 12M Sales], [Previous 12M Sales])` |
|31 | Previous 12M Sales | `CALCULATE([Total Sales], DATESINPERIOD(DateTable[Date], EDATE(MAX(DateTable[Date]), -12), -12, MONTH))` |
|32 | Repeat customer rate | `DIVIDE([Repeat customers], [Customer count])` |
|33 | Repeat customers | `CALCULATE(DISTINCTCOUNT(Query1[Customer ID]), Query1[Cust_type] = "Repeat")` |
|34 | Rolling 12M Sales | `CALCULATE([Total Sales], DATESINPERIOD(DateTable[Date], MAX(DateTable[Date]), -12, MONTH))` |
|35 | Running Total Orders | `CALCULATE([Total Order count], FILTER(ALLSELECTED(DateTable[Date]), DateTable[Date] <= MAX(DateTable[Date])))` |
|36 | Running Total Sales | `CALCULATE([Total Sales], FILTER(ALLSELECTED(DateTable[Date]), DateTable[Date] <= MAX(DateTable[Date])))` |
