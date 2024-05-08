SELECT *
    , ROUND(operational_margin - ads_cost,1) AS ads_margin
FROM {{ref("finance_days_mark")}}
JOIN {{ref("int_campaigns_day")}}
USING (date_date)
ORDER BY date_date DESC