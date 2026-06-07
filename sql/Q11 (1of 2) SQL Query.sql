SELECT
    ROUND(SUM(CASE WHEN JULIANDAY(order_delivered_customer_date) > JULIANDAY(order_estimated_delivery_date) THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS percent_late
FROM
    olist_orders_dataset AS orders
WHERE
    order_status = 'delivered';