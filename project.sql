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
