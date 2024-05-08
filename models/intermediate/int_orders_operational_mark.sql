SELECT orders_id
    , date_date
    , ROUND(CAST(sum_margin AS FLOAT64) + CAST(shipping_fee AS FLOAT64) - CAST(logcost AS FLOAT64) - CAST(ship_cost AS FLOAT64),2) AS operational_margin
    , total_qty
    , total_revenue
    , total_purchase_cost
    , sum_margin
FROM {{ref("int_orders_margin_mark")}}
JOIN {{ref("stg_raw__ship")}}
USING (orders_id)
ORDER BY date_date DESC, orders_id DESC