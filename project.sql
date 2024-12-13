-- Active: 1734050795078@@127.0.0.1@5432@northwind@public

-- Drop photo column (data type unviewable)
ALTER TABLE employees DROP COLUMN photo;

-- Table List
SELECT
    table_name AS name,
    table_type AS type
FROM information_schema.tables
WHERE
    table_schema = 'public'
    AND table_type IN ('BASE TABLE', 'VIEW');

-- Column List
SELECT
    table_name AS TABLE,
    column_name AS COLUMN,
    ordinal_position AS pos
FROM information_schema.columns
WHERE
    table_schema = 'public';

/*
Create Views for easier querying
*/

-- VIEW: orders_customers 
CREATE VIEW orders_customers AS
SELECT c.company_name, c.contact_name, c.contact_title, c.address, c.city, c.region, c.postal_code, c.country, c.phone, c.fax, o.*
FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id;

-- VIEW: orders_products
CREATE VIEW orders_products AS
SELECT p.product_id, p.product_name, p.supplier_id, p.category_id, p.quantity_per_unit, p.units_in_stock, p.units_on_order, p.reorder_level, p.discontinued, od.order_id, od.unit_price, od.quantity, od.discount, o.customer_id, o.employee_id, o.order_date, o.required_date, o.shipped_date, o.ship_via, o.freight, o.ship_name, o.ship_address, o.ship_city, o.ship_region, o.ship_postal_code, o.ship_country
FROM products p
JOIN order_details od ON p.product_id = od.product_id
JOIN orders o ON od.order_id = o.order_id;

-- VIEW: orders_employees
CREATE VIEW orders_employees AS
SELECT e.employee_id, e.last_name, e.first_name, e.title, e.title_of_courtesy, e.birth_date, e.hire_date, e.address, e.city, e.region, e.postal_code, e.country, e.home_phone, e.extension, e.notes, e.reports_to, o.customer_id, o.order_date, o.required_date, o.shipped_date, o.ship_via, o.freight, o.ship_name, o.ship_address, o.ship_city, o.ship_region, o.ship_postal_code, o.ship_country
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id;