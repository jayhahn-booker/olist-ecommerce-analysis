WITH revenue_table AS (
    SELECT
        seller_id,
        SUM(price) AS total_revenue
    FROM
        olist_order_items_dataset
    GROUP BY
        seller_id
),
ranked_sellers AS (
    SELECT
        seller_id,
        total_revenue,
        ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS seller_rank
    FROM
        revenue_table
),
platform_total AS (
    SELECT
        SUM(total_revenue) AS business_total
    FROM
        revenue_table
)
SELECT
    ROUND(SUM(total_revenue) / business_total * 100.0, 2) AS pct_of_revenue
FROM
    ranked_sellers,
    platform_total
WHERE
    seller_rank <= 309;
