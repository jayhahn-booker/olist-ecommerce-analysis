SELECT
    product_category_name_english,
    SUM(CASE WHEN order_status = 'canceled' THEN 1 ELSE 0 END) AS canceled_orders,
    COUNT(DISTINCT orders.order_id) AS total_orders,
    ROUND(SUM(CASE WHEN order_status = 'canceled' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT orders.order_id), 2) AS canceled_rate
FROM
    olist_orders_dataset AS orders
JOIN
    olist_order_items_dataset AS order_items
    ON orders.order_id = order_items.order_id
JOIN
    olist_products_dataset AS products
    ON order_items.product_id = products.product_id
JOIN
    product_category_name_translation AS pent
    ON products.product_category_name = pent.product_category_name
GROUP BY
    product_category_name_english
HAVING
    COUNT(DISTINCT orders.order_id) >= 800
ORDER BY
    canceled_rate DESC
LIMIT 10;