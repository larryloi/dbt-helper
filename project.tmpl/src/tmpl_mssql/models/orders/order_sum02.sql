SELECT product_type, SUM(qty*net_price) ttl_price, MIN(issued_at) starttime, MAX(completed_at) endtime 
FROM {{ source('DWD', 'order_dtl') }} 
  GROUP BY product_type