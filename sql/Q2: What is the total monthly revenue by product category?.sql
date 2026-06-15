SELECT
    SUM(order_items.price) AS total_revenue,
    STRFTIME('%Y-%m', orders.order_purchase_timestamp) AS order_time,
    pent.product_category_name_english
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
    ON products.product_category_name = pcnt.product_category_name
GROUP BY
    product_category_name_english,
    order_time
ORDER BY
    order_time DESC;
