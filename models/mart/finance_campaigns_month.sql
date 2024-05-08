WITH subquery AS (
    SELECT *
    , EXTRACT(MONTH FROM date_date) AS datemonth
    FROM {{ref("finance_campaigns_day")}}
)
SELECT datemonth
    , ROUND(SUM(ads_margin),1) AS ads_margin
    , ROUND(SUM(avg_basket),1) AS average_basket
    , ROUND(SUM(operational_margin),1) AS operational_margin
    , ROUND(SUM(ads_cost),1) AS ads_cost
    , ROUND(SUM(ads_impression),1) AS ads_impression
    , ROUND(SUM(ads_click),1) AS ads_click
FROM subquery
GROUP by datemonth