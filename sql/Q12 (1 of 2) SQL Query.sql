WITH unique_payment AS (
    SELECT
        order_id,
        payment_type,
        SUM(payment_value) AS total_order_value
    FROM
        olist_order_payments_dataset
    GROUP BY
        order_id,
        payment_type
)
SELECT
    product_category_name_english,
    payment_type,
    ROUND(AVG(total_order_value), 2) AS total_value
FROM
    olist_orders_dataset AS orders
JOIN
    unique_payment
    ON orders.order_id = unique_payment.order_id
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
    product_category_name_english,
    payment_type
ORDER BY
    total_value DESC;