SELECT
    pent.product_category_name_english AS category_name,
    COUNT(*) AS Total_reviews,
    SUM(CASE WHEN reviews.review_score = 1 THEN 1 ELSE 0 END) AS one_star_reviews,
    ROUND(SUM(CASE WHEN reviews.review_score = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS one_star_rate
FROM
    olist_order_reviews_dataset AS reviews
JOIN
    olist_orders_dataset AS orders
    ON reviews.order_id = orders.order_id
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
    category_name
HAVING
    COUNT(*) >= 100
ORDER BY
    one_star_rate DESC;
