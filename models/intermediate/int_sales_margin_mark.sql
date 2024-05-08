WITH subquery AS (
    SELECT revenue 
    , orders_id
    , quantity
    , date_date
    , products_id
    , CAST(quantity AS FLOAT64) * CAST(purchase_price AS FLOAT64) AS purchase_cost  
        
FROM {{ref("stg_raw__sales_mark")}}
LEFT JOIN {{ref("stg_raw__product_mark")}}
USING (products_id)
)
SELECT products_id
    , orders_id
    , date_date
    , revenue
    , quantity
    , ROUND(purchase_cost,2) AS purchase_cost
    , ROUND(CAST(revenue AS FLOAT64) - purchase_cost,2) AS margin
    , {{margin_percent(revenue,purchase_cost)}} AS margin_percent
FROM subquery