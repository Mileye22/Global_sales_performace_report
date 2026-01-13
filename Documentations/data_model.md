## Data Model Overview

The data model follows a star schema design consisting of:

### Fact Table
**Query1 (FactOrders)**  
Grain: One row per order line item.

Key measures:
- Sales
- Profit
- Quantity
- Discount
- Shipping Cost
- Waiting Time

Key identifiers:
- Order ID
- Customer ID
- Product ID

Descriptive attributes are denormalized for performance and simplicity.

### Date Dimension
**DateTable**

Contains standard calendar attributes:
- Date
- Year, Quarter, Month, Day
- Month Number
- Year Hierarchy

### Relationships
- DateTable[Date] → Query1[Order Date] (One-to-Many)

## Feature Engineering (Calculated Columns)

Calculated columns were created using DAX to support segmentation and behavioral analysis.

### Customer Type
Classifies customers based on purchase frequency.

Logic:
- Repeat: More than one distinct order
- One-time: Single order

Used in:
- Customer Behavior analysis
- Repeat customer rate KPI

### Waiting Time Interval
Buckets delivery waiting time into ranges:
- 0–2 days
- 3–4 days
- 5–6 days
- 7+ days

Used in:
- Operations & Cost analysis
- Delivery performance evaluation
