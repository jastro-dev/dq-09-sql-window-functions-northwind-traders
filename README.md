# Northwind Traders SQL Window Functions Practice

A hands-on practice project using PostgreSQL window functions with the Northwind Traders dataset, focusing on advanced SQL analytics and reporting.

## Project Structure

- `main_notebook.ipynb` - Current working file containing SQL queries and analysis
- `project.sql` files - Initial SQL practice files (archived)

## Implementation Notes

The project switched to Jupyter Notebook format (`.ipynb`) to combine SQL execution with immediate visualization and documentation. This provides a more interactive development environment while maintaining SQL practice integrity.

### Key Features

- Advanced window functions (LAG, LEAD, ROW_NUMBER, RANK)
- Complex CTEs (Common Table Expressions)
- Sales analysis and growth calculations
- Date-based aggregations
- JOIN operations with multiple tables

### Implemented Analyses

1. Employee Performance Rankings
   - Total sales per employee with rank calculations
   - Performance comparisons across the sales team

2. Running Total Monthly Sales
   - Cumulative sales tracking over time
   - Month-over-month growth analysis

3. High-Value Customer Analysis
   - Customer segmentation by order value
   - Above/below average order categorization

4. Category-Based Analysis
   - Percentage sales distribution across product categories
   - Top 3 products per category by sales value

### Example Queries

The repository includes complex queries for various business analytics:

```sql
-- Top Products Per Category Analysis
WITH sales_per_product AS (
    SELECT o.product_id, o.product_name, c.category_id, c.category_name, 
           SUM(o.unit_price * o.quantity * (1 - o.discount)) AS total
    FROM orders_products o
    LEFT JOIN categories c on o.category_id = c.category_id
    GROUP BY o.product_id, o.product_name, c.category_id, c.category_name
)
SELECT product_id, product_name, category_id, category_name, total
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY category_name ORDER BY total DESC) AS pos
    FROM sales_per_product
) AS s
WHERE pos <= 3
```

This query showcases advanced SQL features including CTEs, window functions, and aggregations to identify the top 3 performing products within each category based on total sales value.

### Development Environment

- Database: PostgreSQL 14+
- Jupyter Notebook
- Python 3.8+
- Required Python packages:
  - jupyter
  - psycopg2-binary
  - sqlalchemy
  - python-dotenv
