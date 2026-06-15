SELECT
    product_category_name_english,
    ROUND(AVG(JULIANDAY(order_delivered_customer_date) - JULIANDAY(order_purchase_timestamp)), 2) AS avg_delivery_time
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
WHERE
    order_status = 'delivered'
GROUP BY
    product_category_name_english
ORDER BY
    avg_delivery_time DESC;
