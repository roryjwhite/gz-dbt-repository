SELECT date_date
    , COUNT(orders_id) AS nb_transactions
    , SUM(total_revenue) AS revenue
    , SUM(total_revenue)/COUNT(orders_id) AS avg_basket
    , SUM(sum_margin) AS margin
    , SUM(operational_margin) AS operational_margin
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC