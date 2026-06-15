SELECT
    seller_id,
    SUM(price) AS total_revenue,
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM
    olist_order_items_dataset AS order_items
JOIN
    olist_order_reviews_dataset AS reviews
    ON order_items.order_id = reviews.order_id
GROUP BY
    seller_id
ORDER BY
    total_revenue DESC
LIMIT 10;
