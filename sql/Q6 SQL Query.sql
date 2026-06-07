SELECT
    ROUND(SUM(CASE WHEN number_of_orders > 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS repeat_purchase_rate
FROM (
    SELECT
        customer_unique_id,
        COUNT(order_id) AS number_of_orders
    FROM
        olist_orders_dataset AS orders
    JOIN
        olist_customers_dataset AS customers
        ON orders.customer_id = customers.customer_id
    GROUP BY
        customer_unique_id
) AS customer_order_counts;