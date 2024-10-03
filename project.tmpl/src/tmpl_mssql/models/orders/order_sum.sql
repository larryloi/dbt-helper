SELECT product_type, SUM(qty*net_price) ttl_price, MIN(issued_at) starttime, MAX(completed_at) endtime FROM  DWD.DW_ETL.order_details
  GROUP BY product_type