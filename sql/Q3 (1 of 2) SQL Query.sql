SELECT
    order_month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY order_month) AS prior_month_revenue,
    ROUND(
        (total_revenue - LAG(total_revenue) OVER (ORDER BY order_month))
        / LAG(total_revenue) OVER (ORDER BY order_month) * 100, 2
    ) AS mom_growth_pct
FROM (
    SELECT
        STRFTIME('%Y-%m', orders.order_purchase_timestamp) AS order_month,
        SUM(order_items.price) AS total_revenue
    FROM
        olist_orders_dataset AS orders
    JOIN
        olist_order_items_dataset AS order_items
        ON orders.order_id = order_items.order_id
    WHERE
        STRFTIME('%Y-%m', orders.order_purchase_timestamp) BETWEEN '2017-02' AND '2018-08'
    GROUP BY
        order_month
) AS monthly_revenue
ORDER BY
    order_month;