WITH order_details AS (
SELECT o.order_id, s.name AS supplier_name, o.status, o.qty, o.net_price, JSON_VALUE(spec,'$.type') AS product_type, issued_at, completed_at
FROM DWD.DW_ETL.orders_demo00 o
JOIN DWD.DW_ETL.suppliers s ON o.supplier_id = s.id
  )
SELECT * FROM order_details;