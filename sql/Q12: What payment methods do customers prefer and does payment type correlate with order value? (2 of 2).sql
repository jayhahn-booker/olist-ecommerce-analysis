SELECT
    payment_type,
    COUNT(DISTINCT order_id) AS num_orders,
    ROUND(COUNT(DISTINCT order_id) * 100.0 / (SELECT COUNT(DISTINCT order_id) FROM olist_order_payments_dataset), 2) AS percent_total,
    ROUND(AVG(payment_value), 2) AS avg_order_amount
FROM
    olist_order_payments_dataset
GROUP BY
    payment_type;
