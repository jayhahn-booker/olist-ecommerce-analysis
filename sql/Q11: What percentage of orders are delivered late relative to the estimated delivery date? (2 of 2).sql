SELECT
    product_category_name_english,
    ROUND(SUM(CASE WHEN JULIANDAY(order_delivered_customer_date) > JULIANDAY(order_estimated_delivery_date) THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS percent_late
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
    percent_late DESC;
