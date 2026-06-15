SELECT
    customer_state,
    COUNT(orders.order_id) AS order_count,
    ROUND(SUM(order_items.price), 2) AS revenue
FROM
    olist_customers_dataset AS customers
JOIN
    olist_orders_dataset AS orders
    ON customers.customer_id = orders.customer_id
JOIN
    olist_order_items_dataset AS order_items
    ON orders.order_id = order_items.order_id
GROUP BY
    customer_state
ORDER BY
    revenue DESC;
