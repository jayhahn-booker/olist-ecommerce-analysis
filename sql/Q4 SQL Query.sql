SELECT
    pent.product_category_name_english AS category_name,
    ROUND(AVG(order_items.price), 2) AS AOV,
    ROUND(SUM(order_items.price), 2) AS Total_revenue,
    COUNT(orders.order_id) AS Total_order_volume
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
    category_name
ORDER BY
    AOV DESC;