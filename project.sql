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
