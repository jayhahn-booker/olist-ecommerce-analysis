-- ============================================
-- Question 1: Best Performing Product Category
-- Business Domain: Revenue & Growth
-- Description: Identifies the top performing product categories
--              by total gross revenue, ranked highest to lowest.
-- ============================================

SELECT
    pcnt.product_category_name_english,
    SUM(order_items.price) AS total_revenue
FROM
    olist_orders_dataset AS orders
JOIN
    olist_order_items_dataset AS order_items
    ON orders.order_id = order_items.order_id
JOIN
    olist_products_dataset AS products
    ON order_items.product_id = products.product_id
JOIN
    product_category_name_translation AS pcnt
    ON products.product_category_name = pcnt.product_category_name
GROUP BY
    pcnt.product_category_name_english
ORDER BY
    total_revenue DESC;
