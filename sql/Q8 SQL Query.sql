SELECT
    product_category_name_english,
    ROUND(SUM(review_score) * 1.0 / COUNT(*), 2) AS customer_review_score,
    COUNT(*) AS Total_reviews
FROM
    olist_orders_dataset AS orders
JOIN
    olist_order_reviews_dataset AS reviews
    ON orders.order_id = reviews.order_id
JOIN
    olist_order_items_dataset AS order_items
    ON reviews.order_id = order_items.order_id
JOIN
    olist_products_dataset AS products
    ON order_items.product_id = products.product_id
JOIN
    product_category_name_translation AS pent
    ON products.product_category_name = pent.product_category_name
GROUP BY
    product_category_name_english
HAVING
    COUNT(*) >= 500
ORDER BY
    customer_review_score DESC;