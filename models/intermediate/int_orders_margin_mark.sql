SELECT orders_id
    , date_date
    , ROUND(SUM(revenue),2) AS total_revenue
    , ROUND(SUM(quantity),2) AS total_qty
    , ROUND(SUM(purchase_cost),2) AS total_purchase_cost
    , ROUND(SUM(margin),2) AS sum_margin
FROM {{ref("int_sales_margin_mark")}}
GROUP BY orders_id, date_date
ORDER BY date_date DESC, orders_id DESC