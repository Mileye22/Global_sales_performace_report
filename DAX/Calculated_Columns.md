# Calculated Columns

This file documents the calculated columns created in Power BI for the Global Superstore project.

Calculated columns are used for **row-level feature engineering**, where values need to be computed once during data refresh and stored in the table. They are mainly applied for **classification, segmentation, and labeling** (for example, customer type or delivery status), and are used in slicers, legends, and categorical analyses.

All heavy transformations were handled upstream in SQL. Only logic that is required at the row level and reused across visuals was implemented as calculated columns.


| Index | Name | Expression |
|------:|------|------------|
| 0 | Year | `FORMAT(Query1[Order Date], "YYYY")` |
| 1 | Waiting time interval | `SWITCH(TRUE(), Query1[Waiting time] <= 2, "0-2", Query1[Waiting time] <= 4, "3-4", Query1[Waiting time] <= 6, "5-6", Query1[Waiting time] >= 7, "7+")` |
| 2 | Cust_type | `SWITCH(TRUE(), CALCULATE(DISTINCTCOUNT('Query1'[Order ID]), ALLEXCEPT('Query1', 'Query1'[Customer ID])) > 1, "Repeat", "One-time")` |
| 3 | CustTypeSort | `SWITCH('Query1'[Cust_type], "Repeat", 1, "One-time", 2)` |
