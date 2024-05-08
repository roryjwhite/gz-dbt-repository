SELECT date_date
    , ROUND(operational_margin - ads_cost,1) AS ads_margin
    , avg_basket
    , operational_margin
    , revenue    
    , nb_transactions
    , ads_cost
    , ads_impression
    , ads_click    
FROM {{ref("finance_days_mark")}}
JOIN {{ref("int_campaigns_day")}}
USING (date_date)
ORDER BY date_date DESC