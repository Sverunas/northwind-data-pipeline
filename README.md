# Northwind Data Pipeline

Data pipeline built with Python, SQL and dbt.

## Stack
- Python + pandas
- MySQL
- dbt Core

## Models
- `sales_summary` - total sales by country
- `top_countries` - countries with sales > 50,000
- `employee_sales` - sales performance by employee

## How to run
1. Clone the repo
2. Install dependencies: `pip install dbt-core dbt-mysql pandas`
3. Configure `profiles.yml`
4. Run: `dbt run`