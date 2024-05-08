with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id AS products_id,
        CAST(revenue AS FLOAT64) AS revenue,
        CAST(quantity AS FLOAT64) AS quantity

    from source

)

select * from renamed
