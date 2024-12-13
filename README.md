# Northwind Traders SQL Window Functions Practice

A hands-on practice project using PostgreSQL window functions with the Northwind Traders dataset, focusing on advanced SQL analytics and reporting.

## Project Structure

- `main_notebook.ipynb` - Current working file containing SQL queries and analysis
- `project.sql` files - Initial SQL practice files (archived)

## Implementation Notes

The project switched to Jupyter Notebook format (`.ipynb`) to combine SQL execution with immediate visualization and documentation. This provides a more interactive development environment while maintaining SQL practice integrity.

### Key Features

- Advanced window functions (LAG, LEAD, ROW_NUMBER)
- Complex CTEs (Common Table Expressions)
- Sales analysis and growth calculations
- Date-based aggregations
- JOIN operations with multiple tables

### Example Query

The repository includes complex queries like monthly sales growth analysis using window functions:

```sql
WITH total_sales_month AS (
    SELECT DATE_TRUNC('month', order_date)::DATE AS month,
    SUM(unit_price * quantity * (1 - discount)) AS total_sales
    FROM orders o
    LEFT JOIN order_details od ON o.order_id = od.order_id
    GROUP BY DATE_TRUNC('month', order_date)
)
```

### Development Environment

- Database: PostgreSQL 14+
- Jupyter Notebook
- Python 3.8+
- Required Python packages:
  - jupyter
  - psycopg2-binary
  - sqlalchemy
  - python-dotenv
