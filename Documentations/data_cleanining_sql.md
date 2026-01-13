# Data Cleaning & Feature Engineering (SQL)

## Overview
Raw data was cleaned and transformed using SQL before being loaded into Power BI.  
This ensured consistency, reduced complexity in DAX, and improved model performance.

---

## Key Cleaning Steps

### 1. Region & Market Standardization
The original dataset contained inconsistent region labels such as:
- Generic directions (North, South, East, West)
- Overlapping definitions (e.g., EMEA, APAC subregions)

Regions were standardized into:
- Europe (EU)
- United States (US)
- North America (excluding US)
- South America
- Asia-Pacific
- Middle East
- Africa

This removed ambiguity and improved geographical analysis.

---

### 2. Feature Engineering
Additional features were created in SQL:
- **Delivery Time** = Delivery Date − Order Date
- **Waiting Time Categories** (e.g., 0–3 days, 4–7 days, >7 days)
- **Order Year** for time-series analysis

---

### 3. Data Quality Checks
- Removed duplicate orders
- Ensured valid date ranges
- Validated numeric fields (Sales, Profit, Discount)

---

## Rationale
Performing these steps in SQL:
- Reduced complexity in Power BI
- Improved performance
- Ensured consistent business logic across tools

